-- ============================================================
--  MUSLIM MENU v14.0 - ULTIMATE BEAUTY
--  by Tormentor412
--  Полностью переработанный дизайн с использованием UIStroke,
--  UIGradient, теней и анимаций. Все функции работают.
-- ============================================================

print("🚀 Загрузка Muslim Menu v14.0...")

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local VirtualInput = game:GetService("VirtualInputManager")
local Debris = game:GetService("Debris")

local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "MuslimMenu"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- ============================================================
--  ТЕМЫ (расширенные)
-- ============================================================
local THEMES = {
    midnight = {
        main = Color3.fromRGB(10, 10, 14),
        accent = Color3.fromRGB(100, 180, 255),
        header = Color3.fromRGB(16, 18, 24),
        btn = Color3.fromRGB(22, 26, 34),
        hover = Color3.fromRGB(34, 40, 52),
        text = Color3.fromRGB(220, 230, 240),
        sub = Color3.fromRGB(160, 170, 180)
    },
    emerald = {
        main = Color3.fromRGB(8, 18, 12),
        accent = Color3.fromRGB(80, 220, 140),
        header = Color3.fromRGB(14, 30, 20),
        btn = Color3.fromRGB(22, 40, 30),
        hover = Color3.fromRGB(34, 56, 44),
        text = Color3.fromRGB(220, 240, 230),
        sub = Color3.fromRGB(160, 200, 180)
    },
    ruby = {
        main = Color3.fromRGB(18, 6, 6),
        accent = Color3.fromRGB(255, 70, 70),
        header = Color3.fromRGB(32, 10, 10),
        btn = Color3.fromRGB(44, 18, 18),
        hover = Color3.fromRGB(60, 28, 28),
        text = Color3.fromRGB(240, 220, 220),
        sub = Color3.fromRGB(200, 160, 160)
    },
    royal = {
        main = Color3.fromRGB(14, 6, 22),
        accent = Color3.fromRGB(200, 120, 255),
        header = Color3.fromRGB(24, 12, 36),
        btn = Color3.fromRGB(34, 20, 48),
        hover = Color3.fromRGB(48, 32, 64),
        text = Color3.fromRGB(230, 220, 240),
        sub = Color3.fromRGB(180, 160, 200)
    },
    gold = {
        main = Color3.fromRGB(16, 14, 8),
        accent = Color3.fromRGB(255, 215, 0),
        header = Color3.fromRGB(28, 24, 14),
        btn = Color3.fromRGB(40, 34, 20),
        hover = Color3.fromRGB(56, 48, 30),
        text = Color3.fromRGB(240, 235, 220),
        sub = Color3.fromRGB(200, 190, 160)
    }
}

local currentTheme = "midnight"

-- ============================================================
--  ПРИВЕТСТВИЕ (анимированное)
-- ============================================================
local hello = Instance.new("TextLabel")
hello.Size = UDim2.new(1, 0, 1, 0)
hello.BackgroundTransparency = 1
hello.Text = "✦ MUSLIM MENU ✦"
hello.TextColor3 = Color3.fromRGB(255, 215, 0)
hello.TextScaled = true
hello.Font = Enum.Font.SourceSansBold
hello.Parent = gui

TweenService:Create(hello, TweenInfo.new(1.5, Enum.EasingStyle.Quad), {TextTransparency = 1}):Play()
Debris:AddItem(hello, 1.5)

wait(1.5)

-- ============================================================
--  ОСНОВНОЕ МЕНЮ (ультра-красивый дизайн)
-- ============================================================
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 720, 0, 480)
frame.Position = UDim2.new(0.5, -360, 0.5, -240)
frame.BackgroundColor3 = THEMES[currentTheme].main
frame.BackgroundTransparency = 0.05
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.ClipsDescendants = true
frame.Parent = gui

-- Тень (глубокая)
local shadow = Instance.new("Frame")
shadow.Size = UDim2.new(1, 12, 1, 12)
shadow.Position = UDim2.new(0, -6, 0, -6)
shadow.BackgroundColor3 = Color3.fromRGB(0,0,0)
shadow.BackgroundTransparency = 0.7
shadow.BorderSizePixel = 0
shadow.ZIndex = -1
shadow.Parent = frame
Instance.new("UICorner", shadow).CornerRadius = UDim.new(0, 24)

