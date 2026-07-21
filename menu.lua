-- ============================================================
--  MUSLIM MENU v13.8 - ANIMATED CROSSHAIR + FULL FUNCTIONS
--  by Tormentor412
-- ============================================================

print("🚀 Загрузка Muslim Menu v13.8...")

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
frame.Size = UDim2.new(0, 700, 0, 450)
frame.Position = UDim2.new(0.5, -350, 0.5, -225)
frame.BackgroundColor3 = THEMES[currentTheme].main
frame.BackgroundTransparency = 0.05
frame.BorderSizePixel = 2
frame.BorderColor3 = THEMES[currentTheme].accent
frame.Active = true
frame.Draggable = true
frame.ClipsDescendants = true
frame.Parent = gui

local corners = Instance.new("UICorner")
corners.CornerRadius = UDim.new(0, 20)
corners.Parent = frame

-- ============================================================
--  ЗАГОЛОВОК
-- ============================================================
local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 50)
header.BackgroundColor3 = THEMES[currentTheme].header
header.BackgroundTransparency = 0.15
header.Parent = frame

local headerCorners = Instance.new("UICorner")
headerCorners.CornerRadius = UDim.new(0, 20)
headerCorners.Parent = header

-- ПРИЦЕЛ С АНИМАЦИЕЙ
local crosshairContainer = Instance.new("Frame")
crosshairContainer.Size = UDim2.new(0, 35, 1, 0)
crosshairContainer.Position = UDim2.new(0.02, 0, 0, 0)
crosshairContainer.BackgroundTransparency = 1
crosshairContainer.Parent = header

local crosshairCircle = Instance.new("Frame")
crosshairCircle.Size = UDim2.new(1, 0, 0.8, 0)
crosshairCircle.Position = UDim2.new(0, 0, 0.1, 0)
crosshairCircle.BackgroundTransparency = 1
crosshairCircle.BorderSizePixel = 2
crosshairCircle.BorderColor3 = THEMES[currentTheme].accent
crosshairCircle.Parent = crosshairContainer

local circleCorners = Instance.new("UICorner")
circleCorners.CornerRadius = UDim.new(1, 0)
circleCorners.Parent = crosshairCircle

local lineH = Instance.new("Frame")
lineH.Size = UDim2.new(0.8, 0, 0.08, 0)
lineH.Position = UDim2.new(0.1, 0, 0.46, 0)
lineH.BackgroundColor3 = THEMES[currentTheme].accent
lineH.BackgroundTransparency = 0.3
lineH.BorderSizePixel = 0
lineH.Parent = crosshairContainer

local lineV = Instance.new("Frame")
lineV.Size = UDim2.new(0.08, 0, 0.8, 0)
lineV.Position = UDim2.new(0.46, 0, 0.1, 0)
lineV.BackgroundColor3 = THEMES[currentTheme].accent
lineV.BackgroundTransparency = 0.3
lineV.BorderSizePixel = 0
lineV.Parent = crosshairContainer

local dot = Instance.new("Frame")
dot.Size = UDim2.new(0.15, 0, 0.15, 0)
dot.Position = UDim2.new(0.425, 0, 0.425, 0)
dot.BackgroundColor3 = THEMES[currentTheme].accent
dot.BackgroundTransparency = 0.2
dot.BorderSizePixel = 0
dot.Parent = crosshairContainer

local dotCorners = Instance.new("UICorner")
dotCorners.CornerRadius = UDim.new(1, 0)
dotCorners.Parent = dot

local angle = 0
local animConnection = game:GetService("RunService").RenderStepped:Connect(function()
    if not crosshairContainer or not crosshairContainer.Parent then
        if animConnection then
            animConnection:Disconnect()
            animConnection = nil
        end
        return
    end
    angle = angle + 0.03
    crosshairContainer.Rotation = math.deg(angle)
end)

