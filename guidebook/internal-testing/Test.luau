--!strict

local Types = require("../_Types")

return function()
    return {
        Title = "Test Page",
        Content = {
            {
                Type = "ListLayout",
                VerticalAlignment = "Top",
                HorizontalAlignment = "Left",
                Padding = 12
            },
            {
                Type = "RichText",
                Text = "This is a test page."
            },
            {
                Type = "RichText",
                Text = "Thanks for visiting! Would you like to [return home](guidebook://Home)? 👋"
            }
        },
    } :: Types.GuidebookPage
end