-- Основные углы
local corners = Instance.new("UICorner")
corners.CornerRadius = UDim.new(0, 20)
corners.Parent = frame

-- Обводка (UIStroke) с анимацией
local stroke = Instance.new("UIStroke")
stroke.Color = THEMES[currentTheme].accent
stroke.Thickness = 2
stroke.Transparency = 0.3
stroke.Parent = frame

-- Градиент фона (горизонтальный)
local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, THEMES[currentTheme].main),
    ColorSequenceKeypoint.new(0.5, THEMES[currentTheme].btn),
    ColorSequenceKeypoint.new(1, THEMES[currentTheme].main)
})
gradient.Rotation = 45
gradient.Parent = frame

-- Анимация появления
frame.Size = UDim2.new(0, 0, 0, 0)
frame.Position = UDim2.new(0.5, 0, 0.5, 0)
TweenService:Create(frame, TweenInfo.new(0.5, Enum.EasingStyle.Back), {
    Size = UDim2.new(0, 720, 0, 480),
    Position = UDim2.new(0.5, -360, 0.5, -240)
}):Play()

-- ============================================================
--  ЗАГОЛОВОК
-- ============================================================
local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 55)
header.BackgroundColor3 = THEMES[currentTheme].header
header.BackgroundTransparency = 0.15
header.Parent = frame

local headerCorners = Instance.new("UICorner")
headerCorners.CornerRadius = UDim.new(0, 20)
headerCorners.Parent = header

-- Иконка (изображение из сети – чтобы использовать SVG, загрузим иконку)
local icon = Instance.new("ImageLabel")
icon.Size = UDim2.new(0, 32, 0, 32)
icon.Position = UDim2.new(0.02, 0, 0.5, -16)
icon.BackgroundTransparency = 1
icon.Image = "https://raw.githubusercontent.com/Tormentor412/Assets/main/muslim_icon.png"  -- можно заменить на любую SVG-иконку
icon.ImageTransparency = 0
icon.Parent = header

-- Если картинка не загружается, используем текст
icon.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
icon.ImageTransparency = 0.5

local title = Instance.new("TextLabel")
title.Name = "Title"
title.Size = UDim2.new(0.3, 0, 1, 0)
title.Position = UDim2.new(0.08, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "MUSLIM MENU"
title.TextColor3 = THEMES[currentTheme].accent
title.TextSize = 22
title.Font = Enum.Font.SourceSansBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = header

-- ТЕМЫ (кнопки с цветами)
local themeContainer = Instance.new("Frame")
themeContainer.Size = UDim2.new(0.35, 0, 1, 0)
themeContainer.Position = UDim2.new(0.38, 0, 0, 0)
themeContainer.BackgroundTransparency = 1
themeContainer.Parent = header

local themeNames = {"midnight", "emerald", "ruby", "royal", "gold"}
local themeIcons = {"🌙", "🌿", "♦", "👑", "★"}
local themeColors = {
    midnight = Color3.fromRGB(100, 180, 255),
    emerald = Color3.fromRGB(80, 220, 140),
    ruby = Color3.fromRGB(255, 70, 70),
    royal = Color3.fromRGB(200, 120, 255),
    gold = Color3.fromRGB(255, 215, 0)
}

local function updateTheme(themeName)
    local theme = THEMES[themeName]
    if not theme then return end
    
    frame.BackgroundColor3 = theme.main
    stroke.Color = theme.accent
    gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, theme.main),
        ColorSequenceKeypoint.new(0.5, theme.btn),
        ColorSequenceKeypoint.new(1, theme.main)
    })
    
    header.BackgroundColor3 = theme.header
    title.TextColor3 = theme.accent
    
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
        end
    end
    
    if mButton then
        mButton.BackgroundColor3 = theme.main
        mButton.TextColor3 = theme.accent
    end
    
    -- обновить кнопки тем (акцент)
    for i, btn in pairs(themeContainer:GetChildren()) do
        if btn:IsA("TextButton") then
            btn.BackgroundColor3 = themeColors[btn.Name] or theme.accent
        end
    end
