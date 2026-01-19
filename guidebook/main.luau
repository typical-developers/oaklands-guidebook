--!strict

local Types = require("./_Types")
-- local MaterialValues = require("../api-reference").API.MaterialValues
-- local Translation = require("../api-reference").API.Translation
local Internal = require("../api-reference")

return function()
    return {
        Title = "Oaklands Guidebook",
        Content = {
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

