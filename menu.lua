-- ============================================================
--  ██████  ██    ██ ███████ ██      ██ ███    ███ 
--  ██   ██ ██    ██ ██      ██      ██ ████  ████ 
--  ██████  ██    ██ ███████ ██      ██ ██ ████ ██ 
--  ██   ██ ██    ██      ██ ██      ██ ██  ██  ██ 
--  ██████   ██████  ███████ ███████ ██ ██      ██ 
-- ============================================================
--  MUSLIM MENU v6.0 - Premium Edition
--  by Tormentor412
--  Architecture: MVC + Event-Driven
-- ============================================================

-- ============================================================
--  [1] CORE CONFIGURATION
-- ============================================================
local CONFIG = {
    NAME = "MUSLIM MENU",
    VERSION = "v6.0",
    DEVELOPER = "Tormentor412",
    AUTHOR = "Tormentor412",
    GITHUB = "https://github.com/korytnikovayulya-sudo/Kulgems",
    RAW_URL = "https://raw.githubusercontent.com/korytnikovayulya-sudo/Kulgems/main/menu.lua",
    WEBSITE = "https://korytnikovayulya-sudo.github.io/muslim-menu-site/"
}

-- ============================================================
--  [2] LOCALIZATION SYSTEM
-- ============================================================
local L = {
    en = {
        title = "◈ MUSLIM MENU ◈",
        esp = "◈ ESP (highlight)",
        theme = "◈ Theme:",
        restart = "⟳ Restart",
        watermark = "◈ Tormentor412",
        settings = "⚙ Settings",
        close = "✕ Close",
        lang_label = "Language:",
        site = "🌐 Site",
        active = "ACTIVE",
        inactive = "INACTIVE"
    },
    ru = {
        title = "◈ MUSLIM MENU ◈",
        esp = "◈ ESP (подсветка)",
        theme = "◈ Тема:",
        restart = "⟳ Перезапустить",
        watermark = "◈ Tormentor412",
        settings = "⚙ Настройки",
        close = "✕ Закрыть",
        lang_label = "Язык:",
        site = "🌐 Сайт",
        active = "АКТИВЕН",
        inactive = "НЕАКТИВЕН"
    }
}

-- ============================================================
--  [3] THEME SYSTEM (Premium Colors)
-- ============================================================
local THEMES = {
    midnight = {
        name = "Midnight",
        main = Color3.fromRGB(12, 12, 16),
        accent = Color3.fromRGB(100, 180, 255),
        header = Color3.fromRGB(20, 24, 32),
        btn = Color3.fromRGB(28, 32, 40),
        hover = Color3.fromRGB(40, 48, 60),
        shadow = Color3.fromRGB(0, 0, 0, 0.3)
    },
    emerald = {
        name = "Emerald",
        main = Color3.fromRGB(10, 20, 14),
        accent = Color3.fromRGB(80, 220, 140),
        header = Color3.fromRGB(18, 34, 24),
        btn = Color3.fromRGB(26, 44, 34),
        hover = Color3.fromRGB(38, 60, 48),
        shadow = Color3.fromRGB(0, 0, 0, 0.3)
    },
    ruby = {
        name = "Ruby",
        main = Color3.fromRGB(20, 8, 8),
        accent = Color3.fromRGB(255, 80, 80),
        header = Color3.fromRGB(34, 14, 14),
        btn = Color3.fromRGB(44, 22, 22),
        hover = Color3.fromRGB(60, 34, 34),
        shadow = Color3.fromRGB(0, 0, 0, 0.3)
    },
    royal = {
        name = "Royal",
        main = Color3.fromRGB(16, 8, 24),
        accent = Color3.fromRGB(200, 120, 255),
        header = Color3.fromRGB(28, 16, 40),
        btn = Color3.fromRGB(38, 24, 52),
        hover = Color3.fromRGB(52, 36, 68),
        shadow = Color3.fromRGB(0, 0, 0, 0.3)
    },
    gold = {
        name = "Gold",
        main = Color3.fromRGB(18, 16, 10),
        accent = Color3.fromRGB(255, 215, 0),
        header = Color3.fromRGB(30, 26, 16),
        btn = Color3.fromRGB(42, 36, 22),
        hover = Color3.fromRGB(58, 50, 32),
        shadow = Color3.fromRGB(0, 0, 0, 0.3)
    }
}

local currentTheme = "midnight"
local currentLang = "ru"

