local Maid = {}; Maid.__index = Maid
function Maid.new() return setmetatable({_tasks={}}, Maid) end
function Maid:Give(t) table.insert(self._tasks,t); return t end
function Maid:Cleanup() for i=#self._tasks,1,-1 do local t=self._tasks[i]; if typeof(t)=="RBXScriptConnection" then t:Disconnect() elseif typeof(t)=="function" then pcall(t) elseif t and t.Destroy then pcall(function() t:Destroy() end) end self._tasks[i]=nil end end
return Maid
