local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Net = require(ReplicatedStorage.Net.Events)
local Schema = require(ReplicatedStorage.Net.Schemas["LeaderboardUpdate"])

local scores = {}
local function publish()
    local entries = {}
    for userId, s in pairs(scores) do
        table.insert(entries, { userId = userId, waves = s.waves or 0, time = s.time or 0, deaths = s.deaths or 0 })
    end
    table.sort(entries, function(a,b) return a.time > b.time end)
    local payload = { entries = entries }
    if Schema.validate(payload) then Net.Get("LeaderboardUpdate"):FireAllClients(payload) end
end
Players.PlayerAdded:Connect(function(p) scores[p.UserId] = { time=0, waves=0, deaths=0 } end)
Players.PlayerRemoving:Connect(function(p) scores[p.UserId] = nil publish() end)
task.spawn(function() while true do task.wait(10) for _,p in ipairs(Players:GetPlayers()) do local s=scores[p.UserId]; if s then s.time += 10 end end publish() end end)