-- ============================================================
--  [4] UI SYSTEM (Premium Components)
-- ============================================================
local UI = {}
local player = game:GetService("Players").LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "MuslimMenu"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = player:WaitForChild("PlayerGui")

-- ============================================================
--  [5] ANIMATION & TWEEN HELPERS
-- ============================================================
local TweenService = game:GetService("TweenService")

local function tween(obj, properties, duration, style)
    style = style or Enum.EasingStyle.Quad
    local tween = TweenService:Create(obj, TweenInfo.new(duration or 0.3, style, Enum.EasingDirection.Out), properties)
    tween:Play()
    return tween
end

local function createShadow(obj, color, size, transparency)
    local shadow = Instance.new("ImageLabel")
    shadow.Size = UDim2.new(1, size or 20, 1, size or 20)
    shadow.Position = UDim2.new(0, -(size or 20)/2, 0, -(size or 20)/2)
    shadow.BackgroundTransparency = 1
    shadow.Image = "rbxassetid://1316043803" -- Soft shadow
    shadow.ImageColor3 = color or Color3.fromRGB(0, 0, 0)
    shadow.ImageTransparency = transparency or 0.5
    shadow.ZIndex = obj.ZIndex and obj.ZIndex - 1 or 0
    shadow.Parent = obj
    return shadow
end

-- ============================================================
--  [6] PREMIUM COMPONENT BUILDER
-- ============================================================
function UI:createWindow()
    -- Main container with glass effect
    local frame = Instance.new("Frame")
    frame.Name = "MainFrame"
    frame.Size = UDim2.new(0, 440, 0, 580)
    frame.Position = UDim2.new(0.5, -220, 0.5, -290)
    frame.BackgroundColor3 = THEMES[currentTheme].main
    frame.BackgroundTransparency = 0
    frame.BorderSizePixel = 2
    frame.BorderColor3 = THEMES[currentTheme].accent
    frame.ClipsDescendants = true
    frame.Active = true
    frame.Draggable = true
    frame.Parent = gui

    -- Glass effect overlay
    local glass = Instance.new("Frame")
    glass.Size = UDim2.new(1, 0, 1, 0)
    glass.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    glass.BackgroundTransparency = 0.03
    glass.ZIndex = 0
    glass.Parent = frame

    -- Shadow
    createShadow(frame, Color3.fromRGB(0, 0, 0), 30, 0.6)

    -- Corner radius
    local corners = Instance.new("UICorner")
    corners.CornerRadius = UDim.new(0, 16)
    corners.Parent = frame

    return frame
end

function UI:createHeader(parent)
    local header = Instance.new("Frame")
    header.Name = "Header"
    header.Size = UDim2.new(1, 0, 0, 56)
    header.BackgroundColor3 = THEMES[currentTheme].header
    header.BackgroundTransparency = 0
    header.Parent = parent

    local headerCorners = Instance.new("UICorner")
    headerCorners.CornerRadius = UDim.new(0, 16)
    headerCorners.Parent = header

    -- Decorative line
    local line = Instance.new("Frame")
    line.Size = UDim2.new(1, 0, 0, 2)
    line.Position = UDim2.new(0, 0, 1, -2)
    line.BackgroundColor3 = THEMES[currentTheme].accent
    line.BackgroundTransparency = 0.5
    line.Parent = header

    -- Icon
    local icon = Instance.new("TextLabel")
    icon.Size = UDim2.new(0, 40, 1, 0)
    icon.Position = UDim2.new(0.02, 0, 0, 0)
    icon.BackgroundTransparency = 1
    icon.Text = "◈"
    icon.TextColor3 = THEMES[currentTheme].accent
    icon.TextSize = 26
    icon.Font = Enum.Font.SourceSansBold
    icon.Parent = header

    -- Title
    local title = Instance.new("TextLabel")
    title.Name = "Title"
    title.Size = UDim2.new(0.5, 0, 1, 0)
    title.Position = UDim2.new(0.12, 0, 0, 0)
    title.BackgroundTransparency = 1
    title.Text = L[currentLang].title
    title.TextColor3 = THEMES[currentTheme].accent
    title.TextSize = 20
    title.Font = Enum.Font.SourceSansBold
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = header

    -- Version badge
    local version = Instance.new("TextLabel")
    version.Size = UDim2.new(0, 60, 0, 20)
    version.Position = UDim2.new(0.6, 0, 0.5, -10)
    version.BackgroundColor3 = THEMES[currentTheme].accent
    version.BackgroundTransparency = 0.15
    version.Text = CONFIG.VERSION
    version.TextColor3 = THEMES[currentTheme].accent
    version.TextSize = 11
    version.Font = Enum.Font.SourceSansBold
    version.TextScaled = true
    version.Parent = header

    local versionCorners = Instance.new("UICorner")
    versionCorners.CornerRadius = UDim.new(0, 8)
    versionCorners.Parent = version

    return header, title, version
