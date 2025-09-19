local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Net = require(ReplicatedStorage.Net.Events)
Net.Get("ChaosBroadcast").OnClientEvent:Connect(function(p) if typeof(p)=="table" and p.name then print("[UI] CHAOS:", p.name, "("..p.duration.."s)") end end)
