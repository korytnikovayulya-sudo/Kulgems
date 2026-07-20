-- ============================================================
--  MUSLIM MENU v9.0 - COMPLETE REWORK
--  by Tormentor412
-- ============================================================

repeat wait() until game:IsLoaded()
print("🚀 Загрузка Muslim Menu v9.0...")

-- ============================================================
--  [1] ОЧИСТКА
-- ============================================================
pcall(function()
    local player = game:GetService("Players").LocalPlayer
    if player and player.PlayerGui then
        for _, v in pairs(player.PlayerGui:GetChildren()) do
            if v.Name == "MuslimMenu" or v.Name == "ErrorNotify" then
                v:Destroy()
            end
        end
    end
end)

-- ============================================================
--  [2] КОНФИГ
-- ============================================================
local CONFIG = {
    NAME = "MUSLIM MENU",
    VERSION = "v9.0",
    DEVELOPER = "Tormentor412"
}

-- ============================================================
--  [3] ТЕМЫ (РАБОЧИЕ)
-- ============================================================
local THEMES = {
    midnight = {
        name = "🌙 Midnight",
        main = Color3.fromRGB(10, 10, 14),
        accent = Color3.fromRGB(100, 180, 255),
        header = Color3.fromRGB(16, 18, 24),
        btn = Color3.fromRGB(22, 26, 34),
        hover = Color3.fromRGB(34, 40, 52),
        text = Color3.fromRGB(220, 230, 240)
    },
    emerald = {
        name = "🌿 Emerald",
        main = Color3.fromRGB(8, 18, 12),
        accent = Color3.fromRGB(80, 220, 140),
        header = Color3.fromRGB(14, 30, 20),
        btn = Color3.fromRGB(22, 40, 30),
        hover = Color3.fromRGB(34, 56, 44),
        text = Color3.fromRGB(220, 240, 230)
    },
    ruby = {
        name = "♦ Ruby",
        main = Color3.fromRGB(18, 6, 6),
        accent = Color3.fromRGB(255, 70, 70),
        header = Color3.fromRGB(32, 10, 10),
        btn = Color3.fromRGB(44, 18, 18),
        hover = Color3.fromRGB(60, 28, 28),
        text = Color3.fromRGB(240, 220, 220)
    },
    royal = {
        name = "👑 Royal",
        main = Color3.fromRGB(14, 6, 22),
        accent = Color3.fromRGB(200, 120, 255),
        header = Color3.fromRGB(24, 12, 36),
        btn = Color3.fromRGB(34, 20, 48),
        hover = Color3.fromRGB(48, 32, 64),
        text = Color3.fromRGB(230, 220, 240)
    },
    gold = {
        name = "★ Gold",
        main = Color3.fromRGB(16, 14, 8),
        accent = Color3.fromRGB(255, 215, 0),
        header = Color3.fromRGB(28, 24, 14),
        btn = Color3.fromRGB(40, 34, 20),
        hover = Color3.fromRGB(56, 48, 30),
        text = Color3.fromRGB(240, 235, 220)
    }
}

local currentTheme = "midnight"

-- ============================================================
--  [4] СЕРВИСЫ
-- ============================================================
local player = game:GetService("Players").LocalPlayer
local tweenService = game:GetService("TweenService")
local userInputService = game:GetService("UserInputService")
local runService = game:GetService("RunService")

-- ============================================================
--  [5] СОЗДАНИЕ GUI
-- ============================================================
local gui = Instance.new("ScreenGui")
gui.Name = "MuslimMenu"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = player:WaitForChild("PlayerGui")

-- ============================================================
--  [6] АНИМАЦИИ
-- ============================================================
local function tween(obj, props, duration)
    if not obj then return end
    local info = TweenInfo.new(duration or 0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local t = tweenService:Create(obj, info, props)
    t:Play()
    return t
end

-- ============================================================
--  [7] UI КОМПОНЕНТЫ
-- ============================================================
local function createButton(parent, text, pos, size, callback)
    if not parent then return end
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
        tween(btn, {BackgroundColor3 = THEMES[currentTheme].hover}, 0.2)
        tween(btn, {TextSize = 17}, 0.2)
    end)
    btn.MouseLeave:Connect(function()
        tween(btn, {BackgroundColor3 = THEMES[currentTheme].btn}, 0.2)
        tween(btn, {TextSize = 16}, 0.2)
    end)
    
    btn.MouseButton1Click:Connect(callback)
    return btn
