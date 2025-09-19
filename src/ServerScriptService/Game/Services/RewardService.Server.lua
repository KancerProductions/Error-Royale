local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
local Config = require(ReplicatedStorage.Modules.Shared["Config.Module"])
local RewardsData = require(ServerStorage.Data:WaitForChild("Rewards"))
local RewardService = {}
function RewardService.AwardWave(player, wave) print(("[Reward] %s +%d coins for wave %d"):format(player.Name, Config.REWARDS.COIN_PER_WAVE, wave)) end
function RewardService.AwardMilestone(player, minutes) local bonus = Config.REWARDS.SURVIVE_MIN_BONUS[minutes]; if bonus then print(("[Reward] %s +%d coins for %dm"):format(player.Name, bonus, minutes)) end end
return RewardService
