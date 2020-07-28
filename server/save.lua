RegisterNetEvent("creator:SaveSkin")
AddEventHandler("creator:SaveSkin", function(skin)
    exports.rFw:SavePlayerSkin(source, skin)
end)