end

local function createToggle(parent, label, pos, defaultValue, callback)
    if not parent then return end
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
        tween(knob, {Position = state and UDim2.new(0.55, 0, 0.5, -11) or UDim2.new(0.05, 0, 0.5, -11)}, 0.2)
        if callback then callback(state) end
    end)
    
    return container, toggle, knob
end

-- ============================================================
--  [8] ESP СИСТЕМА (СКРЫТАЯ, ПОКА НЕ ВКЛЮЧЕНА)
-- ============================================================
local espType = "Box"
local espDistance = 100
local espHighlights = {}
local espState = false
local espNameLabels = {}

-- Функция создания текста над головой
local function createNameLabel(plr)
    if not plr or not plr.Character then return end
    local head = plr.Character:FindFirstChild("Head")
    if not head then return end
    
    local label = Instance.new("BillboardGui")
    label.Size = UDim2.new(0, 200, 0, 50)
    label.Adornee = head
    label.AlwaysOnTop = true
    label.Parent = head
    
    local text = Instance.new("TextLabel")
    text.Size = UDim2.new(1, 0, 1, 0)
    text.BackgroundTransparency = 1
    text.Text = plr.Name
    text.TextColor3 = THEMES[currentTheme].accent
    text.TextSize = 18
    text.Font = Enum.Font.SourceSansBold
    text.TextStrokeTransparency = 0.5
    text.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    text.Parent = label
    
    return label
end

local function toggleESP(state)
    espState = state
    
    -- Очищаем старые
    for _, highlight in pairs(espHighlights) do
        if highlight and highlight.Parent then
            highlight:Destroy()
        end
    end
    espHighlights = {}
    
    for _, label in pairs(espNameLabels) do
        if label and label.Parent then
            label:Destroy()
        end
    end
    espNameLabels = {}
    
    if not state then return end
    
    for _, plr in pairs(game:GetService("Players"):GetPlayers()) do
        if plr ~= player and plr.Character then
            -- Highlight (подсветка)
            local highlight = Instance.new("Highlight")
            highlight.Parent = plr.Character
            highlight.FillColor = THEMES[currentTheme].accent
            highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            
            if espType == "Skeleton" then
                highlight.FillTransparency = 1
                highlight.OutlineTransparency = 0
            elseif espType == "Name" then
                highlight.FillTransparency = 0.8
                highlight.OutlineTransparency = 0.5
                local label = createNameLabel(plr)
                if label then table.insert(espNameLabels, label) end
            elseif espType == "Distance" then
                highlight.FillTransparency = 0.5
                -- Можно добавить дистанцию в текст
            end
            -- Box — стандарт (прозрачность 0.3)
            
            table.insert(espHighlights, highlight)
        end
    end
end

-- ============================================================
--  [9] SILENT AIM (УЛУЧШЕННЫЙ, ДО 30 РАДИУСА)
-- ============================================================
local silentAimEnabled = false
local silentAimRadius = 5
local silentAimPart = "Head" -- Цель: голова

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
    silentAimRadius = math.clamp(value, 1, 30)
    local size = 60 + (silentAimRadius - 1) * 6
    circle.Size = UDim2.new(0, size, 0, size)
    circle.Position = UDim2.new(0.5, -size/2, 0.5, -size/2)
    circleText.Text = tostring(silentAimRadius)
end

-- Ползунок радиуса
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

-- ============================================================
--  [10] SILENT AIM ЛОГИКА (АВТОНАВОДКА)
-- ============================================================
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

