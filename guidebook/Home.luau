--!strict

local Types = require("./_Types")
local Internal = require("../api-reference")

local HomePages:{ { Image: string, Label: string, Page: string } } = {
    {
        Label = "Trees",
        Image = "rbxassetid://127433876726924",
        Page = "guidebook://resources/trees/Home"
    },
    {
        Label = "Rocks",
        Image = "rbxassetid://121221392882502",
        Page = "guidebook://resources/rocks/Home"
    }
}

return function()
    return {
        Title = "Oaklands Guidebook",
        Content = {
            {
                Type = "ListLayout",
                VerticalAlignment = "Top",
                HorizontalAlignment = "Left",
                Padding = 12
            },
            {
                Type = "RichText",
                Text = "Welcome to the <b>Oaklands Guidebook</b>! This guidebook provides detailed information about the various materials found in Oaklands, including their values and uses."
            },
            {
                Type = "RichText",
                Text = "This is a test entry with a [Redirect Test](guidebook://internal-testing/Test)."
            },
            {
                Type = "Frame",
                Size = UDim2.fromScale(1, 1),
                Transparency = 1,

                Content = {
                    {
                        Type = "GridLayout",
                        Width = 150,
                        Height = 100,
                        HorizontalAlignment = "Center",
                        VerticalAlignment = "Top",
                        Padding = 10,
                    },
                    function()
                        local Buttons: {Types.GuidebookContent} = {}

                        for _,PageInfo in pairs(HomePages) do
                            table.insert(Buttons, {
                                Type = "Frame",
                                Size = UDim2.fromScale(1, 1),
                                Transparency = 1,

                                Content = {
                                    {
                                        Type = "Image",
                                        ImageAssetId = PageInfo.Image,
                                        Size = UDim2.fromScale(1, 1)
                                    },
                                    {
                                        Type = "RichText",
                                        Text = PageInfo.Label,
                                        Position = UDim2.new(0, 0, 1, -5),
                                        Size = UDim2.new(1, 0, 0, 24),
                                        AnchorPoint = Vector2.new(0, 1),
                                        
                                        Style = {
                                            XAlignment = "Center",
                                            FontSize = 22,
                                            FontWeight = Enum.FontWeight.Heavy,
                                            FontStroke = {
                                                Color = Color3.new(0, 0, 0),
                                                Thickness = 2,
                                                Transparency = 0
                                            }
                                        }
                                    },
                                    {
                                        Type = "GenericButton",
                                        Size = UDim2.fromScale(1, 1),
                                        Text = "",
                                        Transparency = 1,
                                        OnClick = function()
                                            Internal.API.Util:OpenPage(PageInfo.Page)
                                        end,
                                        ZIndex = 2
                                    }
                                }
                            } :: Types.Frame)
                        end

                        return Buttons
                    end
                }
            }
        },
    } :: Types.GuidebookPage
end

