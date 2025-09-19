local RS=game:GetService('ReplicatedStorage');local RNG=require(RS.Modules.Systems['RNG.Module']);local L={};function L.RollCoins()if RNG.Roll(0.3)then return RNG.Int(5,25)end return 0 end;return L