-- Хук для автонаводки
pcall(function()
    local oldFire = nil
    local hookFunction = function(self, ...)
        local args = {...}
        if silentAimEnabled then
            local target = getClosestTarget()
            if target then
                -- Подменяем цель в аргументах
                for i, arg in pairs(args) do
                    if type(arg) == "Instance" and arg:IsA("Player") then
                        args[i] = target
                    end
                    -- Если аргумент это строка с именем игрока
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

    -- Перехватываем все RemoteEvent
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
--  [11] ТЕМЫ (ПОЛНОСТЬЮ РАБОЧИЕ)
-- ============================================================
local function updateTheme(themeName)
    local theme = THEMES[themeName]
    if not theme or not frame then return end
    
    -- Основное окно
    frame.BackgroundColor3 = theme.main
    frame.BorderColor3 = theme.accent
    
    -- Хедер
    if header then
        header.BackgroundColor3 = theme.header
        if title then title.TextColor3 = theme.accent end
        if versionBadge then
            versionBadge.BackgroundColor3 = theme.accent
            versionBadge.TextColor3 = theme.main
        end
        if accentLine then accentLine.BackgroundColor3 = theme.accent end
    end
    
    -- Все кнопки и контейнеры
    for _, child in pairs(frame:GetDescendants()) do
        if child:IsA("TextButton") then
            if child.Name ~= "CloseBtn" and child ~= minusBtn and child ~= plusBtn then
                child.BackgroundColor3 = theme.btn
                child.TextColor3 = theme.accent
            end
        elseif child:IsA("TextLabel") then
            if child.Name ~= "Watermark" and child ~= sliderLabel and child ~= circleText then
                child.TextColor3 = theme.text
            end
        elseif child:IsA("Frame") and child ~= header and child ~= sliderContainer then
            child.BackgroundColor3 = theme.btn
            child.BorderColor3 = theme.accent
        end
    end
    
    -- Слайдер
    if sliderContainer then
        sliderContainer.BackgroundColor3 = theme.btn
        sliderContainer.BorderColor3 = theme.accent
        if sliderLabel then sliderLabel.TextColor3 = theme.text end
        if minusBtn then minusBtn.BackgroundColor3 = theme.accent end
        if plusBtn then plusBtn.BackgroundColor3 = theme.accent end
    end
    
    -- ESP подсветка
    for _, highlight in pairs(espHighlights) do
        if highlight and highlight.Parent then
            highlight.FillColor = theme.accent
        end
    end
    
    -- Кнопка M
    if mButton then
        mButton.BackgroundColor3 = theme.main
        mButton.TextColor3 = theme.accent
        if mGlow then mGlow.BackgroundColor3 = theme.accent end
    end
    
    -- Водяной знак
    if watermark then watermark.TextColor3 = theme.accent end
    
    -- Кнопки внизу
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
--  [12] ОСНОВНОЕ ОКНО
-- ============================================================
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 340, 0, 460)
frame.Position = UDim2.new(0.5, -170, 0.5, -230)
frame.BackgroundColor3 = THEMES[currentTheme].main
frame.BackgroundTransparency = 0
frame.BorderSizePixel = 2
frame.BorderColor3 = THEMES[currentTheme].accent
frame.Parent = gui

local frameCorners = Instance.new("UICorner")
frameCorners.CornerRadius = UDim.new(0, 14)
frameCorners.Parent = frame

-- ============================================================
--  [13] ХЕДЕР
-- ============================================================
local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 56)
header.BackgroundColor3 = THEMES[currentTheme].header
header.BackgroundTransparency = 0
header.BorderSizePixel = 0
header.Parent = frame

local headerCorners = Instance.new("UICorner")
headerCorners.CornerRadius = UDim.new(0, 14)
headerCorners.Parent = header

