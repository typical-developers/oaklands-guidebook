--!strict

local Types = require("./_Types")
local Internal = require("../api-reference")

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
                Text = "HELLOOOOOO! :) 🚀🚀🚀🚀🚀"
            },
            {
                Type = "RichText",
                Text = "This guidebook is under active development. Stay tuned for more updates!"
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
                Type = "RichText",
                Text = Internal.API.Translation:FetchTranslation("TallRefinedAxe_description")
            }
        },
    } :: Types.GuidebookPage
end

