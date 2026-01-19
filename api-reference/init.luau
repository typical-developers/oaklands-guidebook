-- Has to be initialized like this so we can escape these modules from the sandbox.
-- Do not directly require these modules in other places.

--[[
    Example:
    (BAD) require("../api-reference").API.Translation
    
    (GOOD) local Internal = require("../api-reference")
           . . .
           Internal.API.Translation:FetchTranslation("key")
]]

local APIReference = {}

APIReference.API = {
    MaterialValues = require(script.MaterialValues),
    Translation = require(script.Translation)
}

return APIReference