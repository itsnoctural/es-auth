local Library = {}
local AisBoost = loadstring(game:HttpGet("https://raw.githubusercontent.com/itsnoctural/es-auth/main/libs/aisboost.lua"))()
local UI = loadstring(game:HttpGet("https://raw.githubusercontent.com/itsnoctural/es-auth/main/src/source.lua"))()

function debugFly()
    return string.len(game:HttpGet("https://debug.fly.dev")) > 0
end

function Library:Init(Settings)
  UI:CreateWindow({
    title = Settings.Title,
    description = Settings.Description,
    serverCode = Settings.ServerCode,
    supportLabel = Settings.SupportLabel,
    onStartup = function()
      if not debugFly() then
        Settings.Finished = true; return false
      end

      local isNeedKey = not (isfile(Settings.FileName) and AisBoost:Verify(Settings.ApplicationId, readfile(Settings.FileName)))  
      if not isNeedKey then
        Settings.Finished = true
      end

      return isNeedKey
    end,
    onCheck = function(entered)
      local isCorrect = AisBoost:Verify(Settings.ApplicationId, entered)

      if isCorrect then
        Settings.Finished = true
        writefile(Settings.FileName, entered)
      end

      return isCorrect
    end,
    onCopy = function() 
      setclipboard(AisBoost:GetLink(Settings.ApplicationId))
    end,
  })

  repeat task.wait(.1) until Settings.Finished
end

return Library
