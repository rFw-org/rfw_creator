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

local index = {}

function openCreatorMenu()
    if open then
        open = false
        return
    else
        TriggerEvent("skinchanger:getData", function(comp, max)
            open = true
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
                    -- RageUI 1.0.4 ! 

                   RageUI.IsVisible(RMenu:Get('creator', 'main'), true, true, true, function()

                    RageUI.ButtonWithStyle("Save skin", nil, { RightLabel = "→" }, true, function(Hovered, Active, Selected)
                        if (Selected) then
                            TriggerEvent("skinchanger:getSkin", function(skin)
                                TriggerServerEvent("creator:SaveSkin", skin)
                                RageUI.CloseAll()
                            end)
                        end
                    end)
                   
                       for k,v in pairs(comp) do

                           RageUI.List(v.label, v.table, index[v.name], nil, {}, true, function(Hovered, Active, Selected, Index)
                               index[v.name] = Index;
                           end, function(Index, CurrentItems)
                               print(Index - 1)
                               TriggerEvent("skinchanger:change", v.name, Index - 1)
                           end)
                       end
                   
                   end, function()
                   end)
                  
                    -- RageUI 2.0 ! / Not stable yet
--                    RageUI.IsVisible(RMenu:Get('creator', 'main'), function()
--                        for k,v in pairs(comp) do
--                            RageUI.Item.List(v.label, v.table, index[v.name], nil, {}, true, {
--                                onListChange = function(Index, Items)
--                                    print(Index, Items)
--                                    index[v.name] = Index;
--                                    TriggerEvent("skinchanger:change", v.name, Index - 1)
--                                end,
--                                onSelected = function(Index, Items)
--                                    TriggerEvent("skinchanger:change", v.name, Index - 1)
--                                end,
--                                onHovered = function(Index, Items)
--                                    
--                                end
--                            })
--                        end
--                    end)


                    Wait(1)
                end
            end)

            

            
       end)
            
    end
end
