local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RNG = require(ReplicatedStorage.Modules.Systems["RNG.Module"])
local Loot = {}
function Loot.RollCoins() if RNG.Roll(0.3) then return RNG.Int(5,25) end return 0 end
return Loot
