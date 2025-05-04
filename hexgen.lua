-- Copyright (c) 2025 @mrbartix

-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.

local colors = require 'ansicolors' --it's not made by me, made by kikito (https://github.com/kikito/ansicolors.lua) <3
function main()
    print("///////////////////////////////////")
    print('Hello! What do you want me to do? [1, 2, 3 or 4]')
    print("[1] Convert from RGB to hexadecimal;")
    print("[2] Convert from hexadecimal to RGB;")
    print("[3] Generate a random color.")
    print("[4] Abort")
        
    operation = tostring(io.read())
    
    if operation == "1" then
        print("Okay! Input your " .. colors('%{red}RED %{reset}') .. "value [0 - 255]")
        local redValue = tonumber(io.read())
        if redValue ~= nil then --RED check
            if redValue >= 0 and redValue <= 255 then
                redValueChecked = redValue
            else
                print(colors("%{red}ERROR: Your value is not in the range of 0 - 255%{reset}"))
                print("Aborting....")
                runAgain()
            end
        else 
            print(colors("%{red}ERROR: Your value is not in the range of 0 - 255%{reset}"))
            print("Aborting...")
            runAgain()
        end --end of RED

        print("Okay! Input your " .. colors('%{green}GREEN %{reset}') .. "value [0 - 255]")
        local greenValue = tonumber(io.read())
        if greenValue ~= nil then --GREEN check
            if greenValue >= 0 and greenValue <= 255 then
                greenValueChecked = greenValue
            else
                print(colors("%{red}ERROR: Your value is not in the range of 0 - 255%{reset}"))
                print("Aborting....")
                runAgain()
            end
        else 
            print(colors("%{red}ERROR: Your value is not in the range of 0 - 255%{reset}"))
            print("Aborting...")
            runAgain()
        end --end of GREEN

        print("Okay! Input your " .. colors('%{blue}BLUE %{reset}') .. "value [0 - 255]")
        local blueValue = tonumber(io.read())
        if blueValue ~= nil then --BLUE check
            if blueValue >= 0 and blueValue <= 255 then
                blueValueChecked = blueValue
            else
                print(colors("%{red}ERROR: Your value is not in the range of 0 - 255%{reset}"))
                print("Aborting....")
                runAgain()
            end
        else 
            print(colors("%{red}ERROR: Your value is not in the range of 0 - 255%{reset}"))
            print("Aborting...")
            runAgain()
        end --end of BLUE
    -------------------------------------------------- end of getting values
        
        print("Okay, you chose that RGB value: (" .. redValueChecked .. ", " .. greenValueChecked .. ", " .. blueValueChecked .. "). Calculating your hex value...") --END OF OPERATION ONE!!!
        rgbHexConvert(redValueChecked, greenValueChecked, blueValueChecked, false) --converting happens here

    -------------------------------------------------- next operation


    elseif operation == "2" then
        print("Input your hexadecimal color (without the #). Letters must be big e. g. A, B not a, b.")
        inputedValue = tostring(io.read())
        firstofInputed = string.sub(inputedValue, 1, 1) --char 1
        secondofInputed = string.sub(inputedValue, 2, 2) --char 2
        thirdofInputed = string.sub(inputedValue, 3, 3) --char 379419c
        fourthofInputed = string.sub(inputedValue, 4, 4) --char 4
        fifthofInputed = string.sub(inputedValue, 5, 5) --char 5
        sixthofInputed = string.sub(inputedValue, 6, 6) --char 6
        local hexTable = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"}
        ----------
        if string.len(inputedValue) == 6 then
            for _, v in ipairs(hexTable) do
                if v == firstofInputed then
                    firstFound = true
                    break
                end
            end
            for _, v in ipairs(hexTable) do
                if v == secondofInputed then
                    secondFound = true
                    break
                end
            end
            for _, v in ipairs(hexTable) do
                if v == thirdofInputed then
                    thirdFound = true
                    break
                end
            end
            for _, v in ipairs(hexTable) do
                if v == fourthofInputed then
                    fourthFound = true
                    break
                end
            end
            for _, v in ipairs(hexTable) do
                if v == fifthofInputed then
                    fifthFound = true
                    break
                end
            end
            for _, v in ipairs(hexTable) do
                if v == sixthofInputed then
                    sixthFound = true
                    break
                end
            end
            if firstFound and secondFound and thirdFound and fourthFound and fifthFound and sixthFound then
                print("You chose #" .. inputedValue .. " as your color, that you want to conver to RGB! Convering...")
                HexRGBConvert(firstofInputed, secondofInputed, thirdofInputed, fourthofInputed, fifthofInputed, sixthofInputed)
            else
                print(colors('%{red}ERROR: A wrong value! Aborting...%{reset}'))
                runAgain()
            end
        else
            print(colors('%{red}ERROR: A wrong value! Aborting...%{reset}'))
            runAgain()
        end

    elseif operation == "3" then
        local randRed = math.random(0, 255)
        local randGreen = math.random(0, 255)
        local randBlue = math.random(0, 255)
        print("Your random RGB color is: (" .. randRed .. ", " .. randGreen .. ", " .. randBlue  .. ")")
        rgbHexConvert(randRed, randGreen, randBlue, true)
    elseif operation == "4" then
        print(colors('%{red}Bye! Aborting...%{reset}'))
        runAgain()
    else
        print(colors('%{red}ERROR: A wrong value! Aborting...%{reset}')) 
        runAgain()
    end
