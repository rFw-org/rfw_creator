function KeyboardInput()
    local amount = nil
    AddTextEntry("CUSTOM_TXT", "Enter text")
    DisplayOnscreenKeyboard(1, "CUSTOM_TXT", '', "", '', '', '', 15)
    print("Passing here ")

    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(0)
    end

    if UpdateOnscreenKeyboard() ~= 2 then
        amount = GetOnscreenKeyboardResult()
        Citizen.Wait(1)
    else
        Citizen.Wait(1)
    end
    return tostring(amount)
end