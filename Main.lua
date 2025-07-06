--[[
GAG SCRIPT BY:BREAD
Modern Sidebar GUI (Restarted)
--]]

print("[GAG] Script started")

-- Services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")

-- Main GUI
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "GAG_SidebarGUI"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.Parent = playerGui
print("[GAG] ScreenGui parented to PlayerGui")

local function safeFind(parent, child)
    if parent then
        return parent:FindFirstChild(child)
    end
    return nil
end

-- Sidebar Frame
local sidebar = Instance.new("Frame")
sidebar.Name = "Sidebar"
sidebar.Size = UDim2.new(0, 520, 0, 480) -- Increased width and height
sidebar.Position = UDim2.new(0.5, -260, 0.5, -240)
sidebar.BackgroundColor3 = Color3.fromRGB(120, 130, 150)
sidebar.BorderSizePixel = 0
sidebar.Parent = screenGui
sidebar.Visible = true

-- Top Bar
local topBar = Instance.new("Frame")
topBar.Name = "TopBar"
topBar.Size = UDim2.new(1, 0, 0, 44) -- Increased height
topBar.Position = UDim2.new(0, 0, 0, 0)
topBar.BackgroundColor3 = Color3.fromRGB(80, 90, 110)
topBar.BorderSizePixel = 0
topBar.Parent = sidebar
topBar.ZIndex = 30 -- Ensure top bar is always on top

local topBarTitle = Instance.new("TextLabel")
topBarTitle.Name = "TopBarTitle"
topBarTitle.Size = UDim2.new(1, -80, 1, 0)
topBarTitle.Position = UDim2.new(0, 12, 0, 0)
topBarTitle.BackgroundTransparency = 1
topBarTitle.Text = "GAG SCRIPT BY:BREAD"
topBarTitle.Font = Enum.Font.SourceSansBold
topBarTitle.TextSize = 24
topBarTitle.TextColor3 = Color3.fromRGB(40, 40, 40)
topBarTitle.TextXAlignment = Enum.TextXAlignment.Left
topBarTitle.Parent = topBar
topBarTitle.ZIndex = 31

local minimizeBtn = Instance.new("TextButton")
minimizeBtn.Name = "MinimizeBtn"
minimizeBtn.Size = UDim2.new(0, 32, 1, 0)
minimizeBtn.Position = UDim2.new(1, -64, 0, 0)
minimizeBtn.BackgroundColor3 = Color3.fromRGB(80, 90, 110)
minimizeBtn.Text = "_"
minimizeBtn.Font = Enum.Font.SourceSansBold
minimizeBtn.TextSize = 22
minimizeBtn.TextColor3 = Color3.fromRGB(0,0,0)
minimizeBtn.Parent = topBar
minimizeBtn.ZIndex = 32

local closeBtn = Instance.new("TextButton")
closeBtn.Name = "CloseBtn"
closeBtn.Size = UDim2.new(0, 32, 1, 0)
closeBtn.Position = UDim2.new(1, -32, 0, 0)
closeBtn.BackgroundColor3 = Color3.fromRGB(120, 40, 40)
closeBtn.Text = "✕"
closeBtn.Font = Enum.Font.SourceSansBold
closeBtn.TextSize = 22
closeBtn.TextColor3 = Color3.fromRGB(255,255,255)
closeBtn.Parent = topBar
closeBtn.ZIndex = 32

-- Minimize/Close functionality
minimizeBtn.MouseButton1Click:Connect(function()
    sidebar.Visible = not sidebar.Visible
end)
closeBtn.MouseButton1Click:Connect(function()
    screenGui.Enabled = false
end)

-- Sidebar Tabs
local tabNames = {"EVENT", "SHOP", "FARM"}
local tabButtons = {}
for i, name in ipairs(tabNames) do
    local tabBtn = Instance.new("TextButton")
    tabBtn.Name = name .. "TabBtn"
    tabBtn.Size = UDim2.new(0, 120, 0, 54)
    tabBtn.Position = UDim2.new(0, 0, 0, 44 + (i-1)*54)
    tabBtn.BackgroundColor3 = i == 1 and Color3.fromRGB(220, 160, 80) or Color3.fromRGB(80, 90, 110)
    tabBtn.Text = name
    tabBtn.Font = Enum.Font.SourceSansBold
    tabBtn.TextSize = 24
    tabBtn.TextColor3 = Color3.fromRGB(40, 40, 40)
    tabBtn.BorderSizePixel = 0
    tabBtn.Parent = sidebar
    tabBtn.ZIndex = 20 -- Always on top
    tabButtons[name] = tabBtn
