local RNG = {}; function RNG.Roll(p) return math.random()<p end; function RNG.Int(a,b) return math.random(a,b) end; function RNG.Choice(t) return t[math.random(1,#t)] end; return RNG