local title = Instance.new("TextLabel")
title.Size = UDim2.new(0.5, 0, 1, 0)
title.Position = UDim2.new(0.05, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "⚡ MUSLIM MENU"
title.TextColor3 = THEMES[currentTheme].accent
title.TextSize = 20
title.Font = Enum.Font.SourceSansBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = header

local versionBadge = Instance.new("TextLabel")
versionBadge.Size = UDim2.new(0, 50, 0, 22)
versionBadge.Position = UDim2.new(0.55, 0, 0.5, -11)
versionBadge.BackgroundColor3 = THEMES[currentTheme].accent
versionBadge.BackgroundTransparency = 0
versionBadge.Text = CONFIG.VERSION
versionBadge.TextColor3 = THEMES[currentTheme].main
versionBadge.TextSize = 12
versionBadge.Font = Enum.Font.SourceSansBold
versionBadge.Parent = header

local versionCorners = Instance.new("UICorner")
versionCorners.CornerRadius = UDim.new(0, 8)
versionCorners.Parent = versionBadge

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(0.92, 0, 0.5, -15)
closeBtn.BackgroundTransparency = 1
closeBtn.Text = "✕"
closeBtn.TextColor3 = THEMES[currentTheme].text
closeBtn.TextSize = 20
closeBtn.Font = Enum.Font.SourceSansBold
closeBtn.Name = "CloseBtn"
closeBtn.Parent = header

closeBtn.MouseButton1Click:Connect(function()
    frame.Visible = false
end)

local accentLine = Instance.new("Frame")
accentLine.Size = UDim2.new(0.9, 0, 0, 2)
accentLine.Position = UDim2.new(0.05, 0, 1, 0)
accentLine.BackgroundColor3 = THEMES[currentTheme].accent
accentLine.BackgroundTransparency = 0
accentLine.BorderSizePixel = 0
accentLine.Parent = header

-- ============================================================
--  [14] ESP TOGGLE (ВКЛЮЧАЕТ ПОКАЗ НАСТРОЕК)
-- ============================================================
local espSubMenuContainer = nil

local espToggleContainer, espToggle, espKnob = createToggle(
    frame,
    "👁️ ESP",
    UDim2.new(0.05, 0, 0.08, 0),
    false,
    function(state)
        toggleESP(state)
        -- Показываем/скрываем настройки ESP
        if espSubMenuContainer then
            espSubMenuContainer.Visible = state
        end
        print("👁️ ESP: " .. (state and "ВКЛ" or "ВЫКЛ"))
    end
)

-- ============================================================
--  [15] ESP SUB-MENU (СКРЫТО, ПОКА ESP ВЫКЛЮЧЕН)
-- ============================================================
local function createESPSubMenu(parent)
    if not parent then return end
    local container = Instance.new("Frame")
    container.Size = UDim2.new(0.9, 0, 0, 130)
    container.Position = UDim2.new(0.05, 0, 0.12, 0)
    container.BackgroundColor3 = THEMES[currentTheme].btn
    container.BackgroundTransparency = 0
    container.BorderSizePixel = 1
    container.BorderColor3 = THEMES[currentTheme].accent
    container.Visible = false
    container.Parent = parent
    
    local corners = Instance.new("UICorner")
    corners.CornerRadius = UDim.new(0, 10)
    corners.Parent = container
    
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 24)
    title.Position = UDim2.new(0, 0, 0, 4)
    title.BackgroundTransparency = 1
    title.Text = "🎯 ESP Настройки"
    title.TextColor3 = THEMES[currentTheme].accent
    title.TextSize = 14
    title.Font = Enum.Font.SourceSansBold
    title.Parent = container
    
    local types = {"Box", "Skeleton", "Name", "Distance"}
    for i, t in ipairs(types) do
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(0.22, 0, 0, 28)
        btn.Position = UDim2.new(0.02 + (i-1) * 0.24, 0, 0.35, 0)
        btn.BackgroundColor3 = (espType == t) and THEMES[currentTheme].accent or THEMES[currentTheme].btn
        btn.Text = t
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.TextSize = 12
        btn.Font = Enum.Font.SourceSansBold
        btn.Parent = container
        
        local btnCorners = Instance.new("UICorner")
        btnCorners.CornerRadius = UDim.new(0, 6)
        btnCorners.Parent = btn
        
        btn.MouseButton1Click:Connect(function()
            espType = t
            for _, child in pairs(container:GetChildren()) do
                if child:IsA("TextButton") and child.Text ~= "ESP" and child.Text ~= "🎯 ESP Настройки" then
                    child.BackgroundColor3 = (child.Text == t) and THEMES[currentTheme].accent or THEMES[currentTheme].btn
                end
            end
            if espState then
                toggleESP(true)
            end
            print("🔧 ESP тип: " .. t)
        end)
    end
    
    local distLabel = Instance.new("TextLabel")
    distLabel.Size = UDim2.new(0.3, 0, 0, 20)
    distLabel.Position = UDim2.new(0.02, 0, 0.72, 0)
    distLabel.BackgroundTransparency = 1
    distLabel.Text = "Дист: 100"
    distLabel.TextColor3 = THEMES[currentTheme].text
    distLabel.TextSize = 12
    distLabel.Font = Enum.Font.SourceSansBold
    distLabel.TextXAlignment = Enum.TextXAlignment.Left
    distLabel.Parent = container
    
    local distMinus = Instance.new("TextButton")
    distMinus.Size = UDim2.new(0, 24, 0, 24)
    distMinus.Position = UDim2.new(0.65, 0, 0.72, -2)
    distMinus.BackgroundColor3 = THEMES[currentTheme].accent
    distMinus.Text = "-"
    distMinus.TextColor3 = Color3.fromRGB(255, 255, 255)
    distMinus.TextSize = 16
    distMinus.Font = Enum.Font.SourceSansBold
    distMinus.Parent = container
    
    local distCorners1 = Instance.new("UICorner")
    distCorners1.CornerRadius = UDim.new(0, 6)
    distCorners1.Parent = distMinus
    
    local distPlus = Instance.new("TextButton")
    distPlus.Size = UDim2.new(0, 24, 0, 24)
    distPlus.Position = UDim2.new(0.82, 0, 0.72, -2)
    distPlus.BackgroundColor3 = THEMES[currentTheme].accent
    distPlus.Text = "+"
    distPlus.TextColor3 = Color3.fromRGB(255, 255, 255)
    distPlus.TextSize = 16
    distPlus.Font = Enum.Font.SourceSansBold
    distPlus.Parent = container
    
    local distCorners2 = Instance.new("UICorner")
    distCorners2.CornerRadius = UDim.new(0, 6)
    distCorners2.Parent = distPlus
    
    distMinus.MouseButton1Click:Connect(function()
        espDistance = math.max(10, espDistance - 10)
        distLabel.Text = "Дист: " .. espDistance
        if espState then toggleESP(true) end
    end)
    
    distPlus.MouseButton1Click:Connect(function()
        espDistance = math.min(500, espDistance + 10)
        distLabel.Text = "Дист: " .. espDistance
        if espState then toggleESP(true) end
    end)
    
    return container