end

function UI:createSettingsButton(parent)
    local btn = Instance.new("TextButton")
    btn.Name = "SettingsBtn"
    btn.Size = UDim2.new(0, 38, 0, 38)
    btn.Position = UDim2.new(0.78, 0, 0.5, -19)
    btn.BackgroundColor3 = THEMES[currentTheme].btn
    btn.BackgroundTransparency = 0
    btn.Text = "⚙"
    btn.TextColor3 = THEMES[currentTheme].accent
    btn.TextSize = 20
    btn.Font = Enum.Font.SourceSansBold
    btn.Parent = parent

    local btnCorners = Instance.new("UICorner")
    btnCorners.CornerRadius = UDim.new(0, 10)
    btnCorners.Parent = btn

    btn.MouseButton1Click:Connect(function()
        settingsFrame.Visible = not settingsFrame.Visible
        tween(settingsFrame, {BackgroundTransparency = settingsFrame.Visible and 0 or 1}, 0.3)
    end)

    return btn
end

function UI:createCloseButton(parent)
    local btn = Instance.new("TextButton")
    btn.Name = "CloseBtn"
    btn.Size = UDim2.new(0, 38, 0, 38)
    btn.Position = UDim2.new(0.9, 0, 0.5, -19)
    btn.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
    btn.BackgroundTransparency = 0
    btn.Text = "✕"
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 18
    btn.Font = Enum.Font.SourceSansBold
    btn.Parent = parent

    local btnCorners = Instance.new("UICorner")
    btnCorners.CornerRadius = UDim.new(0, 10)
    btnCorners.Parent = btn

    btn.MouseButton1Click:Connect(function()
        tween(frame, {BackgroundTransparency = 1}, 0.3):Play()
        wait(0.3)
        frame.Visible = false
        mButton.Visible = true
        tween(mButton, {BackgroundTransparency = 0}, 0.3)
    end)

    return btn
end

function UI:createFloatButton()
    local btn = Instance.new("TextButton")
    btn.Name = "FloatBtn"
    btn.Size = UDim2.new(0, 64, 0, 64)
    btn.Position = UDim2.new(0.5, -32, 0.85, 0)
    btn.BackgroundColor3 = THEMES[currentTheme].main
    btn.BackgroundTransparency = 0
    btn.Text = "M"
    btn.TextColor3 = THEMES[currentTheme].accent
    btn.TextSize = 32
    btn.Font = Enum.Font.SourceSansBold
    btn.Visible = false
    btn.ZIndex = 999
    btn.Parent = gui

    local btnCorners = Instance.new("UICorner")
    btnCorners.CornerRadius = UDim.new(0, 16)
    btnCorners.Parent = btn

    -- Glow effect
    local glow = Instance.new("Frame")
    glow.Size = UDim2.new(1, 20, 1, 20)
    glow.Position = UDim2.new(0, -10, 0, -10)
    glow.BackgroundColor3 = THEMES[currentTheme].accent
    glow.BackgroundTransparency = 0.8
    glow.ZIndex = -1
    glow.Parent = btn

    local glowCorners = Instance.new("UICorner")
    glowCorners.CornerRadius = UDim.new(0, 20)
    glowCorners.Parent = glow

    btn.MouseButton1Click:Connect(function()
        frame.Visible = true
        mButton.Visible = false
        tween(frame, {BackgroundTransparency = 0}, 0.3)
    end)

    return btn
end

