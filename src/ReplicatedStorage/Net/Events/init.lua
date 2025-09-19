local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Net = {}
function Net.Get(name)
    local f = ReplicatedStorage:FindFirstChild("NetEvents") or Instance.new("Folder"); f.Name="NetEvents"; f.Parent=ReplicatedStorage
    local e = f:FindFirstChild(name)
    if not e then e = Instance.new("RemoteEvent"); e.Name = name; e.Parent = f end
    return e
end
return Net