end

espSubMenuContainer = createESPSubMenu(frame)

-- ============================================================
--  [16] SILENT AIM TOGGLE
-- ============================================================
local silentToggleContainer, silentToggle, silentKnob = createToggle(
    frame,
    "🎯 Silent Aim",
    UDim2.new(0.05, 0, 0.38, 0),
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

-- ============================================================
--  [17] ТЕМЫ (СЕЛЕКТОР)
-- ============================================================
local themeContainer = Instance.new("Frame")
themeContainer.Size = UDim2.new(0.9, 0, 0, 42)
themeContainer.Position = UDim2.new(0.05, 0, 0.62, 0)
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

local themeNames = {"midnight", "emerald", "ruby", "royal", "gold"}
local themeIcons = {"🌙", "🌿", "♦", "👑", "★"}
local themeColors = {
    midnight = Color3.fromRGB(100, 180, 255),
    emerald = Color3.fromRGB(80, 220, 140),
    ruby = Color3.fromRGB(255, 70, 70),
    royal = Color3.fromRGB(200, 120, 255),
    gold = Color3.fromRGB(255, 215, 0)
}

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
--  [18] КНОПКИ ВНИЗУ
-- ============================================================
local restartBtn = createButton(
    frame,
    "🔄 Перезапустить",
    UDim2.new(0.05, 0, 0.72, 0),
    UDim2.new(0.43, 0, 0, 38),
    function()
        print("🔄 Перезапуск...")
        gui:Destroy()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/korytnikovayulya-sudo/Kulgems/main/menu.lua"))()
    end
)

local siteBtn = createButton(
    frame,
    "🌐 Сайт",
    UDim2.new(0.52, 0, 0.72, 0),
    UDim2.new(0.43, 0, 0, 38),
    function()
        setclipboard("https://korytnikovayulya-sudo.github.io/muslim-menu-site/")
        print("🌐 Ссылка скопирована!")
    end
)

-- ============================================================
--  [19] ВОДЯНОЙ ЗНАК
-- ============================================================
local watermark = Instance.new("TextLabel")
watermark.Size = UDim2.new(1, 0, 0, 20)
watermark.Position = UDim2.new(0, 0, 0.94, 0)
watermark.BackgroundTransparency = 1
watermark.Text = CONFIG.NAME .. " " .. CONFIG.VERSION .. " | " .. CONFIG.DEVELOPER
watermark.TextColor3 = THEMES[currentTheme].accent
watermark.TextSize = 10
watermark.Font = Enum.Font.SourceSans
watermark.TextTransparency = 0.5
watermark.Name = "Watermark"
watermark.Parent = frame

-- ============================================================
--  [20] УМНЫЙ СЧЁТЧИК ДРУЗЕЙ
-- ============================================================
local friendsLabel = Instance.new("TextLabel")
friendsLabel.Size = UDim2.new(0.9, 0, 0, 24)
friendsLabel.Position = UDim2.new(0.05, 0, 0.86, 0)
friendsLabel.BackgroundTransparency = 1
friendsLabel.Text = "👥 Пригласи друзей!"
friendsLabel.TextColor3 = Color3.fromRGB(255, 200, 100)
friendsLabel.TextSize = 13
friendsLabel.Font = Enum.Font.SourceSansBold
friendsLabel.Name = "FriendsLabel"
friendsLabel.Parent = frame

spawn(function()
    while frame and frame.Parent do
        local friends = 0 -- Сюда впиши свою логику получения друзей
        if friends == 0 then
            friendsLabel.Text = "👥 Пригласи друзей!"
            friendsLabel.TextColor3 = Color3.fromRGB(255, 200, 100)
        else
            friendsLabel.Text = "👥 Друзья играют: " .. friends
            friendsLabel.TextColor3 = THEMES[currentTheme].text
        end
        wait(5)
    end
end)

-- ============================================================
--  [21] ХОТКЕЙ F1
-- ============================================================
userInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.F1 then
        if frame then
            frame.Visible = not frame.Visible
            print("🔘 Toggle: " .. (frame.Visible and "Показано" or "Скрыто"))
        end
    end
end)