-- НАЗВАНИЕ
local title = Instance.new("TextLabel")
title.Name = "Title"
title.Size = UDim2.new(0.3, 0, 1, 0)
title.Position = UDim2.new(0.09, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "MUSLIM MENU"
title.TextColor3 = THEMES[currentTheme].accent
title.TextSize = 20
title.Font = Enum.Font.SourceSansBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = header

-- ТЕМЫ
local themeContainer = Instance.new("Frame")
themeContainer.Size = UDim2.new(0.35, 0, 1, 0)
themeContainer.Position = UDim2.new(0.4, 0, 0, 0)
themeContainer.BackgroundTransparency = 1
themeContainer.Parent = header

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
    frame.BackgroundTransparency = 0.05
    frame.BorderColor3 = theme.accent
    
    header.BackgroundColor3 = theme.header
    header.BackgroundTransparency = 0.15
    title.TextColor3 = theme.accent
    crosshairCircle.BorderColor3 = theme.accent
    lineH.BackgroundColor3 = theme.accent
    lineV.BackgroundColor3 = theme.accent
    dot.BackgroundColor3 = theme.accent
    versionBadge.BackgroundColor3 = theme.accent
    versionBadge.BackgroundTransparency = 0.15
    versionBadge.TextColor3 = theme.accent
    
    for _, child in pairs(frame:GetDescendants()) do
        if child:IsA("TextButton") and child.Name ~= "CloseBtn" and child.Name ~= "FloatBtn" then
            child.BackgroundColor3 = theme.btn
            child.BackgroundTransparency = 0.1
            child.TextColor3 = theme.accent
        end
        if child:IsA("TextLabel") and child.Name ~= "Title" and child.Name ~= "Watermark" then
            child.TextColor3 = theme.text
        end
    end
    
    for _, container in pairs(frame:GetChildren()) do
        if container:IsA("Frame") and container ~= header and container ~= themeContainer then
            container.BackgroundColor3 = theme.btn
            container.BackgroundTransparency = 0.1
            container.BorderColor3 = theme.accent
        end
    end
    
    if mButton then
        mButton.BackgroundColor3 = theme.main
        mButton.BackgroundTransparency = 0.05
        mButton.TextColor3 = theme.accent
    end
end

for i, themeName in ipairs(themeNames) do
    local btn = Instance.new("TextButton")
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
        print("✅ Тема изменена на: " .. THEMES[themeName].name)
    end)
end

local versionBadge = Instance.new("TextLabel")
versionBadge.Size = UDim2.new(0, 60, 0, 22)
versionBadge.Position = UDim2.new(0.85, 0, 0.5, -11)
versionBadge.BackgroundColor3 = THEMES[currentTheme].accent
versionBadge.BackgroundTransparency = 0.15
versionBadge.Text = "v13.8"
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
closeBtn.Position = UDim2.new(0.94, 0, 0.5, -16)
closeBtn.BackgroundColor3 = Color3.fromRGB(200, 40, 40)
closeBtn.BackgroundTransparency = 0.05
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.TextSize = 18
closeBtn.Font = Enum.Font.SourceSansBold
closeBtn.Parent = header

local closeCorners = Instance.new("UICorner")
closeCorners.CornerRadius = UDim.new(0, 6)
closeCorners.Parent = closeBtn

-- КНОПКА M
local mButton = Instance.new("TextButton")
mButton.Name = "FloatBtn"
mButton.Size = UDim2.new(0, 60, 0, 60)
mButton.Position = UDim2.new(0.5, -30, 0.85, 0)
mButton.BackgroundColor3 = THEMES[currentTheme].main
mButton.BackgroundTransparency = 0.05
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
--  ВКЛАДКИ
-- ============================================================
local tabContainer = Instance.new("Frame")
tabContainer.Size = UDim2.new(0, 100, 1, -50)
tabContainer.Position = UDim2.new(0, 0, 0, 50)
tabContainer.BackgroundColor3 = THEMES[currentTheme].btn
tabContainer.BackgroundTransparency = 0.15
tabContainer.BorderSizePixel = 0
tabContainer.Parent = frame

