--!strict

local Types = require("./_Types")
local MaterialValues = require("../api-reference/MaterialValues")

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
        }
    },
} :: Types.GuidebookPage