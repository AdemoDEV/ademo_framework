ADV.GM.Items = {}
ADV.GM.Items.Register = {
    ["bread"] = {weight = 0.5, name = "bread", label = "Pain"},
    ["water"] = {weight = 0.5, name = "water", label = "Eau"},
}


function ADV.GM.Items:GetItem(item)
    if ADV.GM.Items.Register[item] then
        return ADV.GM.Items.Register[item]
    else
        return false
    end 
end

function ADV.GM.Items:GetLabelItem(item)
    if ADV.GM.Items.Register[item] then
        return ADV.GM.Items.Register[item].label
    end 
end

function ADV.GM.Items:GetNameItem(item)
    if ADV.GM.Items.Register[item] then
        return ADV.GM.Items.Register[item].name
    end 
end

function ADV.GM.Items:GetWeightItem(item)
    if ADV.GM.Items.Register[item] then
        return ADV.GM.Items.Register[item].weight
    end 
end


