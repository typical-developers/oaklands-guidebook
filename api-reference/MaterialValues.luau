--!strict

local MaterialValues = {}

function MaterialValues:GetTreeValue(TreeName: string)
    return {
        Raw = 0,
        Milled = 0,
        Planked = 0
    }
end

function MaterialValues:GetRockValue(RockName: string)
    return {
        Raw = 0,
        Refined = 0,
        Forged = 0
    }
end

function MaterialValues:GetGenericItemValue(ItemName: string)
    return 0
end

return MaterialValues