-- ============================================================
--  MUSLIM MENU v14.4 - FULLY FIXED
--  by Tormentor412
-- ============================================================

print("🚀 Загрузка Muslim Menu v14.4...")

local player = game:GetService("Players").LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "MuslimMenu"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- ============================================================
--  [1] ТЕМЫ
-- ============================================================
local THEMES = {
    midnight = { main = Color3.fromRGB(10, 10, 14), accent = Color3.fromRGB(100, 180, 255), header = Color3.fromRGB(16, 18, 24), btn = Color3.fromRGB(22, 26, 34), hover = Color3.fromRGB(34, 40, 52), text = Color3.fromRGB(220, 230, 240) },
    emerald = { main = Color3.fromRGB(8, 18, 12), accent = Color3.fromRGB(80, 220, 140), header = Color3.fromRGB(14, 30, 20), btn = Color3.fromRGB(22, 40, 30), hover = Color3.fromRGB(34, 56, 44), text = Color3.fromRGB(220, 240, 230) },
    ruby = { main = Color3.fromRGB(18, 6, 6), accent = Color3.fromRGB(255, 70, 70), header = Color3.fromRGB(32, 10, 10), btn = Color3.fromRGB(44, 18, 18), hover = Color3.fromRGB(60, 28, 28), text = Color3.fromRGB(240, 220, 220) },
    royal = { main = Color3.fromRGB(14, 6, 22), accent = Color3.fromRGB(200, 120, 255), header = Color3.fromRGB(24, 12, 36), btn = Color3.fromRGB(34, 20, 48), hover = Color3.fromRGB(48, 32, 64), text = Color3.fromRGB(230, 220, 240) },
    gold = { main = Color3.fromRGB(16, 14, 8), accent = Color3.fromRGB(255, 215, 0), header = Color3.fromRGB(28, 24, 14), btn = Color3.fromRGB(40, 34, 20), hover = Color3.fromRGB(56, 48, 30), text = Color3.fromRGB(240, 235, 220) }
}

local currentTheme = "midnight"
local currentTransparency = 0.05
local currentLang = "ru"
local tempTheme = "midnight"
local tempTransparency = 0
local tempLang = "ru"

-- ============================================================
--  [2] ЯЗЫКИ
-- ============================================================
local LANG = {
    ru = {
        title = "MUSLIM MENU",
        info_title = "📋 ИНФОРМАЦИЯ",
        info_hello = "Привет! Это мой первый скрипт!",
        info_rate = "Если не сложно, оцените его. 🌟",
        info_nick = "👤 Мой Roblox: TORMENTOR412",
        info_footer = "❤️ Спасибо за использование!",
        settings_title = "⚙️ НАСТРОЙКИ",
        theme_label = "🎨 Тема:",
        transparency_label = "🔲 Прозрачность:",
        lang_label = "🌍 Язык:",
        lang_ru = "Русский",
        lang_en = "Английский",
        save_btn = "💾 Сохранить",
        watermark = "MUSLIM MENU v14.4 | TORMENTOR412"
    },
    en = {
        title = "MUSLIM MENU",
        info_title = "📋 INFO",
        info_hello = "Hello! It's my first script!",
        info_rate = "If it's not too much trouble, please rate it. 🌟",
        info_nick = "👤 My Roblox: TORMENTOR412",
        info_footer = "❤️ Thanks for using!",
        settings_title = "⚙️ SETTINGS",
        theme_label = "🎨 Theme:",
        transparency_label = "🔲 Transparency:",
        lang_label = "🌍 Language:",
        lang_ru = "Russian",
        lang_en = "English",
        save_btn = "💾 Save",
        watermark = "MUSLIM MENU v14.4 | TORMENTOR412"
    }
}

-- ============================================================
--  [3] ФУНКЦИИ ОБНОВЛЕНИЯ
-- ============================================================
local function updateTheme(themeName)
    local theme = THEMES[themeName]
    if not theme then return end
    
    frame.BackgroundColor3 = theme.main
    frame.BackgroundTransparency = currentTransparency
    frame.BorderColor3 = theme.accent
    
    header.BackgroundColor3 = theme.header
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
    
    if mButton then
        mButton.BackgroundColor3 = theme.main
        mButton.BackgroundTransparency = 0.05
        mButton.TextColor3 = theme.accent
    end
