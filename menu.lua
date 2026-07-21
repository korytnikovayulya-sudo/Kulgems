-- ============================================================
--  MUSLIM MENU v9.5 - СЛИЯНИЕ С ТВОИМ КОДОМ
--  by Tormentor412
-- ============================================================

print("🚀 Загрузка Muslim Menu v9.5...")

local player = game:GetService("Players").LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "MuslimMenu"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- ============================================================
--  ТЕМЫ
-- ============================================================
local THEMES = {
    midnight = { main = Color3.fromRGB(10, 10, 14), accent = Color3.fromRGB(100, 180, 255), header = Color3.fromRGB(16, 18, 24), btn = Color3.fromRGB(22, 26, 34), hover = Color3.fromRGB(34, 40, 52), text = Color3.fromRGB(220, 230, 240) },
    emerald = { main = Color3.fromRGB(8, 18, 12), accent = Color3.fromRGB(80, 220, 140), header = Color3.fromRGB(14, 30, 20), btn = Color3.fromRGB(22, 40, 30), hover = Color3.fromRGB(34, 56, 44), text = Color3.fromRGB(220, 240, 230) },
    ruby = { main = Color3.fromRGB(18, 6, 6), accent = Color3.fromRGB(255, 70, 70), header = Color3.fromRGB(32, 10, 10), btn = Color3.fromRGB(44, 18, 18), hover = Color3.fromRGB(60, 28, 28), text = Color3.fromRGB(240, 220, 220) },
    royal = { main = Color3.fromRGB(14, 6, 22), accent = Color3.fromRGB(200, 120, 255), header = Color3.fromRGB(24, 12, 36), btn = Color3.fromRGB(34, 20, 48), hover = Color3.fromRGB(48, 32, 64), text = Color3.fromRGB(230, 220, 240) },
    gold = { main = Color3.fromRGB(16, 14, 8), accent = Color3.fromRGB(255, 215, 0), header = Color3.fromRGB(28, 24, 14), btn = Color3.fromRGB(40, 34, 20), hover = Color3.fromRGB(56, 48, 30), text = Color3.fromRGB(240, 235, 220) }
}

local currentTheme = "midnight"

-- ============================================================
--  ПРИВЕТСТВИЕ
-- ============================================================
local hello = Instance.new("TextLabel")
hello.Size = UDim2.new(1, 0, 1, 0)
hello.BackgroundTransparency = 1
hello.Text = "Hello!"
hello.TextColor3 = Color3.fromRGB(255, 215, 0)
hello.TextScaled = true
hello.Font = Enum.Font.SourceSansBold
hello.Parent = gui

game:GetService("TweenService"):Create(hello, TweenInfo.new(1.5, Enum.EasingStyle.Quad), {TextTransparency = 1}):Play()
game:GetService("Debris"):AddItem(hello, 1.5)

wait(1.5)

-- ============================================================
--  ОСНОВНОЕ МЕНЮ
-- ============================================================
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 460, 0, 580)
frame.Position = UDim2.new(0.5, -230, 0.5, -290)
frame.BackgroundColor3 = THEMES[currentTheme].main
frame.BackgroundTransparency = 0
frame.BorderSizePixel = 2
frame.BorderColor3 = THEMES[currentTheme].accent
frame.Active = true
frame.Draggable = true
frame.ClipsDescendants = true
frame.Parent = gui

local corners = Instance.new("UICorner")
corners.CornerRadius = UDim.new(0, 20)
corners.Parent = frame

-- ===== ЗАГОЛОВОК =====
local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 50)
header.BackgroundColor3 = THEMES[currentTheme].header
header.BackgroundTransparency = 0
header.Parent = frame

local headerCorners = Instance.new("UICorner")
headerCorners.CornerRadius = UDim.new(0, 20)
headerCorners.Parent = header

local icon = Instance.new("TextLabel")
icon.Size = UDim2.new(0, 35, 1, 0)
icon.Position = UDim2.new(0.02, 0, 0, 0)
icon.BackgroundTransparency = 1
icon.Text = "⚡"
icon.TextColor3 = THEMES[currentTheme].accent
icon.TextSize = 22
icon.Font = Enum.Font.SourceSansBold
icon.Parent = header

