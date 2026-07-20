-- ============================================================
--  ██████  ██    ██ ███████ ██      ██ ███    ███ 
--  ██   ██ ██    ██ ██      ██      ██ ████  ████ 
--  ██████  ██    ██ ███████ ██      ██ ██ ████ ██ 
--  ██   ██ ██    ██      ██ ██      ██ ██  ██  ██ 
--  ██████   ██████  ███████ ███████ ██ ██      ██ 
-- ============================================================
--  MUSLIM MENU v8.3 - VISIBLE SILENT AIM
--  by Tormentor412
-- ============================================================

print("🚀 Загрузка Muslim Menu v8.3...")

-- ============================================================
--  [1] CORE CONFIGURATION
-- ============================================================
local CONFIG = {
    NAME = "MUSLIM MENU",
    VERSION = "v8.3",
    DEVELOPER = "Tormentor412",
    GITHUB = "https://github.com/korytnikovayulya-sudo/Kulgems",
    WEBSITE = "https://korytnikovayulya-sudo.github.io/muslim-menu-site/",
    RAW_URL = "https://raw.githubusercontent.com/korytnikovayulya-sudo/Kulgems/main/menu.lua"
}

-- ============================================================
--  [2] PREMIUM THEMES
-- ============================================================
local THEMES = {
    midnight = {
        name = "🌙 Midnight",
        main = Color3.fromRGB(10, 10, 14),
        accent = Color3.fromRGB(100, 180, 255),
        accent2 = Color3.fromRGB(60, 120, 200),
        header = Color3.fromRGB(16, 18, 24),
        btn = Color3.fromRGB(22, 26, 34),
        hover = Color3.fromRGB(34, 40, 52),
        text = Color3.fromRGB(220, 230, 240)
    },
    emerald = {
        name = "🌿 Emerald",
        main = Color3.fromRGB(8, 18, 12),
        accent = Color3.fromRGB(80, 220, 140),
        accent2 = Color3.fromRGB(40, 160, 100),
        header = Color3.fromRGB(14, 30, 20),
        btn = Color3.fromRGB(22, 40, 30),
        hover = Color3.fromRGB(34, 56, 44),
        text = Color3.fromRGB(220, 240, 230)
    },
    ruby = {
        name = "♦ Ruby",
        main = Color3.fromRGB(18, 6, 6),
        accent = Color3.fromRGB(255, 70, 70),
        accent2 = Color3.fromRGB(200, 40, 40),
        header = Color3.fromRGB(32, 10, 10),
        btn = Color3.fromRGB(44, 18, 18),
        hover = Color3.fromRGB(60, 28, 28),
        text = Color3.fromRGB(240, 220, 220)
    },
    royal = {
        name = "👑 Royal",
        main = Color3.fromRGB(14, 6, 22),
        accent = Color3.fromRGB(200, 120, 255),
        accent2 = Color3.fromRGB(150, 80, 220),
        header = Color3.fromRGB(24, 12, 36),
        btn = Color3.fromRGB(34, 20, 48),
        hover = Color3.fromRGB(48, 32, 64),
        text = Color3.fromRGB(230, 220, 240)
    },
    gold = {
        name = "★ Gold",
        main = Color3.fromRGB(16, 14, 8),
        accent = Color3.fromRGB(255, 215, 0),
        accent2 = Color3.fromRGB(200, 160, 0),
        header = Color3.fromRGB(28, 24, 14),
        btn = Color3.fromRGB(40, 34, 20),
        hover = Color3.fromRGB(56, 48, 30),
        text = Color3.fromRGB(240, 235, 220)
    }
}

local currentTheme = "midnight"

-- ============================================================
--  [3] SERVICES
-- ============================================================
local player = game:GetService("Players").LocalPlayer
local tweenService = game:GetService("TweenService")

-- ============================================================
--  [4] GUI CREATION
-- ============================================================
local gui = Instance.new("ScreenGui")
gui.Name = "MuslimMenu"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = player:WaitForChild("PlayerGui")

-- ============================================================
--  [5] ANIMATION ENGINE
-- ============================================================
local Animation = {}

