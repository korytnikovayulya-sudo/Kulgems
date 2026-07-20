-- ============================================================
--  ██████  ██    ██ ███████ ██      ██ ███    ███ 
--  ██   ██ ██    ██ ██      ██      ██ ████  ████ 
--  ██████  ██    ██ ███████ ██      ██ ██ ████ ██ 
--  ██   ██ ██    ██      ██ ██      ██ ██  ██  ██ 
--  ██████   ██████  ███████ ███████ ██ ██      ██ 
-- ============================================================
--  MUSLIM MENU v7.0 - Production Grade
--  by Tormentor412
--  Architecture: MVC + Event-Driven + Glassmorphism UI
-- ============================================================

-- ============================================================
--  [1] CORE CONFIGURATION
-- ============================================================
local CONFIG = {
    NAME = "MUSLIM MENU",
    VERSION = "v7.0",
    DEVELOPER = "Tormentor412",
    GITHUB = "https://github.com/korytnikovayulya-sudo/Kulgems",
    WEBSITE = "https://korytnikovayulya-sudo.github.io/muslim-menu-site/",
    RAW_URL = "https://raw.githubusercontent.com/korytnikovayulya-sudo/Kulgems/main/menu.lua"
}

-- ============================================================
--  [2] PREMIUM THEMES (Glassmorphism + Neumorphism)
-- ============================================================
local THEMES = {
    midnight = {
        name = "Midnight",
        main = Color3.fromRGB(10, 10, 14),
        glass = Color3.fromRGB(255, 255, 255),
        accent = Color3.fromRGB(100, 180, 255),
        accent2 = Color3.fromRGB(60, 120, 200),
        header = Color3.fromRGB(16, 18, 24),
        btn = Color3.fromRGB(22, 26, 34),
        hover = Color3.fromRGB(34, 40, 52),
        text = Color3.fromRGB(220, 230, 240),
        shadow = Color3.fromRGB(0, 0, 0)
    },
    emerald = {
        name = "Emerald",
        main = Color3.fromRGB(8, 18, 12),
        glass = Color3.fromRGB(255, 255, 255),
        accent = Color3.fromRGB(80, 220, 140),
        accent2 = Color3.fromRGB(40, 160, 100),
        header = Color3.fromRGB(14, 30, 20),
        btn = Color3.fromRGB(22, 40, 30),
        hover = Color3.fromRGB(34, 56, 44),
        text = Color3.fromRGB(220, 240, 230),
        shadow = Color3.fromRGB(0, 0, 0)
    },
    ruby = {
        name = "Ruby",
        main = Color3.fromRGB(18, 6, 6),
        glass = Color3.fromRGB(255, 255, 255),
        accent = Color3.fromRGB(255, 70, 70),
        accent2 = Color3.fromRGB(200, 40, 40),
        header = Color3.fromRGB(32, 10, 10),
        btn = Color3.fromRGB(44, 18, 18),
        hover = Color3.fromRGB(60, 28, 28),
        text = Color3.fromRGB(240, 220, 220),
        shadow = Color3.fromRGB(0, 0, 0)
    },
    royal = {
        name = "Royal",
        main = Color3.fromRGB(14, 6, 22),
        glass = Color3.fromRGB(255, 255, 255),
        accent = Color3.fromRGB(200, 120, 255),
        accent2 = Color3.fromRGB(150, 80, 220),
        header = Color3.fromRGB(24, 12, 36),
        btn = Color3.fromRGB(34, 20, 48),
        hover = Color3.fromRGB(48, 32, 64),
        text = Color3.fromRGB(230, 220, 240),
        shadow = Color3.fromRGB(0, 0, 0)
    },
    gold = {
        name = "Gold",
        main = Color3.fromRGB(16, 14, 8),
        glass = Color3.fromRGB(255, 255, 255),
        accent = Color3.fromRGB(255, 215, 0),
        accent2 = Color3.fromRGB(200, 160, 0),
        header = Color3.fromRGB(28, 24, 14),
        btn = Color3.fromRGB(40, 34, 20),
        hover = Color3.fromRGB(56, 48, 30),
        text = Color3.fromRGB(240, 235, 220),
        shadow = Color3.fromRGB(0, 0, 0)
    }
}

