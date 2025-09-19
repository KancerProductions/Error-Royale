local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Config = require(ReplicatedStorage.Modules.Shared["Config.Module"])
local currentWave = 0
function _G.StartWave()
    currentWave += 1
    local count = math.floor(Config.WAVES.START_COUNT * (Config.WAVES.GROWTH^(currentWave-1)))
    print("[Spawner] Wave", currentWave, "spawn", count)
end