local activeTab = "INFO"
local contentContainer = Instance.new("Frame")
contentContainer.Size = UDim2.new(1, -100, 1, -50)
contentContainer.Position = UDim2.new(0, 100, 0, 50)
contentContainer.BackgroundTransparency = 1
contentContainer.Parent = frame

local tabButtons = {}

local function createTabButton(name, yPos)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 40)
    btn.Position = UDim2.new(0, 0, 0, yPos)
    btn.BackgroundColor3 = THEMES[currentTheme].btn
    btn.BackgroundTransparency = 0.15
    btn.Text = name
    btn.TextColor3 = THEMES[currentTheme].text
    btn.TextSize = 14
    btn.Font = Enum.Font.SourceSansBold
    btn.Parent = tabContainer
    
    local btnCorners = Instance.new("UICorner")
    btnCorners.CornerRadius = UDim.new(0, 0)
    btnCorners.Parent = btn
    
    btn.MouseButton1Click:Connect(function()
        activeTab = name
        updateContent()
    end)
    
    return btn
end

createTabButton("INFO", 0)
createTabButton("ESP", 45)
createTabButton("COMBAT", 90)

-- ============================================================
--  КОНТЕНТ ВКЛАДОК
-- ============================================================
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
infoHello.Text = "Hello! It's my first script!"
infoHello.TextColor3 = THEMES[currentTheme].text
infoHello.TextSize = 22
infoHello.Font = Enum.Font.SourceSansBold
infoHello.Parent = infoContent

local infoRate = Instance.new("TextLabel")
infoRate.Size = UDim2.new(0.8, 0, 0.15, 0)
infoRate.Position = UDim2.new(0.1, 0, 0.4, 0)
infoRate.BackgroundTransparency = 1
infoRate.Text = "If it's not too much trouble, please rate it. 🌟"
infoRate.TextColor3 = THEMES[currentTheme].text
infoRate.TextSize = 18
infoRate.Font = Enum.Font.SourceSansBold
infoRate.Parent = infoContent

local infoNick = Instance.new("TextLabel")
infoNick.Size = UDim2.new(0.8, 0, 0.15, 0)
infoNick.Position = UDim2.new(0.1, 0, 0.6, 0)
infoNick.BackgroundTransparency = 1
infoNick.Text = "👤 My Roblox: TORMENTOR412"
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

-- ============================================================
--  ESP ВКЛАДКА
-- ============================================================
local espContent = Instance.new("Frame")
espContent.Size = UDim2.new(1, 0, 1, 0)
espContent.BackgroundTransparency = 1
espContent.Visible = false
espContent.Parent = contentContainer

local espTitle = Instance.new("TextLabel")
espTitle.Size = UDim2.new(0.8, 0, 0.08, 0)
espTitle.Position = UDim2.new(0.1, 0, 0.02, 0)
espTitle.BackgroundTransparency = 1
espTitle.Text = "🎯 ESP НАСТРОЙКИ"
espTitle.TextColor3 = THEMES[currentTheme].accent
espTitle.TextSize = 22
espTitle.Font = Enum.Font.SourceSansBold
espTitle.Parent = espContent

-- Переменные ESP
local ESP_MURDER = false
local ESP_SHERIFF = false
local ESP_INNOCENT = false
local espList = {}

-- Функция создания ESP
local function updateESP()
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
    
    if not ESP_MURDER and not ESP_SHERIFF and not ESP_INNOCENT then return end
    
    for _, plr in pairs(game:GetService("Players"):GetPlayers()) do
        if plr ~= player then
            createESPForPlayer(plr)
        end
    end
end

