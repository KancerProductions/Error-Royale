local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Net = require(ReplicatedStorage.Net.Events)
Net.Get("LeaderboardUpdate").OnClientEvent:Connect(function(payload) if typeof(payload)=="table" and typeof(payload.entries)=="table" then print("[LeaderboardUI] entries:", #payload.entries) end end)