end

-- Vertical Black Line
local navLine = Instance.new("Frame")
navLine.Size = UDim2.new(0, 4, 1, -44)
navLine.Position = UDim2.new(0, 120, 0, 44)
navLine.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
navLine.BorderSizePixel = 0
navLine.Parent = sidebar

-- Main Content Frame (ensure correct position and ZIndex)
local contentFrame = Instance.new("Frame")
contentFrame.Name = "ContentFrame"
contentFrame.Size = UDim2.new(1, -124, 1, -44)
contentFrame.Position = UDim2.new(0, 124, 0, 44)
contentFrame.BackgroundColor3 = Color3.fromRGB(120, 130, 150)
contentFrame.BorderSizePixel = 0
contentFrame.Parent = sidebar
contentFrame.ZIndex = 21 -- Above sidebar, below top bar

-- Tab Content (ensure ZIndex and parent)
local tabContent = {}
for _, name in ipairs(tabNames) do
    local frame = Instance.new("Frame")
    frame.Name = name .. "TabContent"
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.BackgroundTransparency = 1
    frame.Visible = (name == "EVENT")
    frame.Parent = contentFrame
    frame.ZIndex = 21 -- Above sidebar, below top bar
    tabContent[name] = frame
end

-- EVENT TAB CONTENT
local eventFrame = tabContent["EVENT"]
local eventHeader = Instance.new("TextLabel")
eventHeader.Size = UDim2.new(1, -32, 0, 40)
eventHeader.Position = UDim2.new(0, 16, 0, 16)
eventHeader.BackgroundColor3 = Color3.fromRGB(40, 90, 180)
eventHeader.Text = "SUMMER HARVEST"
eventHeader.Font = Enum.Font.SourceSansBold
eventHeader.TextSize = 22
eventHeader.TextColor3 = Color3.fromRGB(255,255,255)
eventHeader.BorderSizePixel = 0
eventHeader.TextXAlignment = Enum.TextXAlignment.Center
eventHeader.Parent = eventFrame
eventHeader.ZIndex = 22

local autoSubmitToggle = Instance.new("TextButton")
autoSubmitToggle.Name = "AutoSubmitToggle"
autoSubmitToggle.Size = UDim2.new(1, -32, 0, 36)
autoSubmitToggle.Position = UDim2.new(0, 16, 0, 64)
autoSubmitToggle.BackgroundColor3 = Color3.fromRGB(60, 90, 130)
autoSubmitToggle.Text = "AUTO SUBMIT:"
autoSubmitToggle.Font = Enum.Font.SourceSansBold
autoSubmitToggle.TextSize = 20
autoSubmitToggle.TextColor3 = Color3.fromRGB(255,255,255)
autoSubmitToggle.BorderSizePixel = 0
autoSubmitToggle.TextXAlignment = Enum.TextXAlignment.Left
autoSubmitToggle.Parent = eventFrame
autoSubmitToggle.ZIndex = 22

local check = Instance.new("TextLabel")
check.Name = "Checkmark"
check.Size = UDim2.new(0, 32, 1, 0)
check.Position = UDim2.new(1, -36, 0, 0)
check.BackgroundTransparency = 1
check.Font = Enum.Font.SourceSansBold
check.TextSize = 24
check.TextColor3 = Color3.fromRGB(220, 220, 220)
check.Text = ""
check.Parent = autoSubmitToggle
check.ZIndex = 23

local autoSubmitState = false
local function updateAutoSubmitToggle()
    autoSubmitToggle.BackgroundColor3 = autoSubmitState and Color3.fromRGB(40, 90, 180) or Color3.fromRGB(60, 90, 130)
    check.Text = autoSubmitState and "✔" or ""
end
updateAutoSubmitToggle()
autoSubmitToggle.MouseButton1Click:Connect(function()
    autoSubmitState = not autoSubmitState
    updateAutoSubmitToggle()
end)

-- SHOP TAB CONTENT (Refactored Dropdowns)
local shopFrame = tabContent["SHOP"]