local title = Instance.new("TextLabel")
title.Name = "Title"
title.Size = UDim2.new(0.55, 0, 1, 0)
title.Position = UDim2.new(0.10, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "MUSLIM MENU"
title.TextColor3 = THEMES[currentTheme].accent
title.TextSize = 20
title.Font = Enum.Font.SourceSansBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = header

local versionBadge = Instance.new("TextLabel")
versionBadge.Size = UDim2.new(0, 60, 0, 22)
versionBadge.Position = UDim2.new(0.65, 0, 0.5, -11)
versionBadge.BackgroundColor3 = THEMES[currentTheme].accent
versionBadge.BackgroundTransparency = 0.15
versionBadge.Text = "v9.5"
versionBadge.TextColor3 = THEMES[currentTheme].accent
versionBadge.TextSize = 11
versionBadge.Font = Enum.Font.SourceSansBold
versionBadge.TextScaled = true
versionBadge.Parent = header

local versionCorners = Instance.new("UICorner")
versionCorners.CornerRadius = UDim.new(0, 8)
versionCorners.Parent = versionBadge

local closeBtn = Instance.new("TextButton")
closeBtn.Name = "CloseBtn"
closeBtn.Size = UDim2.new(0, 32, 0, 32)
closeBtn.Position = UDim2.new(0.92, 0, 0.5, -16)
closeBtn.BackgroundColor3 = Color3.fromRGB(200, 40, 40)
closeBtn.BackgroundTransparency = 0
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.TextSize = 18
closeBtn.Font = Enum.Font.SourceSansBold
closeBtn.Parent = header

local closeCorners = Instance.new("UICorner")
closeCorners.CornerRadius = UDim.new(0, 6)
closeCorners.Parent = closeBtn

-- ============================================================
--  КНОПКА M
-- ============================================================
local mButton = Instance.new("TextButton")
mButton.Name = "FloatBtn"
mButton.Size = UDim2.new(0, 60, 0, 60)
mButton.Position = UDim2.new(0.5, -30, 0.85, 0)
mButton.BackgroundColor3 = THEMES[currentTheme].main
mButton.BackgroundTransparency = 0
mButton.Text = "M"
mButton.TextColor3 = THEMES[currentTheme].accent
mButton.TextSize = 30
mButton.Font = Enum.Font.SourceSansBold
mButton.Visible = false
mButton.Active = true
mButton.Draggable = true
mButton.ZIndex = 999
mButton.Parent = gui

local mButtonCorners = Instance.new("UICorner")
mButtonCorners.CornerRadius = UDim.new(0, 16)
mButtonCorners.Parent = mButton

closeBtn.MouseButton1Click:Connect(function()
    frame.Visible = false
    mButton.Visible = true
end)

mButton.MouseButton1Click:Connect(function()
    frame.Visible = true
    mButton.Visible = false
end)

-- ============================================================
--  ФУНКЦИЯ КНОПОК
-- ============================================================
local function createToggle(parent, label, pos, callback)
    local container = Instance.new("Frame")
    container.Size = UDim2.new(0.9, 0, 0, 44)
    container.Position = pos
    container.BackgroundColor3 = THEMES[currentTheme].btn
    container.BackgroundTransparency = 0
    container.BorderSizePixel = 1
    container.BorderColor3 = THEMES[currentTheme].accent
    container.Parent = parent
    
    local corners = Instance.new("UICorner")
    corners.CornerRadius = UDim.new(0, 10)
    corners.Parent = container
    
    local labelText = Instance.new("TextLabel")
    labelText.Size = UDim2.new(0.6, 0, 1, 0)
    labelText.Position = UDim2.new(0.05, 0, 0, 0)
    labelText.BackgroundTransparency = 1
    labelText.Text = label
    labelText.TextColor3 = THEMES[currentTheme].text
    labelText.TextSize = 15
    labelText.Font = Enum.Font.SourceSansBold
    labelText.TextXAlignment = Enum.TextXAlignment.Left
    labelText.Parent = container
    
    local toggle = Instance.new("TextButton")
    toggle.Size = UDim2.new(0, 50, 0, 28)
    toggle.Position = UDim2.new(0.82, 0, 0.5, -14)
    toggle.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    toggle.BackgroundTransparency = 0
    toggle.Text = ""
    toggle.Parent = container
    
    local toggleCorners = Instance.new("UICorner")
    toggleCorners.CornerRadius = UDim.new(0, 14)
    toggleCorners.Parent = toggle
    
    local knob = Instance.new("Frame")
    knob.Size = UDim2.new(0, 20, 0, 20)
    knob.Position = UDim2.new(0.05, 0, 0.5, -10)
    knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    knob.BackgroundTransparency = 0
    knob.Parent = toggle
    
    local knobCorners = Instance.new("UICorner")
    knobCorners.CornerRadius = UDim.new(0, 10)
    knobCorners.Parent = knob
    
    local state = false
    toggle.MouseButton1Click:Connect(function()
        state = not state
        toggle.BackgroundColor3 = state and THEMES[currentTheme].accent or Color3.fromRGB(40, 40, 50)
        knob.Position = state and UDim2.new(0.55, 0, 0.5, -10) or UDim2.new(0.05, 0, 0.5, -10)
        if callback then callback(state) end
    end)
end

-- ============================================================
--  ESP (ТВОЙ КОД — РАБОТАЕТ 100%)
-- ============================================================
local ESP_ENABLED = false
local espList = {}

local function createESPForPlayer(plr)
    if plr == player then return end
    if espList[plr] then return end
    
    local billboard = Instance.new("BillboardGui")
    billboard.Name = plr.Name .. "_ESP"
    billboard.Size = UDim2.new(0, 200, 0, 50)
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.AlwaysOnTop = true  -- ВИДНО СКВОЗЬ СТЕНЫ!
    
    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    textLabel.TextSize = 14
    textLabel.Font = Enum.Font.SourceSansBold
    textLabel.Parent = billboard
    
    billboard.Parent = game:GetService("CoreGui")
    espList[plr] = {
        billboard = billboard,
        label = textLabel,
        connection = nil
    }
    
    -- Обновление позиции и роли
    local conn
    conn = game:GetService("RunService").RenderStepped:Connect(function()
        if not plr or not plr.Parent or not plr.Character or not plr.Character:FindFirstChild("Head") then
            billboard:Destroy()
            espList[plr] = nil
            conn:Disconnect()
            return
        end
        
        billboard.Adornee = plr.Character.Head
        
        if ESP_ENABLED then
            -- Проверяем наличие ножа
            local isMurder = plr.Backpack:FindFirstChild("Knife") or plr.Character:FindFirstChild("Knife")
            if isMurder then
                textLabel.Text = "🔴 УБИЙЦА " .. plr.Name
                textLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
            else
                textLabel.Text = ""
            end
        else
            textLabel.Text = ""
        end
    end)
    
    espList[plr].connection = conn
end

local function updateAllESP()
    -- Удаляем старые ESP
    for plr, data in pairs(espList) do
        if data.billboard then
            data.billboard:Destroy()
        end
        if data.connection then
            data.connection:Disconnect()
        end
    end
    espList = {}
    
    -- Создаём новые
    if ESP_ENABLED then
        for _, plr in pairs(game:GetService("Players"):GetPlayers()) do
            createESPForPlayer(plr)
        end
    end
end

-- Кнопка включения ESP
createToggle(frame, "🔴 ESP Murder (вкл/выкл)", UDim2.new(0.05, 0, 0.14, 0), function(state)
    ESP_ENABLED = state
    updateAllESP()
end)

-- Новые игроки
game:GetService("Players").PlayerAdded:Connect(function(plr)
    if ESP_ENABLED then
        createESPForPlayer(plr)
    end
end)

-- ============================================================
--  BUNNY HOP
-- ============================================================
local bunnyHopEnabled = false
local bhopConnection = nil
local jumpKeyDown = false

local function toggleBunnyHop(state)
    bunnyHopEnabled = state
    if state then
        print("🐰 Bunny Hop включён! Удерживай пробел")
        game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
            if gameProcessed then return end
            if input.KeyCode == Enum.KeyCode.Space then
                jumpKeyDown = true
            end
        end)
        game:GetService("UserInputService").InputEnded:Connect(function(input, gameProcessed)
            if gameProcessed then return end
            if input.KeyCode == Enum.KeyCode.Space then
                jumpKeyDown = false
            end
        end)
        
        bhopConnection = game:GetService("RunService").RenderStepped:Connect(function()
            if bunnyHopEnabled and jumpKeyDown then
                local char = player.Character
                if char and char:FindFirstChild("Humanoid") then
                    local humanoid = char.Humanoid
                    if humanoid.FloorMaterial ~= Enum.Material.Air then
                        humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                    end
                end
            end
        end)
    else
        print("🐰 Bunny Hop выключён!")
        jumpKeyDown = false
        if bhopConnection then
            bhopConnection:Disconnect()
            bhopConnection = nil
        end
    end
