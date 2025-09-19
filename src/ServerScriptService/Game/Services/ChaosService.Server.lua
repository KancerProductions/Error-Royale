local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
local Config = require(ReplicatedStorage.Modules.Shared["Config.Module"])
local Net = require(ReplicatedStorage.Net.Events)
local Schema = require(ReplicatedStorage.Net.Schemas["ChaosBroadcast"])

local function broadcast(name, duration)
    local payload = { name = name, duration = duration }
    if Schema.validate(payload) then Net.Get("ChaosBroadcast"):FireAllClients(payload) end
end

task.spawn(function()
    while true do
        task.wait(Config.CHAOS.PERIOD_SEC)
        local folder = ServerStorage:FindFirstChild("Data") and ServerStorage.Data:FindFirstChild("ChaosEvents")
        local list = {}
        if folder then for _,m in ipairs(folder:GetChildren()) do if m:IsA("ModuleScript") then table.insert(list, m) end end end
        if #list == 0 then warn("[ChaosService] No chaos modules"); continue end

        local count = math.min(Config.CHAOS.MAX_SIMULTANEOUS, #list)
        local picked = {}
        while #picked < count do
            local c = list[math.random(1,#list)]
            local seen=false; for _,v in ipairs(picked) do if v==c then seen=True end end
            if not seen then table.insert(picked, c) end
        end

        for _,mod in ipairs(picked) do
            local ok, def = pcall(require, mod)
            if ok and type(def)=="table" and def.Apply then
                local duration = def.Duration or Config.CHAOS.DURATION_SEC
                print("[Chaos] Apply", def.Name)
                broadcast(def.Name, duration)
                task.spawn(function()
                    local ctx = { duration = duration }
                    pcall(def.Apply, ctx)
                    task.wait(duration)
                    if def.Cleanup then pcall(def.Cleanup, ctx) end
                    print("[Chaos] Cleanup", def.Name)
                end)
            else
                warn("[ChaosService] bad module", mod.Name)
            end
        end
    end
end)
