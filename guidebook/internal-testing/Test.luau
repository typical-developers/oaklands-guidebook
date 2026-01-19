--!strict

local Types = require("../_Types")

return function()
    return {
        Title = "Test Page",
        Content = {
            {
                Type = "RichText",
                Text = "This is a test page."
            }
        },
    } :: Types.GuidebookPage
end