function Animation:tween(obj, props, duration, style, direction)
    style = style or Enum.EasingStyle.Quad
    direction = direction or Enum.EasingDirection.Out
    local info = TweenInfo.new(duration or 0.3, style, direction)
    local tween = tweenService:Create(obj, info, props)
    tween:Play()
    return tween
end

function Animation:fadeIn(obj, duration)
    obj.BackgroundTransparency = 1
    return self:tween(obj, {BackgroundTransparency = 0}, duration or 0.4)
end

function Animation:fadeOut(obj, duration)
    return self:tween(obj, {BackgroundTransparency = 1}, duration or 0.3)
end

-- ============================================================
--  [6] UI COMPONENTS
-- ============================================================
local UI = {}

function UI:createButton(parent, text, pos, size, callback)
    local btn = Instance.new("TextButton")
    btn.Size = size or UDim2.new(0.8, 0, 0, 42)
    btn.Position = pos or UDim2.new(0.1, 0, 0, 0)
    btn.BackgroundColor3 = THEMES[currentTheme].btn
    btn.BackgroundTransparency = 0
    btn.Text = text
    btn.TextColor3 = THEMES[currentTheme].accent
    btn.TextSize = 16
    btn.Font = Enum.Font.SourceSansBold
    btn.Parent = parent
    
    local corners = Instance.new("UICorner")
    corners.CornerRadius = UDim.new(0, 10)
    corners.Parent = btn
    
    btn.MouseEnter:Connect(function()
        Animation:tween(btn, {BackgroundColor3 = THEMES[currentTheme].hover}, 0.2)
        Animation:tween(btn, {TextSize = 17}, 0.2)
    end)
    btn.MouseLeave:Connect(function()
        Animation:tween(btn, {BackgroundColor3 = THEMES[currentTheme].btn}, 0.2)
        Animation:tween(btn, {TextSize = 16}, 0.2)
    end)
    
    btn.MouseButton1Click:Connect(callback)
    return btn
end

function UI:createToggle(parent, label, pos, defaultValue, callback)
    local container = Instance.new("Frame")
    container.Size = UDim2.new(0.9, 0, 0, 46)
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
    toggle.Size = UDim2.new(0, 52, 0, 30)
    toggle.Position = UDim2.new(0.82, 0, 0.5, -15)
    toggle.BackgroundColor3 = defaultValue and THEMES[currentTheme].accent or Color3.fromRGB(40, 40, 50)
    toggle.BackgroundTransparency = 0
    toggle.Text = ""
    toggle.Parent = container
    
    local toggleCorners = Instance.new("UICorner")
    toggleCorners.CornerRadius = UDim.new(0, 15)
    toggleCorners.Parent = toggle
    
    local knob = Instance.new("Frame")
    knob.Size = UDim2.new(0, 22, 0, 22)
    knob.Position = defaultValue and UDim2.new(0.55, 0, 0.5, -11) or UDim2.new(0.05, 0, 0.5, -11)
    knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    knob.BackgroundTransparency = 0
    knob.Parent = toggle
    
    local knobCorners = Instance.new("UICorner")
    knobCorners.CornerRadius = UDim.new(0, 11)
    knobCorners.Parent = knob
    
    local state = defaultValue
    toggle.MouseButton1Click:Connect(function()
        state = not state
        toggle.BackgroundColor3 = state and THEMES[currentTheme].accent or Color3.fromRGB(40, 40, 50)
        Animation:tween(knob, {Position = state and UDim2.new(0.55, 0, 0.5, -11) or UDim2.new(0.05, 0, 0.5, -11)}, 0.2)
        if callback then callback(state) end
    end)
    
    return container, toggle, knob
end

