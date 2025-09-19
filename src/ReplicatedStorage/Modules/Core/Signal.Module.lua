local Signal = {}; Signal.__index = Signal
function Signal.new() return setmetatable({_binds={}}, Signal) end
function Signal:Connect(fn) table.insert(self._binds, fn); return {Disconnect=function() for i,cb in ipairs(self._binds) do if cb==fn then table.remove(self._binds,i) break end end end} end
function Signal:Fire(...) for _,cb in ipairs(self._binds) do task.spawn(cb, ...) end end
return Signal
