# Error Royal

PvE survival chaos where the **server corrupts itself** every 60s. Floors vanish, mobs duplicate, UI glitches spam, physics goes goofy — survive the errors, flex the clips.

## Quick Start
1) Install **Rojo**
2) In repo root: `rojo serve default.project.json`
3) In Roblox Studio: Rojo → **Connect** → Sync

## Repo Layout (senior dev style)
src/
├─ ReplicatedStorage/Modules/Core # utils (Signal, Maid)
├─ ReplicatedStorage/Modules/Systems # shared systems (RNG, Loot, ChaosClient)
├─ ReplicatedStorage/Modules/Shared # Config, Constants
├─ ReplicatedStorage/Net # Remote Events/Functions + Schemas
├─ ServerScriptService/Game/Services # Chaos, Leaderboard, Reward, Shop, Season, Player
├─ ServerScriptService/Game/Systems # EnemySpawner
├─ ServerScriptService/Game/Jobs # schedulers (WaveTicker)
├─ ServerScriptService/Game/Admin # Debug commands
├─ ServerScriptService/Game/Debug # Profiler, EventLogger
├─ ServerStorage/Data/ChaosEvents # each chaos module Apply/Cleanup
├─ ServerStorage/Data # Rewards, Cosmetics, Mobs
└─ StarterPlayer/StarterPlayerScripts # Controllers + UI (ChaosOverlay, Shop, Leaderboard)


## Rules of the Road
- One script = one job (split ~300 lines)
- Name by role: `*.Server.lua` / `*.Client.lua` / `*.Module.lua`
- Tunables live in `src/ReplicatedStorage/Modules/Shared/Config.Module.lua`
- Canonical name: **Error Royal** (never “PrismSip”)

## License
MIT (see `LICENSE`)

