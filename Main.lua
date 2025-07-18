-- Place this in a LocalScript

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local sellPetRemote = ReplicatedStorage.GameEvents:FindFirstChild("SellPet_RE")

-- Create GUI
local screenGui = Instance.new("ScreenGui", player.PlayerGui)
screenGui.Name = "PetSellGui"

local toggleButton = Instance.new("TextButton", screenGui)
toggleButton.Size = UDim2.new(0, 200, 0, 50)
toggleButton.Position = UDim2.new(0.5, -100, 0.5, -25)
toggleButton.Text = "Sell Held Pet x10000 (OFF)"
toggleButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)

local toggled = false

toggleButton.MouseButton1Click:Connect(function()
    toggled = not toggled
    if toggled then
        toggleButton.Text = "Sell Held Pet x10000 (ON)"
        toggleButton.BackgroundColor3 = Color3.fromRGB(50, 200, 50)

        -- Attempt to find the currently held pet
        local activePet = player:FindFirstChild("ActivePet") -- Change this if your game uses a different property
        if activePet then
            local petId = activePet.Name
            local amount = 1000000

            if sellPetRemote then
                sellPetRemote:FireServer(petId, amount)
                print("Tried to sell held pet:", petId, "for x" .. amount)
            else
                warn("SellPet_RE RemoteEvent not found!")
            end
        else
            warn("No held/active pet found!")
        end
    else
        toggleButton.Text = "Sell Held Pet x10000 (OFF)"
        toggleButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    end
end)