end

createToggle(frame, "🐰 Bunny Hop", UDim2.new(0.05, 0, 0.28, 0), function(state)
    toggleBunnyHop(state)
end)

-- ============================================================
--  ТЕМЫ
-- ============================================================
local themeContainer = Instance.new("Frame")
themeContainer.Size = UDim2.new(0.9, 0, 0, 42)
themeContainer.Position = UDim2.new(0.05, 0, 0.55, 0)
themeContainer.BackgroundColor3 = THEMES[currentTheme].btn
themeContainer.BackgroundTransparency = 0
themeContainer.BorderSizePixel = 1
themeContainer.BorderColor3 = THEMES[currentTheme].accent
themeContainer.Parent = frame

local themeCorners = Instance.new("UICorner")
themeCorners.CornerRadius = UDim.new(0, 10)
themeCorners.Parent = themeContainer

local themeLabel = Instance.new("TextLabel")
themeLabel.Size = UDim2.new(0.3, 0, 1, 0)
themeLabel.Position = UDim2.new(0.05, 0, 0, 0)
themeLabel.BackgroundTransparency = 1
themeLabel.Text = "✦ Тема:"
themeLabel.TextColor3 = THEMES[currentTheme].text
themeLabel.TextSize = 14
themeLabel.Font = Enum.Font.SourceSansBold
themeLabel.TextXAlignment = Enum.TextXAlignment.Left
themeLabel.Parent = themeContainer