end

function rgbHexConvert(red, green, blue, random) --converts RGB to HEX
    -- red
    local redValueDevided = red / 16 --gets two needed values for the first (red) bit
    local redValueNoDecimal = math.floor(redValueDevided)
    local redValueDecimal = redValueDevided - redValueNoDecimal
    local redValueDecimalMultiplied = math.floor(redValueDecimal * 16)
    -- green
    local greenValueDevided = green/ 16 --gets two needed values for the second (green) bit
    local greenValueNoDecimal = math.floor(greenValueDevided)
    local greenValueDecimal = greenValueDevided - greenValueNoDecimal
    local greenValueDecimalMultiplied = math.floor(greenValueDecimal * 16)
    -- blue
    local blueValueDevided = blue / 16 --gets two needed values for the second (blue) bit
    local blueValueNoDecimal = math.floor(blueValueDevided)
    local blueValueDecimal = blueValueDevided - blueValueNoDecimal
    local blueValueDecimalMultiplied = math.floor(blueValueDecimal * 16)
    ---------------------------------------------- RED
    if redValueNoDecimal > 9 then --first hex value
        if redValueNoDecimal == 10 then
            redHexFirst = "A"
        elseif redValueNoDecimal == 11 then
            redHexFirst = "B"
        elseif redValueNoDecimal == 12 then
            redHexFirst = "C"
        elseif redValueNoDecimal == 13 then
            redHexFirst = "D"
        elseif redValueNoDecimal == 14 then
            redHexFirst = "E"
        elseif redValueNoDecimal == 15 then
            redHexFirst = "F"
        end
    else
        redHexFirst = redValueNoDecimal
    end

    if redValueDecimalMultiplied > 9 then --second hex value
        if redValueDecimalMultiplied == 10 then
            redHexSecond = "A"
        elseif redValueDecimalMultiplied == 11 then
            redHexSecond = "B"
        elseif redValueDecimalMultiplied == 12 then
            redHexSecond = "C"
        elseif redValueDecimalMultiplied == 13 then
            redHexSecond = "D"
        elseif redValueDecimalMultiplied == 14 then
            redHexSecond = "E"
        elseif redValueDecimalMultiplied == 15 then
            redHexSecond = "F"
        end
    else
        redHexSecond = redValueDecimalMultiplied
    end
    ----------------------------------------------- GREEN
    if greenValueNoDecimal > 9 then --third hex value
        if greenValueNoDecimal == 10 then
            greenHexFirst = "A"
        elseif greenValueNoDecimal == 11 then
            greenHexFirst = "B"
        elseif greenValueNoDecimal == 12 then
            greenHexFirst = "C"
        elseif greenValueNoDecimal == 13 then
            greenHexFirst = "D"
        elseif greenValueNoDecimal == 14 then
            greenHexFirst = "E"
        elseif greenValueNoDecimal == 15 then
            greenHexFirst = "F"
        end
    else
        greenHexFirst = greenValueNoDecimal
    end

    if greenValueDecimalMultiplied > 9 then --fourth hex value
        if greenValueDecimalMultiplied == 10 then
            greenHexSecond = "A"
        elseif greenValueDecimalMultiplied == 11 then
            greenHexSecond = "B"
        elseif greenValueDecimalMultiplied == 12 then
            greenHexSecond = "C"
        elseif greenValueDecimalMultiplied == 13 then
            greenHexSecond = "D"
        elseif greenValueDecimalMultiplied == 14 then
            greenHexSecond = "E"
        elseif greenValueDecimalMultiplied == 15 then
            greenHexSecond = "F"
        end
    else
        greenHexSecond = greenValueDecimalMultiplied
    end
    ----------------------------------------------- BLUE
    if blueValueNoDecimal > 9 then --fifth hex value
        if blueValueNoDecimal == 10 then
            blueHexFirst = "A"
        elseif blueValueNoDecimal == 11 then
            blueHexFirst = "B"
        elseif blueValueNoDecimal == 12 then
            blueHexFirst = "C"
        elseif blueValueNoDecimal == 13 then
            blueHexFirst = "D"
        elseif blueValueNoDecimal == 14 then
            blueHexFirst = "E"
        elseif blueValueNoDecimal == 15 then
            blueHexFirst = "F"
        end
    else
        blueHexFirst = blueValueNoDecimal
    end
    
    if blueValueDecimalMultiplied > 9 then --sixth hex value
        if blueValueDecimalMultiplied == 10 then
            blueHexSecond = "A"
        elseif blueValueDecimalMultiplied == 11 then
            blueHexSecond = "B"
        elseif blueValueDecimalMultiplied == 12 then
            blueHexSecond = "C"
        elseif blueValueDecimalMultiplied == 13 then
            blueHexSecond = "D"
        elseif blueValueDecimalMultiplied == 14 then
            blueHexSecond = "E"
        elseif blueValueDecimalMultiplied == 15 then
            blueHexSecond = "F"
        end
    else
       blueHexSecond = blueValueDecimalMultiplied
    end

    local HexFinalFromRGB = redHexFirst .. redHexSecond .. greenHexFirst .. greenHexSecond .. blueHexFirst .. blueHexSecond --adds all the hex values together to make the final value
    if random == false then --two diffrent texts were needed, for random generated and not random generated (usr inputed)
        print("Your hexadecimal color value is #" .. HexFinalFromRGB)

        runAgain()
    else
        print("And after conversion to hexadecimal it becomes: #" .. HexFinalFromRGB)

        runAgain()
    end