end

local function updateLanguage(langCode)
    local lang = LANG[langCode]
    if not lang then return end
    
    title.Text = lang.title
    infoTitle.Text = lang.info_title
    infoHello.Text = lang.info_hello
    infoRate.Text = lang.info_rate
    infoNick.Text = lang.info_nick
    infoFooter.Text = lang.info_footer
    settingsTitle.Text = lang.settings_title
    themeLabel.Text = lang.theme_label
    transLabel.Text = lang.transparency_label
    langLabel.Text = lang.lang_label
    saveBtn.Text = lang.save_btn
    watermark.Text = lang.watermark
end

local function updateContent()
    -- ПОКАЗЫВАЕМ ТОЛЬКО АКТИВНУЮ ВКЛАДКУ
    if infoContent then
        infoContent.Visible = (activeTab == "INFO")
    end
    if settingsContent then
        settingsContent.Visible = (activeTab == "SETTINGS")
    end
    
    -- ОБНОВЛЯЕМ ЦВЕТА КНОПОК ВКЛАДОК
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

-- ============================================================
--  [4] ПРИВЕТСТВИЕ
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
--  [5] ОСНОВНОЕ МЕНЮ
-- ============================================================
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 700, 0, 450)
frame.Position = UDim2.new(0.5, -350, 0.5, -225)
frame.BackgroundColor3 = THEMES[currentTheme].main
frame.BackgroundTransparency = currentTransparency
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
--  [6] ЗАГОЛОВОК
-- ============================================================
local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 50)
header.BackgroundColor3 = THEMES[currentTheme].header
header.BackgroundTransparency = 0.15
header.Parent = frame

local headerCorners = Instance.new("UICorner")
headerCorners.CornerRadius = UDim.new(0, 20)
headerCorners.Parent = header

-- ПРИЦЕЛ
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
title.Text = LANG[currentLang].title
title.TextColor3 = THEMES[currentTheme].accent
title.TextSize = 20
title.Font = Enum.Font.SourceSansBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = header

local versionBadge = Instance.new("TextLabel")
versionBadge.Size = UDim2.new(0, 60, 0, 22)
versionBadge.Position = UDim2.new(0.85, 0, 0.5, -11)
versionBadge.BackgroundColor3 = THEMES[currentTheme].accent
versionBadge.BackgroundTransparency = 0.15
versionBadge.Text = "v14.4"
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
--  [7] ВКЛАДКИ (ИСПРАВЛЕНО!)
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

-- === КНОПКИ ВКЛАДОК (ИСПРАВЛЕНО) ===
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
    
    -- ГЛАВНОЕ ИСПРАВЛЕНИЕ: ДОБАВЛЕН ВЫЗОВ updateContent()
    btn.MouseButton1Click:Connect(function()
        activeTab = name
        updateContent()
        print("🔄 Вкладка: " .. name)
    end)
    
    return btn
end

createTabButton("INFO", 0)
createTabButton("SETTINGS", 45)

-- ============================================================
--  [8] КОНТЕНТ INFO
-- ============================================================
local infoContent = Instance.new("Frame")
infoContent.Size = UDim2.new(1, 0, 1, 0)
infoContent.BackgroundTransparency = 1
infoContent.Parent = contentContainer

local infoTitle = Instance.new("TextLabel")
infoTitle.Size = UDim2.new(0.8, 0, 0.15, 0)
infoTitle.Position = UDim2.new(0.1, 0, 0.05, 0)
infoTitle.BackgroundTransparency = 1
infoTitle.Text = LANG[currentLang].info_title
infoTitle.TextColor3 = THEMES[currentTheme].accent
infoTitle.TextSize = 28
infoTitle.Font = Enum.Font.SourceSansBold
infoTitle.Parent = infoContent

