-- Place this in a LocalScript or Script in Roblox Studio

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local gameEvents = ReplicatedStorage:FindFirstChild("GameEvents")

if not gameEvents then
    warn("GameEvents not found in ReplicatedStorage!")
    return
end

print("Listing all GameEvents remotes/services for vulnerability detection:")

for _, child in ipairs(gameEvents:GetChildren()) do
    print(child.Name, child.ClassName)
    -- Optionally, you can hook into RemoteEvents/RemoteFunctions here
    -- if child:IsA("RemoteEvent") then
    --     child.OnClientEvent:Connect(function(...)
    --         print("RemoteEvent triggered:", child.Name, ...)
    --     end)
    -- end
end

-- To detect new remotes added at runtime:
gameEvents.ChildAdded:Connect(function(child)
    print("New remote/service detected:", child.Name, child.ClassName)
end)