end

function HexRGBConvert(firstNum, secondNum, thirdNum, fourthNum, fifthNum, sixthNum)
    if firstNum == "A" then --checks if first degit is a hex number and swaps it back to base-10
        firstNumNumber = 10 --TRUST ME, firstNumNumber makes sense LMAOOOO
    elseif firstNum == "B" then
        firstNumNumber = 11
    elseif firstNum == "C" then
        firstNumNumber = 12
    elseif firstNum == "D" then
        firstNumNumber = 13
    elseif firstNum == "E" then
        firstNumNumber = 11
    elseif firstNum == "F" then
        firstNumNumber = 12
    else
        firstNumNumber = tonumber(firstNum)
    end
    ---
    if secondNum == "A" then --checks if second degit is a hex number and swaps it back to base-10
        secondNumNumber = 10 
    elseif secondNum == "B" then
        secondNumNumber = 11
    elseif secondNum == "C" then
        secondNumNumber = 12
    elseif secondNum == "D" then
        secondNumNumber = 13
    elseif secondNum == "E" then
        secondNumNumber = 11
    elseif secondNum == "F" then
        secondNumNumber = 12
    else
        secondNumNumber = tonumber(secondNum)
    end
    ---
    if thirdNum == "A" then --checks if third degit is a hex number and swaps it back to base-10
        thirdNumNumber = 10 
    elseif thirdNum == "B" then
        thirdNumNumber = 11
    elseif thirdNum == "C" then
        thirdNumNumber = 12
    elseif thirdNum == "D" then
        thirdNumNumber = 13
    elseif thirdNum == "E" then
        thirdNumNumber = 11
    elseif thirdNum == "F" then
        thirdNumNumber = 12
    else
        thirdNumNumber = tonumber(thirdNum)
    end
    ---
    if fourthNum == "A" then --checks if fourth degit is a hex number and swaps it back to base-10
        fourthNumNumber = 10 
    elseif fourthNum == "B" then
        fourthNumNumber = 11
    elseif fourthNum == "C" then
        fourthNumNumber = 12
    elseif fourthNum == "D" then
        fourthNumNumber = 13
    elseif fourthNum == "E" then
        fourthNumNumber = 11
    elseif fourthNum == "F" then
        fourthNumNumber = 12
    else
        fourthNumNumber = tonumber(fourthNum)
    end
    ---
    if fifthNum == "A" then --checks if fifth degit is a hex number and swaps it back to base-10
        fifthNumNumber = 10 
    elseif fifthNum == "B" then
        fifthNumNumber = 11
    elseif fifthNum == "C" then
        fifthNumNumber = 12
    elseif fifthNum == "D" then
        fifthNumNumber = 13
    elseif fifthNum == "E" then
        fifthNumNumber = 11
    elseif fifthNum == "F" then
        fifthNumNumber = 12
    else
        fifthNumNumber = tonumber(fifthNum)
    end
    ---
    if sixthNum == "A" then --checks if sixth degit is a hex number and swaps it back to base-10
        sixthNumNumber = 10 
    elseif sixthNum == "B" then
        sixthNumNumber = 11
    elseif sixthNum == "C" then
        sixthNumNumber = 12
    elseif sixthNum == "D" then
        sixthNumNumber = 13
    elseif sixthNum == "E" then
        sixthNumNumber = 11
    elseif sixthNum == "F" then
        sixthNumNumber = 12
    else
        sixthNumNumber = tonumber(sixthNum)
    end
    ---------------------------------------------------Calculating
    --Step 2 - devide second, fourth and sixth numbers by 16
    local secondDevided = secondNumNumber / 16
    local fourthDevided = fourthNumNumber / 16
    local sixthDevided = sixthNumNumber / 16
    --Step 3 get RED, GREEN and BLUE values
    local newRedValue = (firstNumNumber + secondDevided) * 16
    local newGreenValue = (thirdNumNumber + fourthDevided) * 16
    local newBlueValue = (fifthNumNumber + sixthDevided) * 16
    --Return the value to the user:
    print("The converted RGB value is: (" .. math.floor(newRedValue) .. ", " .. math.floor(newGreenValue) .. ", " .. math.floor(newBlueValue) .. "). Calculating your hex value...")
    runAgain() --asks to run this script again
end

function runAgain()
    print(colors('%{green}Re-run this script? [Y/n]'))
    local reRun = tostring(io.read())
    if reRun == "Y" then
        main()
    elseif reRun == "n" then
        print(colors('%{red}Bye! Aborting...%{reset}')) 
        os.exit()
    else
        print(colors('%{red}ERROR: A wrong value! Aborting...%{reset}')) 
        os.exit()
    end
end
------------first execute
main()