-- ============================================================
--  [22] ПЛАВАЮЩАЯ КНОПКА M
-- ============================================================
local mButton = Instance.new("TextButton")
mButton.Size = UDim2.new(0, 50, 0, 50)
mButton.Position = UDim2.new(0.02, 0, 0.85, 0)
mButton.BackgroundColor3 = THEMES[currentTheme].main
mButton.BackgroundTransparency = 0
mButton.BorderSizePixel = 2
mButton.BorderColor3 = THEMES[currentTheme].accent
mButton.Text = "M"
mButton.TextColor3 = THEMES[currentTheme].accent
mButton.TextSize = 22
mButton.Font = Enum.Font.SourceSansBold
mButton.Name = "FloatBtn"
mButton.Visible = false
mButton.Parent = gui

local mCorners = Instance.new("UICorner")
mCorners.CornerRadius = UDim.new(1, 0)
mCorners.Parent = mButton

local mGlow = Instance.new("Frame")
mGlow.Size = UDim2.new(1.3, 0, 1.3, 0)
mGlow.Position = UDim2.new(-0.15, 0, -0.15, 0)
mGlow.BackgroundTransparency = 0.6
mGlow.BackgroundColor3 = THEMES[currentTheme].accent
mGlow.BorderSizePixel = 0
mGlow.Parent = mButton

local mGlowCorners = Instance.new("UICorner")
mGlowCorners.CornerRadius = UDim.new(1, 0)
mGlowCorners.Parent = mGlow

mButton.MouseButton1Click:Connect(function()
    if frame then
        frame.Visible = not frame.Visible
    end
end)

-- ============================================================
--  [23] ФИНАЛ
-- ============================================================
print("✅ Muslim Menu v" .. CONFIG.VERSION .. " загружен успешно!")
print("🔑 F1 - открыть/закрыть | M - открыть/закрыть")