local currentTheme = "midnight"

-- ============================================================
--  [3] SERVICES
-- ============================================================
local player = game:GetService("Players").LocalPlayer
local tweenService = game:GetService("TweenService")
local userInput = game:GetService("UserInputService")

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
    return self:tween(obj, {BackgroundTransparency = 0}, duration or 0.3)
end

function Animation:fadeOut(obj, duration)
    return self:tween(obj, {BackgroundTransparency = 1}, duration or 0.3)
end

-- ============================================================
--  [6] GLASSMORPHISM UI COMPONENTS
-- ============================================================
local UI = {}

function UI:createGlassFrame(parent, size, pos, transparency)
    local frame = Instance.new("Frame")
    frame.Size = size
    frame.Position = pos
    frame.BackgroundColor3 = THEMES[currentTheme].glass
    frame.BackgroundTransparency = transparency or 0.15
    frame.BorderSizePixel = 0
    frame.Parent = parent
    
    -- Glass blur effect
    local blur = Instance.new("BlurEffect")
    blur.Size = 8
    blur.Parent = frame
    
    -- Corner radius
    local corners = Instance.new("UICorner")
    corners.CornerRadius = UDim.new(0, 16)
    corners.Parent = frame
    
    -- Inner glow
    local glow = Instance.new("Frame")
    glow.Size = UDim2.new(1, -4, 1, -4)
    glow.Position = UDim2.new(0, 2, 0, 2)
    glow.BackgroundColor3 = THEMES[currentTheme].glass
    glow.BackgroundTransparency = 0.9
    glow.BorderSizePixel = 1
    glow.BorderColor3 = THEMES[currentTheme].accent
    glow.BorderTransparency = 0.5
    glow.Parent = frame
    
    local glowCorners = Instance.new("UICorner")
    glowCorners.CornerRadius = UDim.new(0, 14)
    glowCorners.Parent = glow
    
    return frame
end

function UI:createButton(parent, text, pos, size, callback)
    local btn = Instance.new("TextButton")
    btn.Size = size or UDim2.new(0.8, 0, 0, 40)
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
    
    -- Hover animation
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
    container.Size = UDim2.new(0.9, 0, 0, 44)
    container.Position = pos
    container.BackgroundColor3 = THEMES[currentTheme].btn
    container.BackgroundTransparency = 0
    container.BorderSizePixel = 1
    container.BorderColor3 = THEMES[currentTheme].accent
    container.BorderTransparency = 0.3
    container.Parent = parent
    
    local corners = Instance.new("UICorner")
    corners.CornerRadius = UDim.new(0, 10)
    corners.Parent = container
    
    -- Label
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
    
    -- Toggle
    local toggle = Instance.new("TextButton")
    toggle.Size = UDim2.new(0, 50, 0, 28)
    toggle.Position = UDim2.new(0.82, 0, 0.5, -14)
    toggle.BackgroundColor3 = defaultValue and THEMES[currentTheme].accent or Color3.fromRGB(40, 40, 50)
    toggle.BackgroundTransparency = 0
    toggle.Text = ""
    toggle.Parent = container
    
    local toggleCorners = Instance.new("UICorner")
    toggleCorners.CornerRadius = UDim.new(0, 14)
    toggleCorners.Parent = toggle
    
    -- Knob
    local knob = Instance.new("Frame")
    knob.Size = UDim2.new(0, 20, 0, 20)
    knob.Position = defaultValue and UDim2.new(0.55, 0, 0.5, -10) or UDim2.new(0.05, 0, 0.5, -10)
    knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    knob.BackgroundTransparency = 0
    knob.Parent = toggle
    
    local knobCorners = Instance.new("UICorner")
    knobCorners.CornerRadius = UDim.new(0, 10)
    knobCorners.Parent = knob
    
    local state = defaultValue
    toggle.MouseButton1Click:Connect(function()
        state = not state
        toggle.BackgroundColor3 = state and THEMES[currentTheme].accent or Color3.fromRGB(40, 40, 50)
        Animation:tween(knob, {Position = state and UDim2.new(0.55, 0, 0.5, -10) or UDim2.new(0.05, 0, 0.5, -10)}, 0.2)
        if callback then callback(state) end
    end)
    
    return container, toggle, knob