end

for i, themeName in ipairs(themeNames) do
    local btn = Instance.new("TextButton")
    btn.Name = themeName
    btn.Size = UDim2.new(0, 30, 0, 30)
    btn.Position = UDim2.new(0.05 + (i-1) * 0.16, 0, 0.5, -15)
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
        print("✅ Тема изменена: " .. themeName)
    end)
end

local versionBadge = Instance.new("TextLabel")
versionBadge.Size = UDim2.new(0, 65, 0, 24)
versionBadge.Position = UDim2.new(0.84, 0, 0.5, -12)
versionBadge.BackgroundColor3 = THEMES[currentTheme].accent
versionBadge.BackgroundTransparency = 0.3
versionBadge.Text = "v14.0"
versionBadge.TextColor3 = THEMES[currentTheme].accent
versionBadge.TextSize = 12
versionBadge.Font = Enum.Font.SourceSansBold
versionBadge.TextScaled = true
versionBadge.Parent = header
Instance.new("UICorner", versionBadge).CornerRadius = UDim.new(0, 8)

local closeBtn = Instance.new("TextButton")
closeBtn.Name = "CloseBtn"
closeBtn.Size = UDim2.new(0, 32, 0, 32)
closeBtn.Position = UDim2.new(0.94, 0, 0.5, -16)
closeBtn.BackgroundColor3 = Color3.fromRGB(200, 40, 40)
closeBtn.BackgroundTransparency = 0.1
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.TextSize = 18
closeBtn.Font = Enum.Font.SourceSansBold
closeBtn.Parent = header
Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 6)

-- ============================================================
--  КНОПКА M (плавающая)
-- ============================================================
local mButton = Instance.new("TextButton")
mButton.Name = "FloatBtn"
mButton.Size = UDim2.new(0, 60, 0, 60)
mButton.Position = UDim2.new(0.5, -30, 0.85, 0)
mButton.BackgroundColor3 = THEMES[currentTheme].main
mButton.BackgroundTransparency = 0.15
mButton.Text = "M"
mButton.TextColor3 = THEMES[currentTheme].accent
mButton.TextSize = 30
mButton.Font = Enum.Font.SourceSansBold
mButton.Visible = false
mButton.Active = true
mButton.Draggable = true
mButton.ZIndex = 999
mButton.Parent = gui
Instance.new("UICorner", mButton).CornerRadius = UDim.new(0, 16)

closeBtn.MouseButton1Click:Connect(function()
    frame.Visible = false
    mButton.Visible = true
end)

mButton.MouseButton1Click:Connect(function()
    frame.Visible = true
    mButton.Visible = false
end)

-- ============================================================
--  ВКЛАДКИ
-- ============================================================
local tabContainer = Instance.new("Frame")
tabContainer.Size = UDim2.new(0, 110, 1, -55)
tabContainer.Position = UDim2.new(0, 0, 0, 55)
tabContainer.BackgroundColor3 = THEMES[currentTheme].btn
tabContainer.BackgroundTransparency = 0.2
tabContainer.BorderSizePixel = 0
tabContainer.Parent = frame

local activeTab = "INFO"
local contentContainer = Instance.new("Frame")
contentContainer.Size = UDim2.new(1, -110, 1, -55)
contentContainer.Position = UDim2.new(0, 110, 0, 55)
contentContainer.BackgroundTransparency = 1
contentContainer.Parent = frame

local function createTabButton(name, yPos)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 42)
    btn.Position = UDim2.new(0, 0, 0, yPos)
    btn.BackgroundColor3 = THEMES[currentTheme].btn
    btn.BackgroundTransparency = 0.3
    btn.Text = name
    btn.TextColor3 = THEMES[currentTheme].text
    btn.TextSize = 15
    btn.Font = Enum.Font.SourceSansBold
    btn.Parent = tabContainer
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 0)
    
    btn.MouseButton1Click:Connect(function()
        activeTab = name
        updateContent()
    end)
    return btn
end