function createESPForPlayer(plr)
    if espList[plr] then return end
    
    local billboard = Instance.new("BillboardGui")
    billboard.Name = plr.Name .. "_ESP"
    billboard.Size = UDim2.new(0, 200, 0, 40)
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.AlwaysOnTop = true
    billboard.Parent = gui
    
    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 0.3
    textLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    textLabel.TextSize = 16
    textLabel.Font = Enum.Font.SourceSansBold
    textLabel.Parent = billboard
    
    espList[plr] = {
        billboard = billboard,
        label = textLabel,
        connection = nil
    }
    
    local conn
    conn = game:GetService("RunService").RenderStepped:Connect(function()
        if not plr or not plr.Parent or not plr.Character or not plr.Character:FindFirstChild("Head") then
            if billboard then billboard:Destroy() end
            espList[plr] = nil
            if conn then conn:Disconnect() end
            return
        end
        
        billboard.Adornee = plr.Character.Head
        
        local role = "innocent"
        local hasKnife = plr.Backpack:FindFirstChild("Knife") or plr.Character:FindFirstChild("Knife")
        local hasGun = plr.Backpack:FindFirstChild("Gun") or plr.Character:FindFirstChild("Gun")
        
        if hasKnife then
            role = "murderer"
        elseif hasGun then
            role = "sheriff"
        end
        
        local show = false
        local color = Color3.fromRGB(255, 255, 255)
        local text = ""
        
        if role == "murderer" and ESP_MURDER then
            show = true
            color = Color3.fromRGB(255, 0, 0)
            text = "🔴 УБИЙЦА " .. plr.Name
        elseif role == "sheriff" and ESP_SHERIFF then
            show = true
            color = Color3.fromRGB(0, 100, 255)
            text = "🔵 ШЕРИФ " .. plr.Name
        elseif role == "innocent" and ESP_INNOCENT then
            show = true
            color = Color3.fromRGB(0, 255, 0)
            text = "🟢 НЕВИННЫЙ " .. plr.Name
        end
        
        billboard.Enabled = show
        if show then
            textLabel.TextColor3 = color
            textLabel.Text = text
        end
    end)
    
    espList[plr].connection = conn
end

-- Кнопки ESP
local function createESPToggle(label, yPos, varName)
    local container = Instance.new("Frame")
    container.Size = UDim2.new(0.85, 0, 0, 40)
    container.Position = UDim2.new(0.075, 0, yPos, 0)
    container.BackgroundColor3 = THEMES[currentTheme].btn
    container.BackgroundTransparency = 0.1
    container.BorderSizePixel = 1
    container.BorderColor3 = THEMES[currentTheme].accent
    container.Parent = espContent
    
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
    toggle.BackgroundTransparency = 0.1
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
        
        if varName == "MURDER" then ESP_MURDER = state end
        if varName == "SHERIFF" then ESP_SHERIFF = state end
        if varName == "INNOCENT" then ESP_INNOCENT = state end
        
        updateESP()
        print("🔄 ESP обновлён: " .. varName .. " = " .. tostring(state))
    end)
end

createESPToggle("🔴 Убийца", 0.13, "MURDER")
createESPToggle("🔵 Шериф", 0.26, "SHERIFF")
createESPToggle("🟢 Невинный", 0.39, "INNOCENT")

-- ============================================================
--  COMBAT ВКЛАДКА
-- ============================================================
local combatContent = Instance.new("Frame")
combatContent.Size = UDim2.new(1, 0, 1, 0)
combatContent.BackgroundTransparency = 1
combatContent.Visible = false
combatContent.Parent = contentContainer

local combatTitle = Instance.new("TextLabel")
combatTitle.Size = UDim2.new(0.8, 0, 0.08, 0)
combatTitle.Position = UDim2.new(0.1, 0, 0.02, 0)
combatTitle.BackgroundTransparency = 1
combatTitle.Text = "⚔️ COMBAT НАСТРОЙКИ"
combatTitle.TextColor3 = THEMES[currentTheme].accent
combatTitle.TextSize = 22
combatTitle.Font = Enum.Font.SourceSansBold
combatTitle.Parent = combatContent

