local Key = "q37Dnp1"
local FileName = "key.txt"
local Link = "https://google.com"

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/itsnoctural/es-auth/main/src/source.lua"))()

Library:CreateWindow({
	title = "Example Title",
	description = "Description",
	serverCode = "HjKDVu2rAH",
    onStartup = function()
        local isNeedKey = not (isfile(FileName) and readfile(FileName) == Key)  
        
        if isNeedKey then
            print("Passed.")
        end

        return isNeedKey
    end,
    onCheck = function(entered)
        local isCorrect = entered == Key

        if isCorrect then
            writefile(FileName, Key)
        end

        return isCorrect
    end,
    onCopy = function() 
        setclipboard(Link)
    end,
})
