--!strict

local Types = require("../../_Types")

return function()
    return {
        Title = "Trees Page",
        Content = {
            {
                Type = "ListLayout",
                VerticalAlignment = "Top",
                HorizontalAlignment = "Left",
                Padding = 5
            },
            {
                Type = "RichText",
                Text = "To-Do"
            },
            {
                Type = "RichText",
                Text = "[Return home](guidebook://Home)"
            }
        },
    } :: Types.GuidebookPage
end