-- ============================================================
--  [7] THEME SELECTOR
-- ============================================================
local function createThemeSelector(parent)
    local container = Instance.new("Frame")
    container.Size = UDim2.new(0.9, 0, 0, 42)
    container.Position = UDim2.new(0.05, 0, 0.60, 0)
    container.BackgroundColor3 = THEMES[currentTheme].btn
    container.BackgroundTransparency = 0
    container.BorderSizePixel = 1
    container.BorderColor3 = THEMES[currentTheme].accent
    container.Parent = parent
    
    local corners = Instance.new("UICorner")
    corners.CornerRadius = UDim.new(0, 10)
    corners.Parent = container
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.3, 0, 1, 0)
    label.Position = UDim2.new(0.05, 0, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = "✦ Тема:"
    label.TextColor3 = THEMES[currentTheme].text
    label.TextSize = 14
    label.Font = Enum.Font.SourceSansBold
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = container
    
    local themeColors = {
        midnight = Color3.fromRGB(100, 180, 255),
        emerald = Color3.fromRGB(80, 220, 140),
        ruby = Color3.fromRGB(255, 70, 70),
        royal = Color3.fromRGB(200, 120, 255),
        gold = Color3.fromRGB(255, 215, 0)
    }
    
    local themeNames = {"midnight", "emerald", "ruby", "royal", "gold"}
    local themeIcons = {"🌙", "🌿", "♦", "👑", "★"}
    
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
        btn.Parent = container
        
        local btnCorners = Instance.new("UICorner")
        btnCorners.CornerRadius = UDim.new(0, 8)
        btnCorners.Parent = btn
        
        btn.MouseButton1Click:Connect(function()
            currentTheme = themeName
            updateTheme(themeName)
            print("✅ Тема изменена на: " .. THEMES[themeName].name)
        end)
    end
end

-- ============================================================
--  [8] UPDATE THEME
-- ============================================================
local function updateTheme(themeName)
    local theme = THEMES[themeName]
    if not theme then return end
    
    frame.BackgroundColor3 = theme.main
    frame.BorderColor3 = theme.accent
    
    header.BackgroundColor3 = theme.header
    title.TextColor3 = theme.accent
    accentLine.BackgroundColor3 = theme.accent
    versionBadge.BackgroundColor3 = theme.accent
    versionBadge.TextColor3 = theme.accent
    
    for _, btn in pairs(frame:GetDescendants()) do
        if btn:IsA("TextButton") then
            if btn.Name ~= "CloseBtn" and btn.Name ~= "FloatBtn" and btn ~= minusBtn and btn ~= plusBtn then
                btn.BackgroundColor3 = theme.btn
                btn.TextColor3 = theme.accent
            end
        end
        if btn:IsA("TextLabel") then
            if btn.Name == "Title" or btn.Name == "Watermark" then
                btn.TextColor3 = theme.accent
            elseif btn ~= sliderLabel and btn ~= circleText then
                btn.TextColor3 = theme.text
            end
        end
    end
    
    for _, container in pairs(frame:GetChildren()) do
        if container:IsA("Frame") and container ~= header and container ~= sliderContainer then
            container.BackgroundColor3 = theme.btn
            container.BorderColor3 = theme.accent
        end
    end
    
    if sliderContainer then
        sliderContainer.BackgroundColor3 = theme.btn
        sliderContainer.BorderColor3 = theme.accent
        if sliderLabel then sliderLabel.TextColor3 = theme.text end
        if minusBtn then minusBtn.BackgroundColor3 = theme.accent end
        if plusBtn then plusBtn.BackgroundColor3 = theme.accent end
    end
    
    for _, highlight in pairs(espHighlights) do
        if highlight and highlight.Parent then
            highlight.FillColor = theme.accent
        end
    end
    
    if mButton then
        mButton.BackgroundColor3 = theme.main
        mButton.TextColor3 = theme.accent
        if mGlow then
            mGlow.BackgroundColor3 = theme.accent
        end
    end
    
    if watermark then
        watermark.TextColor3 = theme.accent
    end
    
    if restartBtn then
        restartBtn.BackgroundColor3 = theme.btn
        restartBtn.TextColor3 = theme.accent
    end
    if siteBtn then
        siteBtn.BackgroundColor3 = theme.btn
        siteBtn.TextColor3 = theme.accent
    end
end

-- ============================================================
--  [9] ESP SYSTEM
-- ============================================================
local espHighlights = {}
local espState = false

local function toggleESP(state)
    espState = state
    if state then
        for _, plr in pairs(game:GetService("Players"):GetPlayers()) do
            if plr ~= player and plr.Character then
                local highlight = Instance.new("Highlight")
                highlight.Parent = plr.Character
                highlight.FillColor = THEMES[currentTheme].accent
                highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                highlight.FillTransparency = 0.3
                highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                table.insert(espHighlights, highlight)
            end
        end
    else
        for _, highlight in pairs(espHighlights) do
            if highlight and highlight.Parent then
                highlight:Destroy()
            end
        end
        espHighlights = {}
    end
end

-- ============================================================
--  [10] SILENT AIM - ВИДИМАЯ ВЕРСИЯ
-- ============================================================
local silentAimEnabled = false
local silentAimRadius = 5

-- Круг
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

local circleCorners = Instance.new("UICorner")
circleCorners.CornerRadius = UDim.new(1, 0)
circleCorners.Parent = circleBorder

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
    silentAimRadius = math.clamp(value, 1, 10)
    local size = 60 + (silentAimRadius - 1) * 10
    circle.Size = UDim2.new(0, size, 0, size)
    circle.Position = UDim2.new(0.5, -size/2, 0.5, -size/2)
    circleText.Text = tostring(silentAimRadius)
end

-- Ползунок
local sliderContainer = Instance.new("Frame")
sliderContainer.Size = UDim2.new(0.8, 0, 0, 50)
sliderContainer.Position = UDim2.new(0.1, 0, 0.45, 0)
sliderContainer.BackgroundColor3 = THEMES[currentTheme].btn
sliderContainer.BackgroundTransparency = 0
sliderContainer.BorderSizePixel = 1
sliderContainer.BorderColor3 = THEMES[currentTheme].accent
sliderContainer.Visible = false
sliderContainer.Parent = frame

local sliderCorners = Instance.new("UICorner")
sliderCorners.CornerRadius = UDim.new(0, 10)
sliderCorners.Parent = sliderContainer

local sliderLabel = Instance.new("TextLabel")
sliderLabel.Size = UDim2.new(0.4, 0, 1, 0)
sliderLabel.Position = UDim2.new(0.05, 0, 0, 0)
sliderLabel.BackgroundTransparency = 1
sliderLabel.Text = "Радиус: 5"
sliderLabel.TextColor3 = THEMES[currentTheme].text
sliderLabel.TextSize = 14
sliderLabel.Font = Enum.Font.SourceSansBold
sliderLabel.TextXAlignment = Enum.TextXAlignment.Left
sliderLabel.Parent = sliderContainer

local minusBtn = Instance.new("TextButton")
minusBtn.Size = UDim2.new(0, 30, 0, 30)
minusBtn.Position = UDim2.new(0.55, 0, 0.5, -15)
minusBtn.BackgroundColor3 = THEMES[currentTheme].accent
minusBtn.Text = "-"
minusBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
minusBtn.TextSize = 20
minusBtn.Font = Enum.Font.SourceSansBold
minusBtn.Parent = sliderContainer

local minusCorners = Instance.new("UICorner")
minusCorners.CornerRadius = UDim.new(0, 8)
minusCorners.Parent = minusBtn

local plusBtn = Instance.new("TextButton")
plusBtn.Size = UDim2.new(0, 30, 0, 30)
plusBtn.Position = UDim2.new(0.75, 0, 0.5, -15)
plusBtn.BackgroundColor3 = THEMES[currentTheme].accent
plusBtn.Text = "+"
plusBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
plusBtn.TextSize = 20
plusBtn.Font = Enum.Font.SourceSansBold
plusBtn.Parent = sliderContainer

local plusCorners = Instance.new("UICorner")
plusCorners.CornerRadius = UDim.new(0, 8)
plusCorners.Parent = plusBtn

minusBtn.MouseButton1Click:Connect(function()
    updateCircleRadius(silentAimRadius - 1)
    sliderLabel.Text = "Радиус: " .. tostring(silentAimRadius)
end)

plusBtn.MouseButton1Click:Connect(function()
    updateCircleRadius(silentAimRadius + 1)
    sliderLabel.Text = "Радиус: " .. tostring(silentAimRadius)
end)

-- ===== КНОПКА SILENT AIM (ВИДИМАЯ) =====
local silentToggleContainer, silentToggle, silentKnob = UI:createToggle(
    frame,
    "🎯 Silent Aim",
    UDim2.new(0.05, 0, 0.28, 0),
    false,
    function(state)
        silentAimEnabled = state
        circle.Visible = state
        sliderContainer.Visible = state
        if state then
            updateCircleRadius(silentAimRadius)
        end
        print("🎯 Silent Aim: " .. (state and "ВКЛ" or "ВЫКЛ"))
    end
)

-- Логика Silent Aim
local function silentAimLogic()
    local oldFire = nil
    local hookFunction = function(self, ...)
        local args = {...}
        if silentAimEnabled then
            local target = nil
            local minDist = math.huge
            local playerPos = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            if playerPos then
                for _, plr in pairs(game:GetService("Players"):GetPlayers()) do
                    if plr ~= player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                        local dist = (plr.Character.HumanoidRootPart.Position - playerPos.Position).Magnitude
                        if dist < minDist and dist < silentAimRadius * 20 then
                            minDist = dist
                            target = plr
                        end
                    end
                end
            end
            if target then
                for i, arg in pairs(args) do
                    if type(arg) == "Instance" and arg:IsA("Player") then
                        args[i] = target
                    end
                end
            end
        end
        return oldFire(self, unpack(args))
    end

    for _, child in pairs(game:GetDescendants()) do
        if child:IsA("RemoteEvent") and (child.Name:lower():find("attack") or child.Name:lower():find("damage") or child.Name:lower():find("fire")) then
            if not child._hooked then
                child._hooked = true
                oldFire = child.FireServer
                child.FireServer = hookFunction
            end
        end
    end
end

spawn(function()
    while wait(2) do
        pcall(silentAimLogic)
    end
end)

-- ============================================================
--  [11] HELLO SCREEN
-- ============================================================
local hello = Instance.new("TextLabel")
hello.Size = UDim2.new(1, 0, 1, 0)
hello.BackgroundTransparency = 1
hello.Text = "✦ Hello! ✦"
hello.TextColor3 = THEMES[currentTheme].accent
hello.TextScaled = true
hello.Font = Enum.Font.SourceSansBold
hello.Parent = gui

Animation:tween(hello, {TextTransparency = 1}, 1.5)
game:GetService("Debris"):AddItem(hello, 1.5)

wait(1.5)

-- ============================================================
--  [12] MAIN MENU
-- ============================================================
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 440, 0, 560)
frame.Position = UDim2.new(0.5, -220, 0.5, -280)
frame.BackgroundColor3 = THEMES[currentTheme].main
frame.BackgroundTransparency = 0
frame.BorderSizePixel = 2
frame.BorderColor3 = THEMES[currentTheme].accent
frame.Active = true
frame.Draggable = true
frame.ClipsDescendants = true
frame.Parent = gui