function UI:createToggle(labelText, icon, yPos, defaultValue, callback)
    local container = Instance.new("Frame")
    container.Size = UDim2.new(0.9, 0, 0, 48)
    container.Position = UDim2.new(0.05, 0, yPos, 0)
    container.BackgroundColor3 = THEMES[currentTheme].btn
    container.BackgroundTransparency = 0
    container.BorderSizePixel = 1
    container.BorderColor3 = THEMES[currentTheme].accent
    container.Parent = frame

    local containerCorners = Instance.new("UICorner")
    containerCorners.CornerRadius = UDim.new(0, 12)
    containerCorners.Parent = container

    -- Hover effect
    container.MouseEnter:Connect(function()
        tween(container, {BackgroundColor3 = THEMES[currentTheme].hover}, 0.2)
    end)
    container.MouseLeave:Connect(function()
        tween(container, {BackgroundColor3 = THEMES[currentTheme].btn}, 0.2)
    end)

    -- Icon
    local iconLabel = Instance.new("TextLabel")
    iconLabel.Size = UDim2.new(0, 35, 1, 0)
    iconLabel.Position = UDim2.new(0.02, 0, 0, 0)
    iconLabel.BackgroundTransparency = 1
    iconLabel.Text = icon
    iconLabel.TextColor3 = THEMES[currentTheme].accent
    iconLabel.TextSize = 20
    iconLabel.Font = Enum.Font.SourceSansBold
    iconLabel.Parent = container

    -- Label
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.6, 0, 1, 0)
    label.Position = UDim2.new(0.12, 0, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = labelText
    label.TextColor3 = Color3.fromRGB(220, 220, 220)
    label.TextSize = 16
    label.Font = Enum.Font.SourceSansBold
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = container

    -- Toggle switch
    local toggle = Instance.new("TextButton")
    toggle.Size = UDim2.new(0, 42, 0, 26)
    toggle.Position = UDim2.new(0.85, 0, 0.5, -13)
    toggle.BackgroundColor3 = defaultValue and THEMES[currentTheme].accent or Color3.fromRGB(60, 60, 70)
    toggle.BackgroundTransparency = 0
    toggle.Text = ""
    toggle.Parent = container

    local toggleCorners = Instance.new("UICorner")
    toggleCorners.CornerRadius = UDim.new(0, 13)
    toggleCorners.Parent = toggle

    -- Toggle knob
    local knob = Instance.new("Frame")
    knob.Size = UDim2.new(0, 20, 0, 20)
    knob.Position = defaultValue and UDim2.new(0.5, 2, 0.5, -10) or UDim2.new(0.05, 2, 0.5, -10)
    knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    knob.BackgroundTransparency = 0
    knob.Parent = toggle

    local knobCorners = Instance.new("UICorner")
    knobCorners.CornerRadius = UDim.new(0, 10)
    knobCorners.Parent = knob

    local state = defaultValue
    toggle.MouseButton1Click:Connect(function()
        state = not state
        toggle.BackgroundColor3 = state and THEMES[currentTheme].accent or Color3.fromRGB(60, 60, 70)
        tween(knob, {Position = state and UDim2.new(0.5, 2, 0.5, -10) or UDim2.new(0.05, 2, 0.5, -10)}, 0.2)
        if callback then callback(state) end
    end)

    return {container, toggle, knob}
end

-- ============================================================
--  [7] SETTINGS PANEL
-- ============================================================
local settingsFrame = Instance.new("Frame")
settingsFrame.Size = UDim2.new(0.9, 0, 0, 160)
settingsFrame.Position = UDim2.new(0.05, 0, 0.48, 0)
settingsFrame.BackgroundColor3 = THEMES[currentTheme].btn
settingsFrame.BackgroundTransparency = 1
settingsFrame.BorderSizePixel = 1
settingsFrame.BorderColor3 = THEMES[currentTheme].accent
settingsFrame.Visible = false
settingsFrame.Parent = frame

local settingsCorners = Instance.new("UICorner")
settingsCorners.CornerRadius = UDim.new(0, 12)
settingsCorners.Parent = settingsFrame

-- Settings header
local settingsTitle = Instance.new("TextLabel")
settingsTitle.Size = UDim2.new(1, 0, 0, 35)
settingsTitle.BackgroundTransparency = 1
settingsTitle.Text = L[currentLang].settings
settingsTitle.TextColor3 = THEMES[currentTheme].accent
settingsTitle.TextSize = 18
settingsTitle.Font = Enum.Font.SourceSansBold
settingsTitle.Parent = settingsFrame

-- Language selector
local langLabel = Instance.new("TextLabel")
langLabel.Size = UDim2.new(0.3, 0, 0, 30)
langLabel.Position = UDim2.new(0.05, 0, 0.30, 0)
langLabel.BackgroundTransparency = 1
langLabel.Text = L[currentLang].lang_label
langLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
langLabel.TextSize = 15
langLabel.Font = Enum.Font.SourceSansBold
langLabel.TextXAlignment = Enum.TextXAlignment.Left
langLabel.Parent = settingsFrame

local langBtn = Instance.new("TextButton")
langBtn.Size = UDim2.new(0.15, 0, 0, 30)
langBtn.Position = UDim2.new(0.38, 0, 0.30, 0)
langBtn.BackgroundColor3 = THEMES[currentTheme].accent
langBtn.BackgroundTransparency = 0
langBtn.Text = currentLang == "ru" and "РУС" or "ENG"
langBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
langBtn.TextSize = 14
langBtn.Font = Enum.Font.SourceSansBold
langBtn.Parent = settingsFrame

local langCorners = Instance.new("UICorner")
langCorners.CornerRadius = UDim.new(0, 6)
langCorners.Parent = langBtn

langBtn.MouseButton1Click:Connect(function()
    currentLang = currentLang == "ru" and "en" or "ru"
    langBtn.Text = currentLang == "ru" and "РУС" or "ENG"
    updateLanguage(currentLang)
end)

-- Theme selector
local themeLabel = Instance.new("TextLabel")
themeLabel.Size = UDim2.new(0.2, 0, 0, 30)
themeLabel.Position = UDim2.new(0.05, 0, 0.65, 0)
themeLabel.BackgroundTransparency = 1
themeLabel.Text = L[currentLang].theme
themeLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
themeLabel.TextSize = 15
themeLabel.Font = Enum.Font.SourceSansBold
themeLabel.TextXAlignment = Enum.TextXAlignment.Left
themeLabel.Parent = settingsFrame

local themeColors = {
    midnight = Color3.fromRGB(60, 80, 120),
    emerald = Color3.fromRGB(60, 180, 120),
    ruby = Color3.fromRGB(200, 60, 60),
    royal = Color3.fromRGB(160, 80, 200),
    gold = Color3.fromRGB(255, 200, 50)
}

for i, themeName in ipairs({"midnight", "emerald", "ruby", "royal", "gold"}) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 32, 0, 32)
    btn.Position = UDim2.new(0.28 + (i-1) * 0.12, 0, 0.62, 0)
    btn.BackgroundColor3 = themeColors[themeName]
    btn.BackgroundTransparency = 0
    btn.Text = ""
    btn.Parent = settingsFrame

    local btnCorners = Instance.new("UICorner")
    btnCorners.CornerRadius = UDim.new(0, 8)
    btnCorners.Parent = btn

    -- Selection ring
    local ring = Instance.new("Frame")
    ring.Size = UDim2.new(1, 6, 1, 6)
    ring.Position = UDim2.new(0, -3, 0, -3)
    ring.BackgroundTransparency = 1
    ring.BorderSizePixel = 2
    ring.BorderColor3 = THEMES[currentTheme].accent
    ring.ZIndex = 2
    ring.Parent = btn

    local ringCorners = Instance.new("UICorner")
    ringCorners.CornerRadius = UDim.new(0, 10)
    ringCorners.Parent = ring

    if themeName == currentTheme then
        ring.BackgroundTransparency = 0.5
    end

    btn.MouseButton1Click:Connect(function()
        currentTheme = themeName
        updateTheme(currentTheme)
        -- Update rings
        for _, child in pairs(settingsFrame:GetChildren()) do
            if child:IsA("TextButton") and child:FindFirstChild("UICorner") then
                local r = child:FindFirstChild("Frame")
                if r then
                    r.BackgroundTransparency = 1
                end
            end
        end
        ring.BackgroundTransparency = 0.5
    end)