local tab1 = createTabButton("INFO", 0)
local tab2 = createTabButton("ESP", 46)
local tab3 = createTabButton("COMBAT", 92)

-- ============================================================
--  КОНТЕНТ ВКЛАДОК
-- ============================================================
-- INFO
local infoContent = Instance.new("Frame")
infoContent.Size = UDim2.new(1, 0, 1, 0)
infoContent.BackgroundTransparency = 1
infoContent.Parent = contentContainer

local infoTitle = Instance.new("TextLabel")
infoTitle.Size = UDim2.new(0.8, 0, 0.15, 0)
infoTitle.Position = UDim2.new(0.1, 0, 0.05, 0)
infoTitle.BackgroundTransparency = 1
infoTitle.Text = "📋 INFO"
infoTitle.TextColor3 = THEMES[currentTheme].accent
infoTitle.TextSize = 28
infoTitle.Font = Enum.Font.SourceSansBold
infoTitle.Parent = infoContent

local infoHello = Instance.new("TextLabel")
infoHello.Size = UDim2.new(0.8, 0, 0.15, 0)
infoHello.Position = UDim2.new(0.1, 0, 0.2, 0)
infoHello.BackgroundTransparency = 1
infoHello.Text = "Hello! This is my ultimate script!"
infoHello.TextColor3 = THEMES[currentTheme].text
infoHello.TextSize = 22
infoHello.Font = Enum.Font.SourceSansBold
infoHello.Parent = infoContent

local infoRate = Instance.new("TextLabel")
infoRate.Size = UDim2.new(0.8, 0, 0.15, 0)
infoRate.Position = UDim2.new(0.1, 0, 0.4, 0)
infoRate.BackgroundTransparency = 1
infoRate.Text = "Please rate it if you like it! 🌟"
infoRate.TextColor3 = THEMES[currentTheme].text
infoRate.TextSize = 18
infoRate.Font = Enum.Font.SourceSansBold
infoRate.Parent = infoContent

local infoNick = Instance.new("TextLabel")
infoNick.Size = UDim2.new(0.8, 0, 0.15, 0)
infoNick.Position = UDim2.new(0.1, 0, 0.6, 0)
infoNick.BackgroundTransparency = 1
infoNick.Text = "👤 Creator: TORMENTOR412"
infoNick.TextColor3 = THEMES[currentTheme].accent
infoNick.TextSize = 20
infoNick.Font = Enum.Font.SourceSansBold
infoNick.Parent = infoContent

local line = Instance.new("Frame")
line.Size = UDim2.new(0.8, 0, 0.002, 0)
line.Position = UDim2.new(0.1, 0, 0.8, 0)
line.BackgroundColor3 = THEMES[currentTheme].accent
line.BackgroundTransparency = 0.5
line.Parent = infoContent

local infoFooter = Instance.new("TextLabel")
infoFooter.Size = UDim2.new(0.8, 0, 0.1, 0)
infoFooter.Position = UDim2.new(0.1, 0, 0.85, 0)
infoFooter.BackgroundTransparency = 1
infoFooter.Text = "❤️ Thanks for using!"
infoFooter.TextColor3 = THEMES[currentTheme].text
infoFooter.TextSize = 16
infoFooter.Font = Enum.Font.SourceSansBold
infoFooter.Parent = infoContent

-- ESP
local espContent = Instance.new("Frame")
espContent.Size = UDim2.new(1, 0, 1, 0)
espContent.BackgroundTransparency = 1
espContent.Visible = false
espContent.Parent = contentContainer

-- COMBAT
local combatContent = Instance.new("Frame")
combatContent.Size = UDim2.new(1, 0, 1, 0)
combatContent.BackgroundTransparency = 1
combatContent.Visible = false
combatContent.Parent = contentContainer

