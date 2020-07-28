
fx_version 'adamant'
games { 'gta5' };

-- RageUI 1.0.4
client_scripts {
    "@RageUI/src/client/RMenu.lua",
    "@RageUI/src/client/menu/RageUI.lua",
    "@RageUI/src/client/menu/Menu.lua",
    "@RageUI/src/client/menu/MenuController.lua",
    "@RageUI/src/client/components/Audio.lua",
    "@RageUI/src/client/components/Rectangle.lua",
    "@RageUI/src/client/components/Screen.lua",
    "@RageUI/src/client/components/Sprite.lua",
    "@RageUI/src/client/components/Text.lua",
    "@RageUI/src/client/components/Visual.lua",
    "@RageUI/src/client/menu/elements/ItemsBadge.lua",
    "@RageUI/src/client/menu/elements/ItemsColour.lua",
    "@RageUI/src/client/menu/elements/PanelColour.lua",
    "@RageUI/src/client/menu/items/UIButton.lua",
    "@RageUI/src/client/menu/items/UICheckBox.lua",
    "@RageUI/src/client/menu/items/UIList.lua",
    "@RageUI/src/client/menu/items/UIProgress.lua",
    "@RageUI/src/client/menu/items/UISlider.lua",
    "@RageUI/src/client/menu/items/UISliderHeritage.lua",
    "@RageUI/src/client/menu/items/UISliderProgress.lua",
    "@RageUI/src/client/menu/panels/UIColourPanel.lua",
    "@RageUI/src/client/menu/panels/UIGridPanel.lua",
    "@RageUI/src/client/menu/panels/UIGridPanelHorizontal.lua",
    "@RageUI/src/client/menu/panels/UIPercentagePanel.lua",
    "@RageUI/src/client/menu/panels/UIStatisticsPanel.lua",
    "@RageUI/src/client/menu/windows/UIHeritage.lua",
}

-- RageUI 2.0
--client_scripts {
--    "RageUI/RMenu.lua",
--    "RageUI/menu/RageUI.lua",
--    "RageUI/menu/Menu.lua",
--    "RageUI/menu/MenuController.lua",
--    "RageUI/components/Audio.lua",
--    "RageUI/components/Enum.lua",
--    "RageUI/components/Keys.lua",
--    "RageUI/components/Rectangle.lua",
--    "RageUI/components/Sprite.lua",
--    "RageUI/components/Text.lua",
--    "RageUI/components/Visual.lua",
--    "RageUI/menu/elements/ItemsBadge.lua",
--    "RageUI/menu/elements/ItemsColour.lua",
--    "RageUI/menu/elements/PanelColour.lua",
--    "RageUI/menu/items/UIButton.lua",
--    "RageUI/menu/items/UICheckBox.lua",
--    "RageUI/menu/items/UIList.lua",
--    "RageUI/menu/items/UIProgress.lua",
--    "RageUI/menu/items/UISeparator.lua",
--    "RageUI/menu/items/UISlider.lua",
--    "RageUI/menu/items/UISliderHeritage.lua",
--    "RageUI/menu/items/UISliderProgress.lua",
--    "RageUI/menu/panels/UIButtonPanel.lua",
--    "RageUI/menu/panels/UIColourPanel.lua",
--    "RageUI/menu/panels/UIGridPanel.lua",
--    "RageUI/menu/panels/UIPercentagePanel.lua",
--    "RageUI/menu/panels/UIStatisticsPanel.lua",
--    "RageUI/menu/windows/UIHeritage.lua",
--}


client_scripts {
    "config.lua",
    "@rFw/client/shared.lua",
    "client/*.lua",
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    "config.lua",
    "server/*.lua",
}