local infoHello = Instance.new("TextLabel")
infoHello.Size = UDim2.new(0.8, 0, 0.15, 0)
infoHello.Position = UDim2.new(0.1, 0, 0.2, 0)
infoHello.BackgroundTransparency = 1
infoHello.Text = LANG[currentLang].info_hello
infoHello.TextColor3 = THEMES[currentTheme].text
infoHello.TextSize = 22
infoHello.Font = Enum.Font.SourceSansBold
infoHello.Parent = infoContent

local infoRate = Instance.new("TextLabel")
infoRate.Size = UDim2.new(0.8, 0, 0.15, 0)
infoRate.Position = UDim2.new(0.1, 0, 0.4, 0)
infoRate.BackgroundTransparency = 1
infoRate.Text = LANG[currentLang].info_rate
infoRate.TextColor3 = THEMES[currentTheme].text
infoRate.TextSize = 18
infoRate.Font = Enum.Font.SourceSansBold
infoRate.Parent = infoContent

local infoNick = Instance.new("TextLabel")
infoNick.Size = UDim2.new(0.8, 0, 0.15, 0)
infoNick.Position = UDim2.new(0.1, 0, 0.6, 0)
infoNick.BackgroundTransparency = 1
infoNick.Text = LANG[currentLang].info_nick
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
infoFooter.Text = LANG[currentLang].info_footer
infoFooter.TextColor3 = THEMES[currentTheme].text
infoFooter.TextSize = 16
infoFooter.Font = Enum.Font.SourceSansBold
infoFooter.Parent = infoContent

-- ============================================================
--  [9] КОНТЕНТ SETTINGS (ИСПРАВЛЕНО)
-- ============================================================
local settingsContent = Instance.new("Frame")
settingsContent.Size = UDim2.new(1, 0, 1, 0)
settingsContent.BackgroundTransparency = 1
settingsContent.Visible = false
settingsContent.Parent = contentContainer

local settingsTitle = Instance.new("TextLabel")
settingsTitle.Size = UDim2.new(0.8, 0, 0.08, 0)
settingsTitle.Position = UDim2.new(0.1, 0, 0.02, 0)
settingsTitle.BackgroundTransparency = 1
settingsTitle.Text = LANG[currentLang].settings_title
settingsTitle.TextColor3 = THEMES[currentTheme].accent
settingsTitle.TextSize = 24
settingsTitle.Font = Enum.Font.SourceSansBold
settingsTitle.Parent = settingsContent

-- ТЕМЫ
local themeLabel = Instance.new("TextLabel")
themeLabel.Size = UDim2.new(0.3, 0, 0.06, 0)
themeLabel.Position = UDim2.new(0.1, 0, 0.12, 0)
themeLabel.BackgroundTransparency = 1
themeLabel.Text = LANG[currentLang].theme_label
themeLabel.TextColor3 = THEMES[currentTheme].text
themeLabel.TextSize = 16
themeLabel.Font = Enum.Font.SourceSansBold
themeLabel.TextXAlignment = Enum.TextXAlignment.Left
themeLabel.Parent = settingsContent

local themeContainerSettings = Instance.new("Frame")
themeContainerSettings.Size = UDim2.new(0.6, 0, 0.06, 0)
themeContainerSettings.Position = UDim2.new(0.35, 0, 0.12, 0)
themeContainerSettings.BackgroundTransparency = 1
themeContainerSettings.Parent = settingsContent

local themeColorsSettings = {
    midnight = Color3.fromRGB(100, 180, 255),
    emerald = Color3.fromRGB(80, 220, 140),
    ruby = Color3.fromRGB(255, 70, 70),
    royal = Color3.fromRGB(200, 120, 255),
    gold = Color3.fromRGB(255, 215, 0)
}

local themeNamesSettings = {"midnight", "emerald", "ruby", "royal", "gold"}
local themeIconsSettings = {"🌙", "🌿", "♦", "👑", "★"}

