local R={};function R.Roll(p)return math.random()<p end;function R.Int(a,b)return math.random(a,b)end;function R.Choice(t)return t[math.random(1,#t)]end;return R