local themeColors = {
    midnight = Color3.fromRGB(100, 180, 255),
    emerald = Color3.fromRGB(80, 220, 140),
    ruby = Color3.fromRGB(255, 70, 70),
    royal = Color3.fromRGB(200, 120, 255),
    gold = Color3.fromRGB(255, 215, 0)
}

local themeNames = {"midnight", "emerald", "ruby", "royal", "gold"}
local themeIcons = {"🌙", "🌿", "♦", "👑", "★"}

local function updateTheme(themeName)
    local theme = THEMES[themeName]
    if not theme then return end
    
    frame.BackgroundColor3 = theme.main
    frame.BorderColor3 = theme.accent
    header.BackgroundColor3 = theme.header
    title.TextColor3 = theme.accent
    icon.TextColor3 = theme.accent
    versionBadge.BackgroundColor3 = theme.accent
    versionBadge.TextColor3 = theme.accent
    
    for _, child in pairs(frame:GetDescendants()) do
        if child:IsA("TextButton") and child.Name ~= "CloseBtn" and child.Name ~= "FloatBtn" then
            child.BackgroundColor3 = theme.btn
            child.TextColor3 = theme.accent
        end
        if child:IsA("TextLabel") and child.Name ~= "Title" and child.Name ~= "Watermark" and child ~= icon then
            child.TextColor3 = theme.text
        end
    end
    
    for _, container in pairs(frame:GetChildren()) do
        if container:IsA("Frame") and container ~= header and container ~= themeContainer then
            container.BackgroundColor3 = theme.btn
            container.BorderColor3 = theme.accent
        end
    end
    
    themeContainer.BackgroundColor3 = theme.btn
    themeContainer.BorderColor3 = theme.accent
    themeLabel.TextColor3 = theme.text
    
    if mButton then
        mButton.BackgroundColor3 = theme.main
        mButton.TextColor3 = theme.accent
    end
end