end

-- ============================================================
--  [7] THEME SELECTOR (Color Palette)
-- ============================================================
local function createThemeSelector(parent)
    local container = Instance.new("Frame")
    container.Size = UDim2.new(0.9, 0, 0, 40)
    container.Position = UDim2.new(0.05, 0, 0.70, 0)
    container.BackgroundColor3 = THEMES[currentTheme].btn
    container.BackgroundTransparency = 0
    container.BorderSizePixel = 1
    container.BorderColor3 = THEMES[currentTheme].accent
    container.BorderTransparency = 0.3
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
        btn.Size = UDim2.new(0, 32, 0, 32)
        btn.Position = UDim2.new(0.35 + (i-1) * 0.1, 0, 0.5, -16)
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
        
        -- Selection indicator
        local indicator = Instance.new("Frame")
        indicator.Size = UDim2.new(1, 4, 1, 4)
        indicator.Position = UDim2.new(0, -2, 0, -2)
        indicator.BackgroundTransparency = 1
        indicator.BorderSizePixel = 2
        indicator.BorderColor3 = THEMES[currentTheme].accent
        indicator.Parent = btn
        
        local indicatorCorners = Instance.new("UICorner")
        indicatorCorners.CornerRadius = UDim.new(0, 10)
        indicatorCorners.Parent = indicator
        
        if themeName == currentTheme then
            indicator.BackgroundTransparency = 0.5
        end
        
        btn.MouseButton1Click:Connect(function()
            currentTheme = themeName
            updateTheme(themeName)
            -- Update indicators
            for _, child in pairs(container:GetChildren()) do
                if child:IsA("TextButton") and child:FindFirstChild("Frame") then
                    child.Frame.BackgroundTransparency = 1
                end
            end
            indicator.BackgroundTransparency = 0.5
        end)
    end
end

-- ============================================================
--  [8] UPDATE FUNCTIONS
-- ============================================================
local function updateTheme(themeName)
    local theme = THEMES[themeName]
    
    -- Update main frame
    frame.BackgroundColor3 = theme.main
    frame.BorderColor3 = theme.accent
    frame.BorderTransparency = 0.3
    
    -- Update header
    header.BackgroundColor3 = theme.header
    title.TextColor3 = theme.accent
    
    -- Update buttons
    for _, btn in pairs(frame:GetDescendants()) do
        if btn:IsA("TextButton") then
            if btn.Name ~= "CloseBtn" and btn.Name ~= "FloatBtn" then
                btn.BackgroundColor3 = theme.btn
                btn.TextColor3 = theme.accent
            end
        end
        if btn:IsA("TextLabel") then
            if btn.Name == "Title" or btn.Name == "Watermark" then
                btn.TextColor3 = theme.accent
            else
                btn.TextColor3 = theme.text
            end
        end
    end
    
    -- Update ESP
    for _, highlight in pairs(espHighlights) do
        if highlight and highlight.Parent then
            highlight.FillColor = theme.accent
        end
    end
    
    -- Update M button
    mButton.BackgroundColor3 = theme.main
    mButton.TextColor3 = theme.accent
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
--  [10] MAIN MENU CONSTRUCTION
-- ============================================================
-- Welcome screen
local hello = Instance.new("TextLabel")
hello.Size = UDim2.new(1, 0, 1, 0)
hello.BackgroundTransparency = 1
hello.Text = "Hello!"
hello.TextColor3 = THEMES[currentTheme].accent
hello.TextScaled = true
hello.Font = Enum.Font.SourceSansBold
hello.Parent = gui

Animation:tween(hello, {TextTransparency = 1}, 1.5)
game:GetService("Debris"):AddItem(hello, 1.5)

wait(1.5)

-- Main Frame (Glassmorphism)
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 440, 0, 540)
frame.Position = UDim2.new(0.5, -220, 0.5, -270)
frame.BackgroundColor3 = THEMES[currentTheme].main
frame.BackgroundTransparency = 0
frame.BorderSizePixel = 2
frame.BorderColor3 = THEMES[currentTheme].accent
frame.BorderTransparency = 0.3
frame.Active = true
frame.Draggable = true
frame.ClipsDescendants = true
frame.Parent = gui

