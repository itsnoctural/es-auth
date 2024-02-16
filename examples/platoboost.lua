local PlatoBoost = loadstring(game:HttpGet("https://raw.githubusercontent.com/itsnoctural/es-auth/main/libs/platoboost.lua"))()
PlatoBoost.accountId = 0 -- Change 0 to your platoboost's account id

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/itsnoctural/es-auth/main/src/source.lua"))()

local FileName = "Key.txt"

Library:CreateWindow({
	title = "Example Title",
	description = "Description",
	serverCode = "HjKDVu2rAH",
    onStartup = function()
        local isNeedKey = not (isfile(FileName) and PlatoBoost:verify(readfile(FileName)))  
        
        if not isNeedKey then
            print("Passed.")
        end

        return isNeedKey
    end,
    onCheck = function(entered)
        local isCorrect = PlatoBoost:verify(entered)

        if isCorrect then
            writefile(FileName, entered)
        end

        return isCorrect
    end,
    onCopy = function() 
        setclipboard(PlatoBoost:getLink())
    end,
})