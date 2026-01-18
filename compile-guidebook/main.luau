-- Used for compiling everything in ../guidebook/ into a single Roblox model
local fs = require("@lune/fs")
local roblox = require("@lune/roblox")
local net = require("@lune/net")
local process = require("@lune/process")
local serde = require("@lune/serde")
local stdio = require("@lune/stdio")

local multipart = require("./multipart")

local Instance = roblox.Instance

-- Load .env file into process.env

local Result, DotEnv = pcall(function()
    return fs.readFile(".env")
end)

if (Result and DotEnv) then
    print("Loading .env file...")

    for _, Line in string.split(DotEnv, "\n") do
        local Info = string.split(Line, "=")
        local Key = table.remove(Info, 1)
        local Value = table.concat(Info, "=")

        if (not Key or Key == "") then
            continue
        end

        -- Remove \r characters
        Value = string.gsub(Value, "\r", "")

        process.env[Key] = Value
    end

    print("Loaded .env file.")
end

-- Root folder for the compiled guidebook
print("Compiling guidebook...")

local RootFolder = Instance.new("Folder")
RootFolder.Name = "OaklandsGuidebook"

-- Recursively scan a directory and add its contents to the given parent instance
function ScanDirectory(Path: string, ParentInstance: Instance)
    for _, EntryName in pairs(fs.readDir(Path)) do
        local FullPath = `{Path}/{EntryName}`

        if (fs.isFile(FullPath)) then
            print(`Adding file: {FullPath}`)
            local CleanedName = string.gsub(EntryName, "%.luau$", "")

            local FileData = fs.readFile(FullPath)
            local NewScript = Instance.new("ModuleScript")
            NewScript.Name = CleanedName
            NewScript.Source = FileData
            NewScript.Parent = ParentInstance
        elseif (fs.isDir(FullPath)) then
            print(`Scanning directory: {FullPath}`)
            local NewFolder = Instance.new("Folder")
            NewFolder.Name = EntryName
            NewFolder.Parent = ParentInstance

            ScanDirectory(FullPath, NewFolder)
        end
    end
end

-- Scan root directory
print("Scanning guidebook directory...")

ScanDirectory("./guidebook", RootFolder)

-- Compile the model into a readable rbxm
print("Serializing model...")

local ModelFile = roblox.serializeModel({ RootFolder })

-- Upload the model to Roblox
print("Uploading model to Roblox...")

local MultipartData = multipart.new()

MultipartData:setSimple("request", serde.encode("json", {
    assetId = `{process.env.ASSET_ID}`
}))

MultipartData:setSimple("fileContent", ModelFile, "guidebook.rbxm", "model/x-rbxm")

local Headers = {
    ["x-api-key"] = `{process.env.API_KEY}`,
    ["content-type"] = `multipart/form-data; boundary={MultipartData.RANDOM_BOUNDARY}`,
}


local Response = net.request({
    url = `https://apis.roblox.com/assets/v1/assets/{process.env.ASSET_ID}`,
    method = "PATCH",
    headers = Headers,
    body = MultipartData:tostring(),
})

if (Response.statusCode ~= 200) then
    error(`Failed to upload model: {Response.statusCode} - {Response.body}`)
end

print("Successfully uploaded model to Roblox.")