-- Dropdown Data
local gearOptions = {
    "Sword", "Shield", "Bow", "Staff", "Axe", "Hammer", "Sickle", "Hoe", "Watering Can", "Sprinkler"
}
local gearDetails = {
    ["Sword"] = "Basic attack tool.",
    ["Shield"] = "Blocks damage.",
    ["Bow"] = "Ranged attack.",
    ["Staff"] = "Magic boost.",
    ["Axe"] = "Chop trees.",
    ["Hammer"] = "Break rocks.",
    ["Sickle"] = "Harvest crops.",
    ["Hoe"] = "Till soil.",
    ["Watering Can"] = "Waters plants.",
    ["Sprinkler"] = "Waters automatically."
}
local eggOptions = {
    "Common Egg", "Uncommon Egg", "Rare Egg", "Legendary Egg", "Mythical Egg", "Bug Egg", "Exotic Bug Egg", "Night Egg", "Premium Night Egg", "Bee Egg", "Anti Bee Egg", "Premium Anti Bee Egg", "Common Summer Egg", "Rare Summer Egg", "Paradise Egg", "Oasis Egg", "Premium Oasis Egg"
}
local eggDetails = {
    ["Common Egg"] = "50,000 | Golden Lab, Dog, Bunny (33.33% each)",
    ["Uncommon Egg"] = "150,000 | Black Bunny, Chicken, Cat, Deer (25% each)",
    ["Rare Egg"] = "600,000 | Orange Tabby, Spotted Deer, Pig, Rooster, Monkey",
    ["Legendary Egg"] = "3,000,000 | Cow, Silver Monkey, Sea Otter, Turtle, Polar Bear",
    ["Mythical Egg"] = "8,000,000 | Grey Mouse, Brown Mouse, Squirrel, Red Giant Ant, Red Fox",
    ["Bug Egg"] = "50,000,000 | Snail, Giant Ant, Caterpillar, Praying Mantis, Dragonfly",
    ["Exotic Bug Egg"] = "Limited Time Shop",
    ["Night Egg"] = "25M/50M | Hedgehog, Mole, Frog, Echo Frog, Night Owl, Raccoon",
    ["Premium Night Egg"] = "199 | Hedgehog, Mole, Frog, Echo Frog, Night Owl, Raccoon",
    ["Bee Egg"] = "18 | Bee, Honey Bee, Bear Bee, Petal Bee, Queen Bee",
    ["Anti Bee Egg"] = "Crafting | Wasp, Tarantula Hawk, Moth, Butterfly, Disco Bee",
    ["Premium Anti Bee Egg"] = "199 | Limited Time Shop",
    ["Common Summer Egg"] = "1,000,000 | Starfish, Seagull, Crab",
    ["Rare Summer Egg"] = "25,000,000 | Flamingo, Toucan, Sea Turtle, Orangutan, Seal",
    ["Paradise Egg"] = "50,000,000 | Ostrich, Peacock, Capybara, Scarlet Macaw, Mimic Octopus",
    ["Oasis Egg"] = "10 | Meerkat, Sand Snake, Axolotl, Hyacinth Macaw, Fennec Fox",
    ["Premium Oasis Egg"] = "199 | Limited Time Shop"
}
local seedOptions = {
    "Carrot", "Strawberry", "Blueberry", "Tomato", "Cauliflower", "Watermelon", "Rafflesia", "Green Apple", "Avocado", "Banana", "Pineapple", "Kiwi", "Bell Pepper", "Prickly Pear", "Loquat", "Feijoa", "Pitcher Plant", "Sugar Apple"
}
local seedDetails = {
    ["Carrot"] = "10 | Common | 5-25 | ✗/✓",
    ["Strawberry"] = "50 | Common | 1-6 | ✓/✓",
    ["Blueberry"] = "400 | Uncommon | 1-5 | ✓/✓",
    ["Tomato"] = "800 | Rare | 1-3 | ✓/✓",
    ["Cauliflower"] = "1,300 | Rare | 1-4 | ✓/✓",
    ["Watermelon"] = "2,500 | Rare | 1-7 | ✗/✓",
    ["Rafflesia"] = "3,200 | Legendary | 1-? | ✗/✓",
    ["Green Apple"] = "3,500 | Legendary | 1 | ✓/✓",
    ["Avocado"] = "5,000 | Legendary | 1 | ✓/✓",
    ["Banana"] = "7,000 | Legendary | 1 | ✓/✓",
    ["Pineapple"] = "7,500 | Mythical | 1 | ✓/✓",
    ["Kiwi"] = "10,000 | Mythical | 1 | ✓/✓",
    ["Bell Pepper"] = "55,000 | Mythical | 1 | ✓/✓",
    ["Prickly Pear"] = "555,000 | Mythical | 1 | ✓/✓",
    ["Loquat"] = "900,000 | Divine | 1 | ✓/✓",
    ["Feijoa"] = "2,750,000 | Divine | 1 | ✓/✓",
    ["Pitcher Plant"] = "7,500,000 | Divine | 1 | ✓/✓",
    ["Sugar Apple"] = "25,000,000 | Prismatic | 1"
}

