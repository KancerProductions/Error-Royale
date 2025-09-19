local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Config = require(ReplicatedStorage.Modules.Shared["Config.Module"])
local Net = require(ReplicatedStorage.Net.Events)
local ev = Net.Get("ChaosBroadcast")
local ChaosClient = {}
function ChaosClient.Telegraph(name, duration)
    print("[ChaosClient] Incoming:", name, "in", Config.CHAOS.TELEGRAPH_SEC, "s (dur "..duration.."s)")
end
ev.OnClientEvent:Connect(function(p) if typeof(p)=="table" and p.name then ChaosClient.Telegraph(p.name, p.duration) end end)
return ChaosClient