-- ИСПРАВЛЕНО: УБРАНА ОШИБКА THEMES[themeName].name
for i, themeName in ipairs(themeNamesSettings) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 30, 0, 30)
    btn.Position = UDim2.new(0.05 + (i-1) * 0.16, 0, 0, 0)
    btn.BackgroundColor3 = themeColorsSettings[themeName]
    btn.BackgroundTransparency = 0
    btn.Text = themeIconsSettings[i]
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 14
    btn.Font = Enum.Font.SourceSansBold
    btn.Parent = themeContainerSettings
    
    local btnCorners = Instance.new("UICorner")
    btnCorners.CornerRadius = UDim.new(0, 8)
    btnCorners.Parent = btn
    
    btn.MouseButton1Click:Connect(function()
        tempTheme = themeName
        print("🎨 Выбрана тема: " .. themeName)  -- ИСПРАВЛЕНО
    end)
end

-- ПРОЗРАЧНОСТЬ
local transLabel = Instance.new("TextLabel")
transLabel.Size = UDim2.new(0.3, 0, 0.06, 0)
transLabel.Position = UDim2.new(0.1, 0, 0.22, 0)
transLabel.BackgroundTransparency = 1
transLabel.Text = LANG[currentLang].transparency_label
transLabel.TextColor3 = THEMES[currentTheme].text
transLabel.TextSize = 16
transLabel.Font = Enum.Font.SourceSansBold
transLabel.TextXAlignment = Enum.TextXAlignment.Left
transLabel.Parent = settingsContent

local transValue = Instance.new("TextLabel")
transValue.Size = UDim2.new(0.1, 0, 0.06, 0)
transValue.Position = UDim2.new(0.75, 0, 0.22, 0)
transValue.BackgroundTransparency = 1
transValue.Text = "0%"
transValue.TextColor3 = THEMES[currentTheme].text
transValue.TextSize = 16
transValue.Font = Enum.Font.SourceSansBold
transValue.TextXAlignment = Enum.TextXAlignment.Right
transValue.Parent = settingsContent

local transSlider = Instance.new("Frame")
transSlider.Size = UDim2.new(0.4, 0, 0.04, 0)
transSlider.Position = UDim2.new(0.35, 0, 0.24, 0)
transSlider.BackgroundColor3 = THEMES[currentTheme].btn
transSlider.BackgroundTransparency = 0.1
transSlider.BorderSizePixel = 1
transSlider.BorderColor3 = THEMES[currentTheme].accent
transSlider.Parent = settingsContent

local transFill = Instance.new("Frame")
transFill.Size = UDim2.new(0, 0, 1, 0)
transFill.BackgroundColor3 = THEMES[currentTheme].accent
transFill.BackgroundTransparency = 0.1
transFill.BorderSizePixel = 0
transFill.Parent = transSlider

local transKnob = Instance.new("TextButton")
transKnob.Size = UDim2.new(0, 16, 0, 16)
transKnob.Position = UDim2.new(0, -8, 0.5, -8)
transKnob.BackgroundColor3 = THEMES[currentTheme].accent
transKnob.BackgroundTransparency = 0
transKnob.Text = ""
transKnob.Parent = transSlider

local knobCorners = Instance.new("UICorner")
knobCorners.CornerRadius = UDim.new(1, 0)
knobCorners.Parent = transKnob

local dragging = false

transKnob.MouseButton1Down:Connect(function()
    dragging = true
end)

game:GetService("UserInputService").InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

game:GetService("RunService").RenderStepped:Connect(function()
    if not dragging then return end
    local mouse = player:GetMouse()
    if not mouse then return end
    local relX = (mouse.X - transSlider.AbsolutePosition.X) / transSlider.AbsoluteSize.X
    local val = math.clamp(relX, 0, 1)
    tempTransparency = val
    transFill.Size = UDim2.new(val, 0, 1, 0)
    transKnob.Position = UDim2.new(val, -8, 0.5, -8)
    transValue.Text = math.round(val * 100) .. "%"
end)

