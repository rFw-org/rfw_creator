local open = false

RegisterNetEvent("OpenSkinCreator")
AddEventHandler("OpenSkinCreator", function()
    openCreatorMenu()
end)

RegisterCommand("creator", function(source, args, rawCommand)
    openCreatorMenu()
end, false)

RMenu.Add('creator', 'main', RageUI.CreateMenu("Creator", "Undefined for using SetSubtitle"))
RMenu:Get('creator', 'main'):SetSubtitle("~b~Skin creator")
RMenu:Get('creator', 'main').EnableMouse = false
RMenu:Get('creator', 'main').Closed = function()
    open = false
end;

RMenu.Add('creator', 'identity', RageUI.CreateSubMenu(RMenu:Get('creator', 'main'), "Identity", "~b~Identity creation"))
RMenu.Add('creator', 'skin', RageUI.CreateSubMenu(RMenu:Get('creator', 'main'), "Skin", "~b~Skin creation"))

local index = {}
local comp = {}
local identity = {
    firstname = "",
    lastname = "",
    dateofbirth = "",
    height = "",
}

function RefreshData()
    TriggerEvent("skinchanger:getData", function(comp_, max)
        open = true
        comp = comp_
        for k,v in pairs(comp) do
            if v.value ~= 0 then
                index[v.name] = v.value
            else
                index[v.name] = 1
            end
            for i,value in pairs(max) do
                if i == v.name then
                    comp[k].max = value
                    comp[k].table = {}
                    for i = 0, value do
                        table.insert(comp[k].table, i)
                    end
                    break
                end
            end
        end
    end)
end

function openCreatorMenu()
    if open then
        open = false
        return
    else
        TriggerEvent("skinchanger:getData", function(comp_, max)
            open = true
            comp = comp_
            for k,v in pairs(comp) do
                if v.value ~= 0 then
                    index[v.name] = v.value
                else
                    index[v.name] = 1
                end
                for i,value in pairs(max) do
                    if i == v.name then
                        comp[k].max = value
                        comp[k].table = {}
                        for i = 0, value do
                            table.insert(comp[k].table, i)
                        end
                        break
                    end
                end
            end
            RageUI.Visible(RMenu:Get('creator', 'main'), not RageUI.Visible(RMenu:Get('creator', 'main')))
        
                      
            Citizen.CreateThread(function()
                while open do

                    RageUI.IsVisible(RMenu:Get('creator', 'main'), function()
                        RageUI.Item.Button('Identity creation', nil, {  }, true, {
                        }, RMenu:Get('creator', 'identity'))

                        RageUI.Item.Button('Skin creation', nil, {  }, true, {
                            onSelected = function()
                                RefreshData()
                            end,
                        }, RMenu:Get('creator', 'skin'))

                        RageUI.Item.Button('Finish', nil, {  }, true, {
                            onSelected = function()
                                if identity.firstname == "" then ShowNotification("Identity not done.")
                                elseif identity.lastname == "" then ShowNotification("Identity not done.")
                                elseif identity.dateofbirth == "" then ShowNotification("Identity not done.")
                                elseif identity.height == "" then ShowNotification("Identity not done.")
                                else
                                    TriggerEvent("skinchanger:getSkin", function(skin)
                                        TriggerServerEvent("creator:SaveSkin", skin, identity)
                                        RageUI.CloseAll()
                                    end)
                                end
                            end,
                        })
                    end)

                    RageUI.IsVisible(RMenu:Get('creator', 'identity'), function()
                        RageUI.Item.Button('Firstname', nil, {RightLabel = "~b~"..identity.firstname }, true, {
                            onSelected = function()
                                if UpdateOnscreenKeyboard() == 0 then return end
                                local string = KeyboardInput()
                                if string ~= "" then
                                    identity.firstname = string 
                                end
                            end,
                        })
                        RageUI.Item.Button('Lastname', nil, {RightLabel = "~b~"..identity.lastname }, true, {
                            onSelected = function()
                                if UpdateOnscreenKeyboard() == 0 then return end
                                local string = KeyboardInput()
                                if string ~= "" then
                                    identity.lastname = string 
                                end
                            end,
                        })
                        RageUI.Item.Button('Date of birth', nil, {RightLabel = "~b~"..identity.dateofbirth }, true, {
                            onSelected = function()
                                if UpdateOnscreenKeyboard() == 0 then return end
                                local string = KeyboardInput()
                                if string ~= "" then
                                    identity.dateofbirth = string 
                                end
                            end,
                        })
                        RageUI.Item.Button('Height', nil, {RightLabel = "~b~"..identity.height }, true, {
                            onSelected = function()
                                if UpdateOnscreenKeyboard() == 0 then return end
                                local string = KeyboardInput()
                                if string ~= "" then
                                    identity.height = string 
                                end
                            end,
                        })
                    end)

                    RageUI.IsVisible(RMenu:Get('creator', 'skin'), function()
                        RageUI.Item.Button('Save skin', nil, {  }, true, {
                            
                        })

                        for k,v in pairs(comp) do
                            if v.table[1] ~= nil then
                                RageUI.Item.List(v.label, v.table, index[v.name], nil, {}, true, {
                                    onListChange = function(Index, Items)
                                        index[v.name] = Index;
                                        TriggerEvent("skinchanger:change", v.name, Index - 1)
                                        TriggerEvent("skinchanger:change", v.name, Index - 1)
                                        RefreshData()
                                        if v.componentId ~= nil then
                                            SetPedComponentVariation(GetPlayerPed(-1), v.componentId, Index - 1, 0, 2)
                                        end
                                    end,
                                    onSelected = function(Index, Items)
                                        TriggerEvent("skinchanger:change", v.name, Index - 1)
                                        if v.componentId ~= nil then
                                            SetPedComponentVariation(GetPlayerPed(-1), v.componentId, Index - 1, 0, 2)
                                        end
                                    end,
                                    onHovered = function()

                                    end,
                                })
                            end
                        end
                    end)


                    Wait(1)
                end
            end)
       end)     
    end
end