local frameCorners = Instance.new("UICorner")
frameCorners.CornerRadius = UDim.new(0, 20)
frameCorners.Parent = frame

local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 56)
header.BackgroundColor3 = THEMES[currentTheme].header
header.BackgroundTransparency = 0
header.Parent = frame

local headerCorners = Instance.new("UICorner")
headerCorners.CornerRadius = UDim.new(0, 20)
headerCorners.Parent = header

local accentLine = Instance.new("Frame")
accentLine.Size = UDim2.new(1, 0, 0, 2)
accentLine.Position = UDim2.new(0, 0, 1, -2)
accentLine.BackgroundColor3 = THEMES[currentTheme].accent
accentLine.BackgroundTransparency = 0.3
accentLine.Parent = header

local title = Instance.new("TextLabel")
title.Name = "Title"
title.Size = UDim2.new(0.55, 0, 1, 0)
title.Position = UDim2.new(0.05, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "◈ MUSLIM MENU"
title.TextColor3 = THEMES[currentTheme].accent
title.TextSize = 20
title.Font = Enum.Font.SourceSansBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = header

local versionBadge = Instance.new("TextLabel")
versionBadge.Size = UDim2.new(0, 60, 0, 22)
versionBadge.Position = UDim2.new(0.6, 0, 0.5, -11)
versionBadge.BackgroundColor3 = THEMES[currentTheme].accent
versionBadge.BackgroundTransparency = 0.15
versionBadge.Text = CONFIG.VERSION
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
closeBtn.Size = UDim2.new(0, 38, 0, 38)
closeBtn.Position = UDim2.new(0.91, 0, 0.5, -19)
closeBtn.BackgroundColor3 = Color3.fromRGB(200, 40, 40)
closeBtn.BackgroundTransparency = 0
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.TextSize = 18
closeBtn.Font = Enum.Font.SourceSansBold
closeBtn.Parent = header

local closeCorners = Instance.new("UICorner")
closeCorners.CornerRadius = UDim.new(0, 10)
closeCorners.Parent = closeBtn

-- ===== ПЛАВАЮЩАЯ КНОПКА "M" =====
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

local mGlow = Instance.new("Frame")
mGlow.Size = UDim2.new(1, 20, 1, 20)
mGlow.Position = UDim2.new(0, -10, 0, -10)
mGlow.BackgroundColor3 = THEMES[currentTheme].accent
mGlow.BackgroundTransparency = 0.8
mGlow.ZIndex = -1
mGlow.Parent = mButton

local mGlowCorners = Instance.new("UICorner")
mGlowCorners.CornerRadius = UDim.new(0, 24)
mGlowCorners.Parent = mGlow

closeBtn.MouseButton1Click:Connect(function()
    Animation:fadeOut(frame, 0.3)
    wait(0.3)
    frame.Visible = false
    mButton.Visible = true
    Animation:fadeIn(mButton, 0.3)
end)

mButton.MouseButton1Click:Connect(function()
    frame.Visible = true
    mButton.Visible = false
    Animation:fadeIn(frame, 0.3)
end)

-- ============================================================
--  [13] MENU COMPONENTS
-- ============================================================
local espContainer, espToggle, espKnob = UI:createToggle(
    frame,
    "◈ ESP (подсветка)",
    UDim2.new(0.05, 0, 0.14, 0),
    false,
    function(state)
        toggleESP(state)
    end
)

createThemeSelector(frame)

local restartBtn = UI:createButton(
    frame,
    "⟳ Перезапустить",
    UDim2.new(0.05, 0, 0.82, 0),
    UDim2.new(0.4, 0, 0, 40),
    function()
        Animation:fadeOut(frame, 0.2)
        wait(0.2)
        frame.Visible = false
        wait(0.3)
        frame.Visible = true
        Animation:fadeIn(frame, 0.2)
    end
)

local siteBtn = UI:createButton(
    frame,
    "🌐 Сайт",
    UDim2.new(0.55, 0, 0.82, 0),
    UDim2.new(0.4, 0, 0, 40),
    function()
        setclipboard(CONFIG.WEBSITE)
        print("🌐 " .. CONFIG.WEBSITE .. " скопирована!")
        siteBtn.Text = "✓ Скопировано!"
        siteBtn.TextColor3 = Color3.fromRGB(80, 220, 140)
        wait(1.5)
        siteBtn.Text = "🌐 Сайт"
        siteBtn.TextColor3 = THEMES[currentTheme].accent
    end
)

local watermark = Instance.new("TextLabel")
watermark.Name = "Watermark"
watermark.Size = UDim2.new(0.6, 0, 0, 28)
watermark.Position = UDim2.new(0.05, 0, 0.93, 0)
watermark.BackgroundTransparency = 1
watermark.Text = "◈ Tormentor412"
watermark.TextColor3 = THEMES[currentTheme].accent
watermark.TextSize = 14
watermark.Font = Enum.Font.SourceSansBold
watermark.TextXAlignment = Enum.TextXAlignment.Left
watermark.TextTransparency = 0.3
watermark.Parent = frame

Animation:fadeIn(frame, 0.5)

print("========================================")
print("  " .. CONFIG.NAME .. " " .. CONFIG.VERSION)
print("  Developer: " .. CONFIG.DEVELOPER)
print("  Theme: " .. THEMES[currentTheme].name)
print("  Loaded successfully! ✦")
print("========================================")

getgenv().MuslimMenu = {
    version = CONFIG.VERSION,
    setTheme = function(theme)
        if THEMES[theme] then
            currentTheme = theme
            updateTheme(theme)
        end
    end,
    toggleESP = toggleESP,
    getESPState = function() return espState end,
    toggleSilentAim = function(state)
        silentAimEnabled = state
        circle.Visible = state
        sliderContainer.Visible = state
        if state then updateCircleRadius(silentAimRadius) end
    end,
    config = CONFIG
}

print("✅ API exposed: getgenv().MuslimMenu")