-- Multi-select state
local selectedGear = {}
local selectedEggs = {}
local selectedSeeds = {}

-- Dropdown UI Factory
local function createDropdown(parent, labelText, options, details, selectedTable)
    local dropdownBtn = Instance.new("TextButton")
    dropdownBtn.Size = UDim2.new(1, -40, 0, 44)
    dropdownBtn.BackgroundColor3 = Color3.fromRGB(40, 90, 180)
    dropdownBtn.Text = labelText
    dropdownBtn.Font = Enum.Font.SourceSansBold
    dropdownBtn.TextSize = 22
    dropdownBtn.TextColor3 = Color3.fromRGB(255,255,255)
    dropdownBtn.BorderSizePixel = 0
    dropdownBtn.TextXAlignment = Enum.TextXAlignment.Center
    dropdownBtn.Parent = parent
    dropdownBtn.ZIndex = 2

    local dropdownList = Instance.new("ScrollingFrame")
    dropdownList.Size = UDim2.new(1, -40, 0, 0)
    dropdownList.BackgroundColor3 = Color3.fromRGB(60, 120, 180)
    dropdownList.BorderSizePixel = 0
    dropdownList.Visible = false
    dropdownList.Parent = parent
    dropdownList.ZIndex = 3
    dropdownList.ClipsDescendants = true
    dropdownList.CanvasSize = UDim2.new(0, 0, 0, 0)
    dropdownList.ScrollBarThickness = 10

    local function updateDropdownText()
        local selected = {}
        for _, v in ipairs(options) do
            if selectedTable[v] then table.insert(selected, v) end
        end
        if #selected == 0 then
            dropdownBtn.Text = labelText
        else
            dropdownBtn.Text = labelText .. " " .. table.concat(selected, ", ")
        end
    end

    local optionButtons = {}
    for i, name in ipairs(options) do
        local opt = Instance.new("TextButton")
        opt.Size = UDim2.new(1, 0, 0, 38)
        opt.Position = UDim2.new(0, 0, 0, (i-1)*38)
        opt.BackgroundColor3 = Color3.fromRGB(100, 170, 220)
        opt.Text = name
        opt.Font = Enum.Font.SourceSans
        opt.TextSize = 20
        opt.TextColor3 = Color3.fromRGB(255,255,255)
        opt.BorderSizePixel = 0
        opt.Parent = dropdownList
        opt.ZIndex = 4
        optionButtons[name] = opt
        -- Tooltip for details
        opt.MouseEnter:Connect(function()
            opt.Text = name .. "\n" .. (details and details[name] or "")
            opt.TextWrapped = true
        end)
        opt.MouseLeave:Connect(function()
            opt.Text = name
            opt.TextWrapped = false
        end)
        opt.MouseButton1Click:Connect(function()
            selectedTable[name] = not selectedTable[name]
            opt.BackgroundColor3 = selectedTable[name] and Color3.fromRGB(60, 200, 120) or Color3.fromRGB(100, 170, 220)
            updateDropdownText()
        end)
    end
    dropdownList.CanvasSize = UDim2.new(0, 0, 0, #options * 38)
    updateDropdownText()

    return dropdownBtn, dropdownList, optionButtons, updateDropdownText
end

-- Create Gear Dropdown
local gearDropdownBtn, gearDropdownList, gearOptionButtons, updateGearDropdownText = createDropdown(shopFrame, "BUY GEAR:", gearOptions, gearDetails, selectedGear)
-- Create Egg Dropdown
local eggDropdownBtn, eggDropdownList, eggOptionButtons, updateEggDropdownText = createDropdown(shopFrame, "BUY EGG:", eggOptions, eggDetails, selectedEggs)
-- Create Seed Dropdown
local seedDropdownBtn, seedDropdownList, seedOptionButtons, updateSeedDropdownText = createDropdown(shopFrame, "BUY SEEDS:", seedOptions, seedDetails, selectedSeeds)

-- Dropdown Positioning
local function updateShopDropdownPositions()
    local y = 20
    gearDropdownBtn.Position = UDim2.new(0, 20, 0, y)
    y = y + 44
    if gearDropdownList.Visible then
        gearDropdownList.Position = UDim2.new(0, 20, 0, y)
        gearDropdownList.Size = UDim2.new(1, -40, 0, math.min(#gearOptions * 38, 200))
        y = y + math.min(#gearOptions * 38, 200)
    else
        gearDropdownList.Position = UDim2.new(0, 20, 0, y)
        gearDropdownList.Size = UDim2.new(1, -40, 0, 0)
    end
    y = y + 6
    eggDropdownBtn.Position = UDim2.new(0, 20, 0, y)
    y = y + 44
    if eggDropdownList.Visible then
        eggDropdownList.Position = UDim2.new(0, 20, 0, y)
        eggDropdownList.Size = UDim2.new(1, -40, 0, math.min(#eggOptions * 38, 200))
        y = y + math.min(#eggOptions * 38, 200)
    else
        eggDropdownList.Position = UDim2.new(0, 20, 0, y)
        eggDropdownList.Size = UDim2.new(1, -40, 0, 0)
    end
    y = y + 6
    seedDropdownBtn.Position = UDim2.new(0, 20, 0, y)
    y = y + 44
    if seedDropdownList.Visible then
        seedDropdownList.Position = UDim2.new(0, 20, 0, y)
        seedDropdownList.Size = UDim2.new(1, -40, 0, math.min(#seedOptions * 38, 200))
        y = y + math.min(#seedOptions * 38, 200)
    else
        seedDropdownList.Position = UDim2.new(0, 20, 0, y)
        seedDropdownList.Size = UDim2.new(1, -40, 0, 0)
    end
    y = y + 18
    autoBuyGearToggle.Position = UDim2.new(0, 20, 0, y)
    y = y + 36 + 12
    autoBuyEggToggle.Position = UDim2.new(0, 20, 0, y)
    y = y + 36 + 12
    autoBuySeedToggle.Position = UDim2.new(0, 20, 0, y)
end

-- Dropdown Show/Hide Logic
local function closeAllDropdowns(except)
    if except ~= gearDropdownList then gearDropdownList.Visible = false end
    if except ~= eggDropdownList then eggDropdownList.Visible = false end
    if except ~= seedDropdownList then seedDropdownList.Visible = false end
    updateShopDropdownPositions()
end

gearDropdownBtn.MouseButton1Click:Connect(function()
    local open = not gearDropdownList.Visible
    closeAllDropdowns(open and "Gear" or nil)
    gearDropdownList.Visible = open
    updateShopDropdownPositions()
end)
eggDropdownBtn.MouseButton1Click:Connect(function()
    local open = not eggDropdownList.Visible
    closeAllDropdowns(open and "Egg" or nil)
    eggDropdownList.Visible = open
    updateShopDropdownPositions()
end)
seedDropdownBtn.MouseButton1Click:Connect(function()
    local open = not seedDropdownList.Visible
    closeAllDropdowns(open and "Seed" or nil)
    seedDropdownList.Visible = open
    updateShopDropdownPositions()
end)

-- Get references to RemoteEvents
local BuyGearStock = ReplicatedStorage.GameEvents:FindFirstChild("BuyGearStock")
local BuyPetEgg = ReplicatedStorage.GameEvents:FindFirstChild("BuyPetEgg")
local BuySeedStock = ReplicatedStorage.GameEvents:FindFirstChild("BuySeedStock")

-- Auto buy toggles: fire remote events for selected items
autoBuyGearToggle.MouseButton1Click:Connect(function()
    local selected = {}
    for k, v in pairs(selectedGear) do if v then table.insert(selected, k) end end
    for _, gear in ipairs(selected) do
        if BuyGearStock then
            BuyGearStock:FireServer(gear)
        end
    end
end)
autoBuyEggToggle.MouseButton1Click:Connect(function()
    local selected = {}
    for k, v in pairs(selectedEggs) do if v then table.insert(selected, k) end end
    for _, egg in ipairs(selected) do
        if BuyPetEgg then
            BuyPetEgg:FireServer(egg)
        end
    end
end)
autoBuySeedToggle.MouseButton1Click:Connect(function()
    local selected = {}
    for k, v in pairs(selectedSeeds) do if v then table.insert(selected, k) end end
    for _, seed in ipairs(selected) do
        if BuySeedStock then
            BuySeedStock:FireServer(seed)
        end
    end
end)

-- Set all tab content children ZIndex to 22 (above contentFrame)
for _, frame in pairs(tabContent) do
    for _, child in ipairs(frame:GetChildren()) do
        if child:IsA("GuiObject") then
            child.ZIndex = 22
        end
    end
end

-- Ensure sidebar and tab buttons are always on top
sidebar.ZIndex = 20
for i, name in ipairs(tabNames) do
    local tabBtn = tabButtons[name]
    if tabBtn then
        tabBtn.ZIndex = 20
    end
end
-- Ensure content frame and tab content are above sidebar
contentFrame.ZIndex = 21
for _, frame in pairs(tabContent) do
    frame.ZIndex = 21
end

-- Reconnect tab button click events
local function selectTab(tabName)
    for name, btn in pairs(tabButtons) do
        btn.BackgroundColor3 = name == tabName and Color3.fromRGB(220, 160, 80) or Color3.fromRGB(80, 90, 110)
    end
    for name, frame in pairs(tabContent) do
        frame.Visible = (name == tabName)
    end
end
for name, btn in pairs(tabButtons) do
    btn.MouseButton1Click:Connect(function()
        selectTab(name)
    end)
end

-- FARM TAB CONTENT
local farmFrame = tabContent["FARM"]
local farmHeader = Instance.new("TextLabel")
farmHeader.Size = UDim2.new(1, -32, 0, 40)
farmHeader.Position = UDim2.new(0, 16, 0, 16)
farmHeader.BackgroundColor3 = Color3.fromRGB(40, 90, 180)
farmHeader.Text = "FARM MANAGER"
farmHeader.Font = Enum.Font.SourceSansBold
farmHeader.TextSize = 22
farmHeader.TextColor3 = Color3.fromRGB(255,255,255)
farmHeader.BorderSizePixel = 0
farmHeader.TextXAlignment = Enum.TextXAlignment.Center
farmHeader.Parent = farmFrame
farmHeader.ZIndex = 22

local farmToggle = Instance.new("TextButton")
farmToggle.Name = "FarmToggle"
farmToggle.Size = UDim2.new(1, -32, 0, 36)
farmToggle.Position = UDim2.new(0, 16, 0, 64)
farmToggle.BackgroundColor3 = Color3.fromRGB(60, 90, 130)
farmToggle.Text = "AUTO FARM:"
farmToggle.Font = Enum.Font.SourceSansBold
farmToggle.TextSize = 20
farmToggle.TextColor3 = Color3.fromRGB(255,255,255)
farmToggle.BorderSizePixel = 0
farmToggle.TextXAlignment = Enum.TextXAlignment.Left
farmToggle.Parent = farmFrame
farmToggle.ZIndex = 22

local farmCheck = Instance.new("TextLabel")
farmCheck.Name = "Checkmark"
farmCheck.Size = UDim2.new(0, 32, 1, 0)
farmCheck.Position = UDim2.new(1, -36, 0, 0)
farmCheck.BackgroundTransparency = 1
farmCheck.Font = Enum.Font.SourceSansBold
farmCheck.TextSize = 24
farmCheck.TextColor3 = Color3.fromRGB(220, 220, 220)
farmCheck.Text = ""
farmCheck.Parent = farmToggle
farmCheck.ZIndex = 23

local autoFarmState = false
local function updateFarmToggle()
    farmToggle.BackgroundColor3 = autoFarmState and Color3.fromRGB(40, 90, 180) or Color3.fromRGB(60, 90, 130)
    farmCheck.Text = autoFarmState and "✔" or ""
end
updateFarmToggle()
farmToggle.MouseButton1Click:Connect(function()
    autoFarmState = not autoFarmState
    updateFarmToggle()
end)