end

-- ============================================================
--  [8] UPDATE FUNCTIONS
-- ============================================================
local function updateTheme(themeName)
    local theme = THEMES[themeName]
    frame.BackgroundColor3 = theme.main
    frame.BorderColor3 = theme.accent
    header.BackgroundColor3 = theme.header
    title.TextColor3 = theme.accent
    settingsBtn.BackgroundColor3 = theme.btn
    mButton.BackgroundColor3 = theme.main
    mButton.TextColor3 = theme.accent
    
    settingsFrame.BackgroundColor3 = theme.btn
    settingsFrame.BorderColor3 = theme.accent
    settingsTitle.TextColor3 = theme.accent
    
    for _, child in pairs(settingsFrame:GetChildren()) do
        if child:IsA("TextLabel") then
            child.TextColor3 = theme.accent
        end
    end
    
    for _, highlight in pairs(espHighlights) do
        if highlight and highlight.Parent then
            highlight.FillColor = theme.accent
        end
    end
end

local function updateLanguage(langCode)
    title.Text = L[langCode].title
    settingsTitle.Text = L[langCode].settings
    themeLabel.Text = L[langCode].theme
    langLabel.Text = L[langCode].lang_label
    restartBtn.Text = L[langCode].restart
    watermark.Text = L[langCode].watermark
    espLabel.