-- Silent Aim
local silentAimEnabled = false
local silentAimRadius = 5
local silentAimPart = "Head"

-- Круг для визуализации
local circle = Instance.new("Frame")
circle.Size = UDim2.new(0, 100, 0, 100)
circle.Position = UDim2.new(0.5, -50, 0.5, -50)
circle.BackgroundTransparency = 1
circle.ZIndex = 999
circle.Parent = gui
circle.Visible = false

local circleBorder = Instance.new("Frame")
circleBorder.Size = UDim2.new(1, 0, 1, 0)
circleBorder.BackgroundTransparency = 1
circleBorder.BorderSizePixel = 3
circleBorder.BorderColor3 = Color3.fromRGB(255, 50, 50)
circleBorder.Parent = circle

local circleCorners2 = Instance.new("UICorner")
circleCorners2.CornerRadius = UDim.new(1, 0)
circleCorners2.Parent = circleBorder

local circleGlow = Instance.new("Frame")
circleGlow.Size = UDim2.new(0.7, 0, 0.7, 0)
circleGlow.Position = UDim2.new(0.15, 0, 0.15, 0)
circleGlow.BackgroundTransparency = 0.6
circleGlow.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
circleGlow.BorderSizePixel = 0
circleGlow.Parent = circle

local circleGlowCorners = Instance.new("UICorner")
circleGlowCorners.CornerRadius = UDim.new(1, 0)
circleGlowCorners.Parent = circleGlow

local circleText = Instance.new("TextLabel")
circleText.Size = UDim2.new(0.4, 0, 0.3, 0)
circleText.Position = UDim2.new(0.3, 0, 0.7, 0)
circleText.BackgroundTransparency = 1
circleText.Text = "5"
circleText.TextColor3 = Color3.fromRGB(255, 255, 255)
circleText.TextSize = 18
circleText.Font = Enum.Font.SourceSansBold
circleText.Parent = circle

local function updateCircleRadius(value)
    silentAimRadius = math.clamp(value, 1, 30)
    local size = 60 + (silentAimRadius - 1) * 6
    circle.Size = UDim2.new(0, size, 0, size)
    circle.Position = UDim2.new(0.5, -size/2, 0.5, -size/2)
    circleText.Text = tostring(silentAimRadius)
end

-- Toggle Silent Aim
local silentContainer = Instance.new("Frame")
silentContainer.Size = UDim2.new(0.85, 0, 0, 40)
silentContainer.Position = UDim2.new(0.075, 0, 0.13, 0)
silentContainer.BackgroundColor3 = THEMES[currentTheme].btn
silentContainer.BackgroundTransparency = 0.1
silentContainer.BorderSizePixel = 1
silentContainer.BorderColor3 = THEMES[currentTheme].accent
silentContainer.Parent = combatContent

local silentLabel = Instance.new("TextLabel")
silentLabel.Size = UDim2.new(0.6, 0, 1, 0)
silentLabel.Position = UDim2.new(0.05, 0, 0, 0)
silentLabel.BackgroundTransparency = 1
silentLabel.Text = "🎯 Silent Aim"
silentLabel.TextColor3 = THEMES[currentTheme].text
silentLabel.TextSize = 15
silentLabel.Font = Enum.Font.SourceSansBold
silentLabel.TextXAlignment = Enum.TextXAlignment.Left
silentLabel.Parent = silentContainer

local silentToggle = Instance.new("TextButton")
silentToggle.Size = UDim2.new(0, 50, 0, 28)
silentToggle.Position = UDim2.new(0.82, 0, 0.5, -14)
silentToggle.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
silentToggle.BackgroundTransparency = 0.1
silentToggle.Text = ""
silentToggle.Parent = silentContainer

local silentKnob = Instance.new("Frame")
silentKnob.Size = UDim2.new(0, 20, 0, 20)
silentKnob.Position = UDim2.new(0.05, 0, 0.5, -10)
silentKnob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
silentKnob.BackgroundTransparency = 0
silentKnob.Parent = silentToggle