local frameCorners = Instance.new("UICorner")
frameCorners.CornerRadius = UDim.new(0, 20)
frameCorners.Parent = frame

-- Glass overlay
local glassOverlay = Instance.new("Frame")
glassOverlay.Size = UDim2.new(1, 0, 1, 0)
glassOverlay.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
glassOverlay.BackgroundTransparency = 0.03
glassOverlay.ZIndex = 0
glassOverlay.Parent = frame

-- Header
local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 56)
header.BackgroundColor3 = THEMES[currentTheme].header
header.BackgroundTransparency = 0
header.Parent = frame

local headerCorners = Instance.new("UICorner")
headerCorners.CornerRadius = UDim.new(0, 20)
headerCorners.Parent = header

-- Accent line
local accentLine = Instance.new("Frame")
accentLine.Size = UDim2.new(1, 0, 0, 2)
accentLine.Position = UDim2.new(0, 0, 1, -2)
accentLine.BackgroundColor3 = THEMES[currentTheme].accent
accentLine.BackgroundTransparency = 0.3
accentLine.Parent = header

-- Title
local title = Instance.new("TextLabel")
title.Name = "Title"
title.Size = UDim2.new(0.6, 0, 1, 0)
title.Position = UDim2.new(0.05, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "◈ MUSLIM MENU"
title.TextColor3 = THEMES[currentTheme].accent
title.TextSize = 20
title.Font = Enum.Font.SourceSansBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = header

-- Version badge
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

-- Close Button
local closeBtn = Instance.new("TextButton")
closeBtn.Name = "CloseBtn"
closeBtn.Size = UDim2.new(0, 38, 0, 38)
closeBtn.Position = UDim2.new(0.91, 0, 0.5, -19)
closeBtn.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
closeBtn.BackgroundTransparency = 0
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.TextSize = 18
closeBtn.Font = Enum.Font.SourceSansBold
closeBtn.Parent = header

local closeCorners = Instance.new("UICorner")
closeCorners.CornerRadius = UDim.new(0, 10)
closeCorners.Parent = closeBtn

closeBtn.MouseButton1Click:Connect(function()
    Animation:fadeOut(frame, 0.3)
    wait(0.3)
    frame.Visible = false
    mButton.Visible = true
    Animation:fadeIn(mButton, 0.3)
end)

-- Floating "M" Button
local mButton = Instance.new("TextButton")
mButton.Name = "FloatBtn"
mButton.Size = UDim2.new(0, 64, 0, 64)
mButton.Position = UDim2.new(0.5, -32, 0.85, 0)
mButton.BackgroundColor3 = THEMES[currentTheme].main
mButton.BackgroundTransparency = 0
mButton.Text = "M"
mButton.TextColor3 = THEMES[currentTheme].accent
mButton.TextSize = 30
mButton.Font = Enum.Font.SourceSansBold
mButton.Visible = false
mButton.ZIndex = 999
mButton.Parent = gui

local mButtonCorners = Instance.new("UICorner")
mButtonCorners.CornerRadius = UDim.new(0, 16)
mButtonCorners.Parent = mButton

-- M button glow
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

mButton.MouseButton1Click:Connect(function()
    frame.Visible = true
    mButton.Visible = false
    Animation:fadeIn(frame, 0.3)
end)

-- ============================================================
--  [11] MENU COMPONENTS
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

-- ============================================================
--  [12] LOADING ANIMATION
-- ============================================================
Animation:fadeIn(frame, 0.5)

-- ============================================================
--  [13] INITIALIZATION LOG
-- ============================================================
print("========================================")
print("  " .. CONFIG.NAME .. " " .. CONFIG.VERSION)
print("  Developer: " .. CONFIG.DEVELOPER)
print("  Theme: " .. THEMES[currentTheme].name)
print("  Loaded successfully! ✦")
print("========================================")

-- ============================================================
--  [14] API EXPOSE
-- ============================================================
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
    config = CONFIG
}

print("✅ API exposed: getgenv().MuslimMenu")