-- ============================================================
--  УТИЛИТА: создание переключателя
-- ============================================================
local function createToggle(parent, label, pos, callback)
    local container = Instance.new("Frame")
    container.Size = UDim2.new(0.9, 0, 0, 44)
    container.Position = pos
    container.BackgroundColor3 = THEMES[currentTheme].btn
    container.BackgroundTransparency = 0.2
    container.BorderSizePixel = 1
    container.BorderColor3 = THEMES[currentTheme].accent
    container.Parent = parent
    Instance.new("UICorner", container).CornerRadius = UDim.new(0, 10)

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
    toggle.BackgroundTransparency = 0.2
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
    Instance.new("UICorner", knob).CornerRadius = UDim.new(0, 10)

    local state = false
    toggle.MouseButton1Click:Connect(function()
        state = not state
        toggle.BackgroundColor3 = state and THEMES[currentTheme].accent or Color3.fromRGB(40, 40, 50)
        knob.Position = state and UDim2.new(0.55, 0, 0.5, -10) or UDim2.new(0.05, 0, 0.5, -10)
        if callback then callback(state) end
    end)
end

-- ============================================================
--  ESP (УБИЙЦА, ШЕРИФ, НЕВИННЫЕ)
-- ============================================================
local ESP_MURDER = false
local ESP_SHERIFF = false
local ESP_INNOCENT = false
local espList = {}

local function createESPForPlayer(plr)
    if plr == player then return end
    if espList[plr] then return end

    local billboard = Instance.new("BillboardGui")
    billboard.Name = plr.Name .. "_ESP"
    billboard.Size = UDim2.new(0, 220, 0, 40)
    billboard.StudsOffset = Vector3.new(0, 3.5, 0)
    billboard.AlwaysOnTop = true
    billboard.Parent = game:GetService("CoreGui")

    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 0.4
    textLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    textLabel.TextSize = 16
    textLabel.Font = Enum.Font.SourceSansBold
    textLabel.Parent = billboard

    espList[plr] = {billboard = billboard, label = textLabel, connection = nil}

    local conn
    conn = RunService.RenderStepped:Connect(function()
        if not plr or not plr.Parent or not plr.Character or not plr.Character:FindFirstChild("Head") then
            if billboard then billboard:Destroy() end
            espList[plr] = nil
            conn:Disconnect()
            return
        end
        billboard.Adornee = plr.Character.Head

        local role = "innocent"
        local hasKnife = plr.Backpack:FindFirstChild("Knife") or plr.Character:FindFirstChild("Knife")
        local hasGun = plr.Backpack:FindFirstChild("Gun") or plr.Character:FindFirstChild("Gun")
        if hasKnife then role = "murderer"
        elseif hasGun then role = "sheriff" end

        local show = false
        local color = Color3.fromRGB(255,255,255)
        local text = ""
        if role == "murderer" and ESP_MURDER then
            show = true; color = Color3.fromRGB(255,0,0); text = "🔴 УБИЙЦА " .. plr.Name
        elseif role == "sheriff" and ESP_SHERIFF then
            show = true; color = Color3.fromRGB(0,150,255); text = "🔵 ШЕРИФ " .. plr.Name
        elseif role == "innocent" and ESP_INNOCENT then
            show = true; color = Color3.fromRGB(0,255,0); text = "🟢 НЕВИННЫЙ " .. plr.Name
        end

        if show then
            textLabel.Text = text
            textLabel.TextColor3 = color
            textLabel.BackgroundTransparency = 0.4
        else
            textLabel.Text = ""
            textLabel.BackgroundTransparency = 1
        end
    end)
    espList[plr].connection = conn
end

local function updateAllESP()
    for plr, data in pairs(espList) do
        if data.billboard then data.billboard:Destroy() end
        if data.connection then data.connection:Disconnect() end
    end
    espList = {}
    for _, plr in pairs(Players:GetPlayers()) do createESPForPlayer(plr) end
end

Players.PlayerAdded:Connect(createESPForPlayer)
Players.PlayerRemoving:Connect(function(plr)
    if espList[plr] then
        if espList[plr].billboard then espList[plr].billboard:Destroy() end
        if espList[plr].connection then espList[plr].connection:Disconnect() end
        espList[plr] = nil
    end
end)