local silentKnobCorners = Instance.new("UICorner")
silentKnobCorners.CornerRadius = UDim.new(0, 10)
silentKnobCorners.Parent = silentKnob

silentToggle.MouseButton1Click:Connect(function()
    silentAimEnabled = not silentAimEnabled
    silentToggle.BackgroundColor3 = silentAimEnabled and THEMES[currentTheme].accent or Color3.fromRGB(40, 40, 50)
    silentKnob.Position = silentAimEnabled and UDim2.new(0.55, 0, 0.5, -10) or UDim2.new(0.05, 0, 0.5, -10)
    circle.Visible = silentAimEnabled
    if silentAimEnabled then updateCircleRadius(silentAimRadius) end
    print("🎯 Silent Aim: " .. (silentAimEnabled and "ВКЛ" or "ВЫКЛ"))
end)

-- Ползунок радиуса
local sliderContainer2 = Instance.new("Frame")
sliderContainer2.Size = UDim2.new(0.85, 0, 0, 50)
sliderContainer2.Position = UDim2.new(0.075, 0, 0.28, 0)
sliderContainer2.BackgroundColor3 = THEMES[currentTheme].btn
sliderContainer2.BackgroundTransparency = 0.1
sliderContainer2.BorderSizePixel = 1
sliderContainer2.BorderColor3 = THEMES[currentTheme].accent
sliderContainer2.Parent = combatContent

local sliderLabel2 = Instance.new("TextLabel")
sliderLabel2.Size = UDim2.new(0.4, 0, 1, 0)
sliderLabel2.Position = UDim2.new(0.05, 0, 0, 0)
sliderLabel2.BackgroundTransparency = 1
sliderLabel2.Text = "Радиус: 5"
sliderLabel2.TextColor3 = THEMES[currentTheme].text
sliderLabel2.TextSize = 14
sliderLabel2.Font = Enum.Font.SourceSansBold
sliderLabel2.TextXAlignment = Enum.TextXAlignment.Left
sliderLabel2.Parent = sliderContainer2

local minusBtn2 = Instance.new("TextButton")
minusBtn2.Size = UDim2.new(0, 30, 0, 30)
minusBtn2.Position = UDim2.new(0.65, 0, 0.5, -15)
minusBtn2.BackgroundColor3 = THEMES[currentTheme].accent
minusBtn2.Text = "-"
minusBtn2.TextColor3 = Color3.fromRGB(255, 255, 255)
minusBtn2.TextSize = 20
minusBtn2.Font = Enum.Font.SourceSansBold
minusBtn2.Parent = sliderContainer2

local plusBtn2 = Instance.new("TextButton")
plusBtn2.Size = UDim2.new(0, 30, 0, 30)
plusBtn2.Position = UDim2.new(0.82, 0, 0.5, -15)
plusBtn2.BackgroundColor3 = THEMES[currentTheme].accent
plusBtn2.Text = "+"
plusBtn2.TextColor3 = Color3.fromRGB(255, 255, 255)
plusBtn2.TextSize = 20
plusBtn2.Font = Enum.Font.SourceSansBold
plusBtn2.Parent = sliderContainer2

minusBtn2.MouseButton1Click:Connect(function()
    updateCircleRadius(silentAimRadius - 1)
    sliderLabel2.Text = "Радиус: " .. tostring(silentAimRadius)
end)

plusBtn2.MouseButton1Click:Connect(function()
    updateCircleRadius(silentAimRadius + 1)
    sliderLabel2.Text = "Радиус: " .. tostring(silentAimRadius)
end)

