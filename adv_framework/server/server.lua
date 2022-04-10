ADV = {}
ADV.GM = {}

ADV.GM.Log = function(message)
    print(("^1[^7 ^5ADV^7 ^6Framework^7 ^1]^7 %s"):format(message))
end

ADV.GM.GetIdentifier = function(source, type)
    for k,v in pairs(GetPlayerIdentifiers(source))do
        if type == "steam" then
            if string.sub(v, 1, string.len("steam:")) == "steam:" then
               return v
            end
        elseif type == "license" then
            if string.sub(v, 1, string.len("license:")) == "license:" then
                return v
             end
        elseif type == "discord" then
            if string.sub(v, 1, string.len("discord:")) == "discord:" then
                return v
            end
        elseif type == "ip" then
            if string.sub(v, 1, string.len("ip:")) == "ip:" then
                return v
            end
        end
    end
end