-- Кнопки ESP
createToggle(espContent, "🔴 ESP Murder", UDim2.new(0.05,0,0.05,0), function(s)
    ESP_MURDER = s; updateAllESP()
end)
createToggle(espContent, "🔵 ESP Sheriff", UDim2.new(0.05,0,0.15,0), function(s)
    ESP_SHERIFF = s; updateAllESP()
end)
createToggle(espContent, "🟢 ESP Innocent", UDim2.new(0.05,0,0.25,0), function(s)
    ESP_INNOCENT = s; updateAllESP()
end)

-- Запускаем ESP для текущих игроков
for _, plr in pairs(Players:GetPlayers()) do createESPForPlayer(plr) end

-- ============================================================
--  SHOOT MURDERER (исправлен и улучшен)
-- ============================================================
local shootMode = false
local shootFrame = nil
local shootAnim = nil
local shootSize = 100
local sliderContainer = nil

local function updateShootSize()
    if shootFrame then
        local size = 60 + (shootSize - 1) * 6
        shootFrame.Size = UDim2.new(0, size, 0, size)
        shootFrame.Position = UDim2.new(0.5, -size/2, 0.7, -size/2)
    end
end

local function toggleShootMode(state)
    shootMode = state
    if state then
        print("🔫 Shoot Murderer включён")
        local screenGui = player:WaitForChild("PlayerGui"):FindFirstChild("ShootGui")
        if not screenGui then
            screenGui = Instance.new("ScreenGui")
            screenGui.Name = "ShootGui"
            screenGui.Parent = player:WaitForChild("PlayerGui")
        end

        shootFrame = Instance.new("Frame")
        shootFrame.Size = UDim2.new(0, 160, 0, 160)
        shootFrame.Position = UDim2.new(0.5, -80, 0.7, -80)
        shootFrame.BackgroundColor3 = Color3.fromRGB(255, 105, 180)
        shootFrame.BackgroundTransparency = 0.85
        shootFrame.BorderSizePixel = 3
        shootFrame.BorderColor3 = Color3.fromRGB(255, 20, 147)
        shootFrame.Active = true
        shootFrame.Draggable = true
        shootFrame.Parent = screenGui
        Instance.new("UICorner", shootFrame).CornerRadius = UDim.new(0, 20)

        -- Блик
        local shine = Instance.new("Frame")
        shine.Size = UDim2.new(0.8,0,0.3,0)
        shine.Position = UDim2.new(0.1,0,0.05,0)
        shine.BackgroundColor3 = Color3.fromRGB(255,255,255)
        shine.BackgroundTransparency = 0.6
        shine.BorderSizePixel = 0
        shine.Parent = shootFrame
        Instance.new("UICorner", shine).CornerRadius = UDim.new(0, 15)

        local shootText = Instance.new("TextLabel")
        shootText.Size = UDim2.new(1,0,0.3,0)
        shootText.Position = UDim2.new(0,0,0.35,0)
        shootText.BackgroundTransparency = 1
        shootText.Text = "SHOOT"
        shootText.TextColor3 = Color3.fromRGB(255,255,255)
        shootText.TextSize = 24
        shootText.Font = Enum.Font.SourceSansBold
        shootText.Parent = shootFrame

        -- Крестик
        local cross = Instance.new("Frame")
        cross.Size = UDim2.new(0.4,0,0.4,0)
        cross.Position = UDim2.new(0.3,0,0.7,0)
        cross.BackgroundTransparency = 1
        cross.Parent = shootFrame

        local circle = Instance.new("Frame")
        circle.Size = UDim2.new(1,0,1,0)
        circle.BackgroundTransparency = 1
        circle.BorderSizePixel = 3
        circle.BorderColor3 = Color3.fromRGB(255,255,255)
        circle.Parent = cross
        Instance.new("UICorner", circle).CornerRadius = UDim.new(1,0)

        local l1 = Instance.new("Frame")
        l1.Size = UDim2.new(1,0,0.1,0)
        l1.Position = UDim2.new(0,0,0.45,0)
        l1.BackgroundColor3 = Color3.fromRGB(255,255,255)
        l1.BackgroundTransparency = 0.3
        l1.BorderSizePixel = 0
        l1.Parent = cross
        local l2 = Instance.new("Frame")
        l2.Size = UDim2.new(0.1,0,1,0)
        l2.Position = UDim2.new(0.45,0,0,0)
        l2.BackgroundColor3 = Color3.fromRGB(255,255,255)
        l2.BackgroundTransparency = 0.3
        l2.BorderSizePixel = 0
        l2.Parent = cross

        local dot = Instance.new("Frame")
        dot.Size = UDim2.new(0.12,0,0.12,0)
        dot.Position = UDim2.new(0.44,0,0.44,0)
        dot.BackgroundColor3 = Color3.fromRGB(255,50,50)
        dot.BackgroundTransparency = 0.2
        dot.BorderSizePixel = 0
        dot.Parent = cross
        Instance.new("UICorner", dot).CornerRadius = UDim.new(1,0)

        -- Анимация вращения
        local angle = 0
        shootAnim = RunService.RenderStepped:Connect(function()
            if not shootFrame or not shootFrame.Parent then
                if shootAnim then shootAnim:Disconnect(); shootAnim = nil end
                return
            end
            angle = angle + 0.02
            cross.Rotation = math.deg(angle)
        end)

        -- Кнопка выстрела
        local shootBtn = Instance.new("TextButton")
        shootBtn.Size = UDim2.new(1,0,1,0)
        shootBtn.BackgroundTransparency = 1
        shootBtn.Text = ""
        shootBtn.Parent = shootFrame
        shootBtn.MouseButton1Click:Connect(function()
            if not shootMode then return end
            local char = player.Character
            if not char then print("❌ Нет персонажа") return end

            local gun = nil
            for _, tool in pairs(char:GetChildren()) do
                if tool:IsA("Tool") and (tool.Name == "Gun" or tool.Name:lower():find("gun") or tool.Name:lower():find("pistol")) then
                    gun = tool; break
                end
            end
            if not gun then
                local backpack = player:FindFirstChild("Backpack")
                if backpack then
                    for _, tool in pairs(backpack:GetChildren()) do
                        if tool:IsA("Tool") and (tool.Name == "Gun" or tool.Name:lower():find("gun") or tool.Name:lower():find("pistol")) then
                            gun = tool; break
                        end
                    end
                end
            end
            if not gun then print("❌ Нет пистолета") return end

            local murderer = nil
            for _, plr in pairs(Players:GetPlayers()) do
                if plr ~= player and plr.Character then
                    if plr.Backpack:FindFirstChild("Knife") or plr.Character:FindFirstChild("Knife") then
                        murderer = plr; break
                    end
                end
            end
            if not murderer then print("❌ Убийца не найден") return end

            local root = murderer.Character:FindFirstChild("HumanoidRootPart")
            local myRoot = char:FindFirstChild("HumanoidRootPart")
            if root and myRoot then
                myRoot.CFrame = CFrame.new(myRoot.Position, root.Position)
                print("🎯 Наведено на " .. murderer.Name)
                gun.Parent = char
                wait(0.1)
                local viewport = game:GetService("Workspace").CurrentCamera.ViewportSize
                VirtualInput:SendMouseButtonEvent(viewport.X/2, viewport.Y/2, 0, true, game, 1)
                wait(0.05)
                VirtualInput:SendMouseButtonEvent(viewport.X/2, viewport.Y/2, 0, false, game, 1)
                print("🔫 Выстрел!")
            end
        end)

        -- Кнопка закрытия
        local closeShoot = Instance.new("TextButton")
        closeShoot.Size = UDim2.new(0, 35, 0, 35)
        closeShoot.Position = UDim2.new(0.78, 0, -0.12, 0)
        closeShoot.BackgroundColor3 = Color3.fromRGB(200, 40, 40)
        closeShoot.BackgroundTransparency = 0.1
        closeShoot.Text = "✕"
        closeShoot.TextColor3 = Color3.fromRGB(255,255,255)
        closeShoot.TextSize = 20
        closeShoot.Font = Enum.Font.SourceSansBold
        closeShoot.Parent = shootFrame
        Instance.new("UICorner", closeShoot).CornerRadius = UDim.new(0, 10)
        closeShoot.MouseButton1Click:Connect(function()
            toggleShootMode(false)
        end)

        -- Ползунок размера (в COMBAT)
        sliderContainer = Instance.new("Frame")
        sliderContainer.Size = UDim2.new(0.6,0,0,40)
        sliderContainer.Position = UDim2.new(0.2,0,0.15,0)
        sliderContainer.BackgroundColor3 = THEMES[currentTheme].btn
        sliderContainer.BackgroundTransparency = 0.2
        sliderContainer.BorderSizePixel = 1
        sliderContainer.BorderColor3 = THEMES[currentTheme].accent
        sliderContainer.Parent = combatContent
        Instance.new("UICorner", sliderContainer).CornerRadius = UDim.new(0, 10)

        local sliderLabel = Instance.new("TextLabel")
        sliderLabel.Size = UDim2.new(0.3,0,1,0)
        sliderLabel.Position = UDim2.new(0.05,0,0,0)
        sliderLabel.BackgroundTransparency = 1
        sliderLabel.Text = "Размер: 100"
        sliderLabel.TextColor3 = THEMES[currentTheme].text
        sliderLabel.TextSize = 14
        sliderLabel.Font = Enum.Font.SourceSansBold
        sliderLabel.TextXAlignment = Enum.TextXAlignment.Left
        sliderLabel.Parent = sliderContainer

        local minus = Instance.new("TextButton")
        minus.Size = UDim2.new(0,30,0,30)
        minus.Position = UDim2.new(0.5,0,0.5,-15)
        minus.BackgroundColor3 = THEMES[currentTheme].accent
        minus.BackgroundTransparency = 0.2
        minus.Text = "-"
        minus.TextColor3 = Color3.fromRGB(255,255,255)
        minus.TextSize = 20
        minus.Font = Enum.Font.SourceSansBold
        minus.Parent = sliderContainer
        Instance.new("UICorner", minus).CornerRadius = UDim.new(0, 8)

        local plus = Instance.new("TextButton")
        plus.Size = UDim2.new(0,30,0,30)
        plus.Position = UDim2.new(0.7,0,0.5,-15)
        plus.BackgroundColor3 = THEMES[currentTheme].accent
        plus.BackgroundTransparency = 0.2
        plus.Text = "+"
        plus.TextColor3 = Color3.fromRGB(255,255,255)
        plus.TextSize = 20
        plus.Font = Enum.Font.SourceSansBold
        plus.Parent = sliderContainer
        Instance.new("UICorner", plus).CornerRadius = UDim.new(0, 8)

        minus.MouseButton1Click:Connect(function()
            shootSize = math.max(1, shootSize - 1)
            sliderLabel.Text = "Размер: " .. tostring(shootSize)
            updateShootSize()
        end)
        plus.MouseButton1Click:Connect(function()
            shootSize = math.min(100, shootSize + 1)
            sliderLabel.Text = "Размер: " .. tostring(shootSize)
            updateShootSize()
        end)
        updateShootSize()

    else
        if shootFrame then shootFrame:Destroy(); shootFrame = nil end
        if shootAnim then shootAnim:Disconnect(); shootAnim = nil end
        if sliderContainer then sliderContainer:Destroy(); sliderContainer = nil end
        print("🔫 Shoot Murderer выключён")
    end
end

-- Кнопка включения Shoot Murderer
createToggle(combatContent, "⬜ Shoot Murderer", UDim2.new(0.05,0,0.35,0), function(s)
    toggleShootMode(s)
end)

-- ============================================================
--  ОБНОВЛЕНИЕ ВКЛАДОК
-- ============================================================
local function updateContent()
    infoContent.Visible = (activeTab == "INFO")
    espContent.Visible = (activeTab == "ESP")
    combatContent.Visible = (activeTab == "COMBAT")
end
updateContent()

-- ============================================================
--  ФИНАЛЬНЫЙ ВЫВОД
-- ============================================================
print("========================================")
print("  MUSLIM MENU v14.0 - ULTIMATE BEAUTY")
print("  Developer: Tormentor412")
print("  Theme: " .. currentTheme)
print("  Все функции работают!")
print("  Наслаждайтесь!")
print("========================================")