-- ЯЗЫК
local langLabel = Instance.new("TextLabel")
langLabel.Size = UDim2.new(0.3, 0, 0.06, 0)
langLabel.Position = UDim2.new(0.1, 0, 0.32, 0)
langLabel.BackgroundTransparency = 1
langLabel.Text = LANG[currentLang].lang_label
langLabel.TextColor3 = THEMES[currentTheme].text
langLabel.TextSize = 16
langLabel.Font = Enum.Font.SourceSansBold
langLabel.TextXAlignment = Enum.TextXAlignment.Left
langLabel.Parent = settingsContent

local langBtn = Instance.new("TextButton")
langBtn.Size = UDim2.new(0.15, 0, 0.06, 0)
langBtn.Position = UDim2.new(0.45, 0, 0.32, 0)
langBtn.BackgroundColor3 = THEMES[currentTheme].accent
langBtn.BackgroundTransparency = 0.1
langBtn.Text = currentLang == "ru" and LANG[currentLang].lang_ru or LANG[currentLang].lang_en
langBtn.TextColor3 = THEMES[currentTheme].text
langBtn.TextSize = 16
langBtn.Font = Enum.Font.SourceSansBold
langBtn.Parent = settingsContent

local langCorners = Instance.new("UICorner")
langCorners.CornerRadius = UDim.new(0, 8)
langCorners.Parent = langBtn

langBtn.MouseButton1Click:Connect(function()
    tempLang = tempLang == "ru" and "en" or "ru"
    langBtn.Text = tempLang == "ru" and LANG[tempLang].lang_ru or LANG[tempLang].lang_en
end)

-- КНОПКА СОХРАНИТЬ
local saveBtn = Instance.new("TextButton")
saveBtn.Size = UDim2.new(0.3, 0, 0.07, 0)
saveBtn.Position = UDim2.new(0.35, 0, 0.45, 0)
saveBtn.BackgroundColor3 = THEMES[currentTheme].accent
saveBtn.BackgroundTransparency = 0.1
saveBtn.Text = LANG[currentLang].save_btn
saveBtn.TextColor3 = THEMES[currentTheme].text
saveBtn.TextSize = 18
saveBtn.Font = Enum.Font.SourceSansBold
saveBtn.Parent = settingsContent

local saveCorners = Instance.new("UICorner")
saveCorners.CornerRadius = UDim.new(0, 10)
saveCorners.Parent = saveBtn

saveBtn.MouseButton1Click:Connect(function()
    currentTheme = tempTheme
    updateTheme(currentTheme)
    
    currentTransparency = tempTransparency * 0.95
    frame.BackgroundTransparency = currentTransparency
    if mButton then
        mButton.BackgroundTransparency = currentTransparency
    end
    
    if tempLang ~= currentLang then
        currentLang = tempLang
        updateLanguage(currentLang)
        langBtn.Text = currentLang == "ru" and LANG[currentLang].lang_ru or LANG[currentLang].lang_en
    end
    
    print("✅ Настройки сохранены!")
    print("🎨 Тема: " .. currentTheme)
    print("🔲 Прозрачность: " .. math.round(currentTransparency / 0.95 * 100) .. "%")
    print("🌍 Язык: " .. (currentLang == "ru" and "Русский" or "English"))
end)

-- ============================================================
--  [10] ВОДЯНОЙ ЗНАК
-- ============================================================
local watermark = Instance.new("TextLabel")
watermark.Name = "Watermark"
watermark.Size = UDim2.new(1, 0, 0, 20)
watermark.Position = UDim2.new(0, 0, 0.97, 0)
watermark.BackgroundTransparency = 1
watermark.Text = LANG[currentLang].watermark
watermark.TextColor3 = THEMES[currentTheme].accent
watermark.TextSize = 10
watermark.Font = Enum.Font.SourceSans
watermark.TextTransparency = 0.5
watermark.Parent = frame

-- ============================================================
--  [11] ХОТКЕЙ F1
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
--  [12] ИНИЦИАЛИЗАЦИЯ
-- ============================================================
updateContent()
print("✅ Muslim Menu v14.4 загружен успешно!")
print("🔑 F1 - открыть/закрыть")
print("🔑 M - открыть/закрыть (когда меню скрыто)")