-- Цель (часть тела)
local aimLabel = Instance.new("TextLabel")
aimLabel.Size = UDim2.new(0.85, 0, 0, 30)
aimLabel.Position = UDim2.new(0.075, 0, 0.45, 0)
aimLabel.BackgroundTransparency = 1
aimLabel.Text = "🎯 Цель: Голова"
aimLabel.TextColor3 = THEMES[currentTheme].text
aimLabel.TextSize = 15
aimLabel.Font = Enum.Font.SourceSansBold
aimLabel.Parent = combatContent

-- Логика Silent Aim
local function getClosestTarget()
    local target = nil
    local minDist = math.huge
    local playerPos = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
    if not playerPos then return nil end
    
    for _, plr in pairs(game:GetService("Players"):GetPlayers()) do
        if plr ~= player and plr.Character then
            local targetPart = plr.Character:FindFirstChild(silentAimPart)
            if targetPart then
                local dist = (targetPart.Position - playerPos.Position).Magnitude
                if dist < minDist and dist < silentAimRadius * 10 then
                    minDist = dist
                    target = plr
                end
            end
        end
    end
    return target
end

pcall(function()
    local oldFire = nil
    local hookFunction = function(self, ...)
        local args = {...}
        if silentAimEnabled then
            local target = getClosestTarget()
            if target then
                for i, arg in pairs(args) do
                    if type(arg) == "Instance" and arg:IsA("Player") then
                        args[i] = target
                    end
                    if type(arg) == "string" then
                        for _, plr in pairs(game:GetService("Players"):GetPlayers()) do
                            if plr.Name == arg then
                                args[i] = target.Name
                            end
                        end
                    end
                end
            end
        end
        return oldFire(self, unpack(args))
    end

    for _, child in pairs(game:GetDescendants()) do
        if child:IsA("RemoteEvent") then
            local name = child.Name:lower()
            if name:find("attack") or name:find("damage") or name:find("fire") or name:find("shoot") or name:find("hit") then
                if not child._hooked then
                    child._hooked = true
                    oldFire = child.FireServer
                    child.FireServer = hookFunction
                end
            end
        end
    end
end)

-- ============================================================
--  ОБНОВЛЕНИЕ КОНТЕНТА
-- ============================================================
local function updateContent()
    infoContent.Visible = (activeTab == "INFO")
    espContent.Visible = (activeTab == "ESP")
    combatContent.Visible = (activeTab == "COMBAT")
    
    for _, btn in pairs(tabContainer:GetChildren()) do
        if btn:IsA("TextButton") then
            if btn.Text == activeTab then
                btn.BackgroundColor3 = THEMES[currentTheme].accent
                btn.BackgroundTransparency = 0.15
                btn.TextColor3 = THEMES[currentTheme].main
            else
                btn.BackgroundColor3 = THEMES[currentTheme].btn
                btn.BackgroundTransparency = 0.15
                btn.TextColor3 = THEMES[currentTheme].text
            end
        end
    end
end

updateContent()

-- ============================================================
--  ВОДЯНОЙ ЗНАК
-- ============================================================
local watermark = Instance.new("TextLabel")
watermark.Name = "Watermark"
watermark.Size = UDim2.new(1, 0, 0, 20)
watermark.Position = UDim2.new(0, 0, 0.97, 0)
watermark.BackgroundTransparency = 1
watermark.Text = "MUSLIM MENU v13.8 | TORMENTOR412"
watermark.TextColor3 = THEMES[currentTheme].accent
watermark.TextSize = 10
watermark.Font = Enum.Font.SourceSans
watermark.TextTransparency = 0.5
watermark.Parent = frame

-- ============================================================
--  ХОТКЕЙ F1
-- ============================================================
game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.F1 then
        if frame then
            frame.Visible = not frame.Visible
            if frame.Visible then
                mButton.Visible = false
            else
                mButton.Visible = true
            end
        end
    end
end)

-- ============================================================
--  ФИНАЛ
-- ============================================================
print("✅ Muslim Menu v13.8 загружен успешно!")
print("🔑 F1 - открыть/закрыть")
print("🔑 M - открыть/закрыть (когда меню скрыто)")
