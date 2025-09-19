local ServerStorage = game:GetService("ServerStorage")
local Cosmetics = require(ServerStorage.Data:WaitForChild("Cosmetics"))
print("[ShopService] Loaded", #Cosmetics.AURAS, "auras,", #Cosmetics.LOOT_BEAMS, "beams")