for i, themeName in ipairs(themeNames) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 34, 0, 34)
    btn.Position = UDim2.new(0.33 + (i-1) * 0.1, 0, 0.5, -17)
    btn.BackgroundColor3 = themeColors[themeName]
    btn.BackgroundTransparency = 0
    btn.Text = themeIcons[i]
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 14
    btn.Font = Enum.Font.SourceSansBold
    btn.Parent = themeContainer
    
    local btnCorners = Instance.new("UICorner")
    btnCorners.CornerRadius = UDim.new(0, 8)
    btnCorners.Parent = btn
    
    btn.MouseButton1Click:Connect(function()
        currentTheme = themeName
        updateTheme(themeName)
        print("✅ Тема изменена на: " .. THEMES[themeName].name)
    end)
end

-- ============================================================
--  КНОПКИ
-- ============================================================
local restartBtn = Instance.new("TextButton")
restartBtn.Size = UDim2.new(0.4, 0, 0, 40)
restartBtn.Position = UDim2.new(0.05, 0, 0.82, 0)
restartBtn.BackgroundColor3 = THEMES[currentTheme].btn
restartBtn.BackgroundTransparency = 0
restartBtn.Text = "⟳ Перезапустить"
restartBtn.TextColor3 = THEMES[currentTheme].accent
restartBtn.TextSize = 16
restartBtn.Font = Enum.Font.SourceSansBold
restartBtn.Parent = frame

local restartCorners = Instance.new("UICorner")
restartCorners.CornerRadius = UDim.new(0, 10)
restartCorners.Parent = restartBtn

restartBtn.MouseButton1Click:Connect(function()
    frame.Visible = false
    wait(0.3)
    frame.Visible = true
end)

local siteBtn = Instance.new("TextButton")
siteBtn.Size = UDim2.new(0.4, 0, 0, 40)
siteBtn.Position = UDim2.new(0.55, 0, 0.82, 0)
siteBtn.BackgroundColor3 = THEMES[currentTheme].btn
siteBtn.BackgroundTransparency = 0
siteBtn.Text = "🌐 Сайт"
siteBtn.TextColor3 = THEMES[currentTheme].accent
siteBtn.TextSize = 16
siteBtn.Font = Enum.Font.SourceSansBold
siteBtn.Parent = frame

local siteCorners = Instance.new("UICorner")
siteCorners.CornerRadius = UDim.new(0, 10)
siteCorners.Parent = siteBtn

siteBtn.MouseButton1Click:Connect(function()
    setclipboard("https://korytnikovayulya-sudo.github.io/muslim-menu-site/")
    print("🌐 Ссылка скопирована!")
end)

-- ============================================================
--  ПРОФИЛЬ
-- ============================================================
local profileContainer = Instance.new("Frame")
profileContainer.Size = UDim2.new(0.5, 0, 0, 30)
profileContainer.Position = UDim2.new(0.05, 0, 0.93, 0)
profileContainer.BackgroundTransparency = 1
profileContainer.Parent = frame

local profileIcon = Instance.new("TextLabel")
profileIcon.Size = UDim2.new(0, 25, 1, 0)
profileIcon.Position = UDim2.new(0, 0, 0, 0)
profileIcon.BackgroundTransparency = 1
profileIcon.Text = "👤"
profileIcon.TextColor3 = THEMES[currentTheme].accent
profileIcon.TextSize = 18
profileIcon.Font = Enum.Font.SourceSansBold
profileIcon.TextXAlignment = Enum.TextXAlignment.Center
profileIcon.Parent = profileContainer

local watermark = Instance.new("TextLabel")
watermark.Name = "Watermark"
watermark.Size = UDim2.new(0.8, 0, 1, 0)
watermark.Position = UDim2.new(0.15, 0, 0, 0)
watermark.BackgroundTransparency = 1
watermark.Text = "Tormentor412"
watermark.TextColor3 = THEMES[currentTheme].accent
watermark.TextSize = 14
watermark.Font = Enum.Font.SourceSansBold
watermark.TextXAlignment = Enum.TextXAlignment.Left
watermark.TextTransparency = 0.3
watermark.Parent = profileContainer

print("========================================")
print("  MUSLIM MENU v9.5 - С ТВОИМ ESP")
print("  Developer: Tormentor412")
print("  Theme: " .. THEMES[currentTheme].name)
print("  Loaded successfully! ✦")
print("========================================")
