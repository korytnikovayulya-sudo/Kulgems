-- ============================================================
--  MUSLIM MENU v14.4 - FULL FEATURES
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
    midnight = { main = Color3.fromRGB(10, 10, 14), accent = Color3.fromRGB(100, 180, 255), header = Color3.fromRGB(16, 18, 24), btn = Color3.fromRGB(22, 26, 34), text = Color3.fromRGB(220, 230, 240) },
    emerald = { main = Color3.fromRGB(8, 18, 12), accent = Color3.fromRGB(80, 220, 140), header = Color3.fromRGB(14, 30, 20), btn = Color3.fromRGB(22, 40, 30), text = Color3.fromRGB(220, 240, 230) },
    ruby = { main = Color3.fromRGB(18, 6, 6), accent = Color3.fromRGB(255, 70, 70), header = Color3.fromRGB(32, 10, 10), btn = Color3.fromRGB(44, 18, 18), text = Color3.fromRGB(240, 220, 220) },
    royal = { main = Color3.fromRGB(14, 6, 22), accent = Color3.fromRGB(200, 120, 255), header = Color3.fromRGB(24, 12, 36), btn = Color3.fromRGB(34, 20, 48), text = Color3.fromRGB(230, 220, 240) },
    gold = { main = Color3.fromRGB(16, 14, 8), accent = Color3.fromRGB(255, 215, 0), header = Color3.fromRGB(28, 24, 14), btn = Color3.fromRGB(40, 34, 20), text = Color3.fromRGB(240, 235, 220) }
}

local themeNames = {"midnight", "emerald", "ruby", "royal", "gold"}
local themeIcons = {"🌙", "🌿", "♦", "👑", "★"}
local themeDisplay = {"MIDNIGHT", "EMERALD", "RUBY", "ROYAL", "GOLD"}

-- ТЕКУЩИЕ НАСТРОЙКИ
local currentTheme = "midnight"
local currentTransparency = 0.05  -- 5%
local currentLang = "ru"

-- ВРЕМЕННЫЕ НАСТРОЙКИ (ДЛЯ СОХРАНЕНИЯ)
local tempTheme = "midnight"
local tempTransparency = 0.05
local tempLang = "ru"

-- ============================================================
--  [2] ЯЗЫКИ
-- ============================================================
local LANG = {
    ru = {
        title = "MUSLIM MENU v14.4",
        info = "📋 ИНФОРМАЦИЯ",
        info_hello = "Привет! Это мой первый скрипт!",
        info_rate = "Если не сложно, оцените его. 🌟",
        info_nick = "👤 Мой Roblox: TORMENTOR412",
        info_footer = "❤️ Спасибо за использование!",
        settings = "⚙️ НАСТРОЙКИ",
        theme = "🎨 Тема:",
        transparency = "🔲 Прозрачность:",
        lang = "🌍 Язык:",
        save = "💾 Сохранить",
        watermark = "MUSLIM MENU v14.4 | TORMENTOR412"
    },
    en = {
        title = "MUSLIM MENU v14.4",
        info = "📋 INFO",
        info_hello = "Hello! It's my first script!",
        info_rate = "If it's not too much trouble, please rate it. 🌟",
        info_nick = "👤 My Roblox: TORMENTOR412",
        info_footer = "❤️ Thanks for using!",
        settings = "⚙️ SETTINGS",
        theme = "🎨 Theme:",
        transparency = "🔲 Transparency:",
        lang = "🌍 Language:",
        save = "💾 Save",
        watermark = "MUSLIM MENU v14.4 | TORMENTOR412"
    }
}

-- ============================================================
--  [3] ФУНКЦИИ ОБНОВЛЕНИЯ
-- ============================================================
local function updateUI()
    local theme = THEMES[currentTheme]
    local lang = LANG[currentLang]
    
    -- ОБНОВЛЯЕМ ЦВЕТА
    frame.BackgroundColor3 = theme.main
    frame.BackgroundTransparency = currentTransparency
    frame.BorderColor3 = theme.accent
    
    header.BackgroundColor3 = theme.header
    title.TextColor3 = theme.accent
    title.Text = lang.title
    
    -- INFO
    infoTitle.Text = lang.info
    infoTitle.TextColor3 = theme.accent
    infoHello.Text = lang.info_hello
    infoHello.TextColor3 = theme.text
    infoRate.Text = lang.info_rate
    infoRate.TextColor3 = theme.text
    infoNick.Text = lang.info_nick
    infoNick.TextColor3 = theme.accent
    infoFooter.Text = lang.info_footer
    infoFooter.TextColor3 = theme.text
    
    -- SETTINGS
    settingsTitle.Text = lang.settings
    settingsTitle.TextColor3 = theme.accent
    themeLabel.Text = lang.theme
    themeLabel.TextColor3 = theme.text
    transLabel.Text = lang.transparency
    transLabel.TextColor3 = theme.text
    langLabel.Text = lang.lang
    langLabel.TextColor3 = theme.text
    saveBtn.Text = lang.save
    saveBtn.TextColor3 = theme.text
    saveBtn.BackgroundColor3 = theme.accent
    
    -- ВОДЯНОЙ ЗНАК
    watermark.Text = lang.watermark
    watermark.TextColor3 = theme.accent
    
    -- КНОПКИ ВКЛАДОК
    infoBtn.BackgroundColor3 = theme.btn
    settingsBtn.BackgroundColor3 = theme.btn
    
    -- ОБНОВЛЯЕМ ЗНАЧЕНИЯ
    updateValues()
end

local function updateValues()
    -- ОБНОВЛЯЕМ ОТОБРАЖЕНИЕ ТЕКУЩИХ ЗНАЧЕНИЙ
    for i, name in ipairs(themeNames) do
        if name == currentTheme then
            themeValue.Text = themeIcons[i] .. " " .. themeDisplay[i]
        end
    end
    transValue.Text = math.round(currentTransparency * 100) .. "%"
    langValue.Text = currentLang == "ru" and "🇷🇺 Русский" or "🇬🇧 English"
end

-- ============================================================
--  [4] ОСНОВНОЕ МЕНЮ
-- ============================================================
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 700, 0, 450)
frame.Position = UDim2.new(0.5, -350, 0.5, -225)
frame.BackgroundColor3 = THEMES.midnight.main
frame.BackgroundTransparency = 0.05
frame.BorderSizePixel = 2
frame.BorderColor3 = THEMES.midnight.accent
frame.Active = true
frame.Draggable = true
frame.ClipsDescendants = true
frame.Parent = gui

local corners = Instance.new("UICorner")
corners.CornerRadius = UDim.new(0, 20)
corners.Parent = frame

-- ============================================================
--  [5] ЗАГОЛОВОК
-- ============================================================
local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 50)
header.BackgroundColor3 = THEMES.midnight.header
header.BackgroundTransparency = 0.15
header.Parent = frame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(0.5, 0, 1, 0)
title.Position = UDim2.new(0.05, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "MUSLIM MENU v14.4"
title.TextColor3 = THEMES.midnight.accent
title.TextSize = 20
title.Font = Enum.Font.SourceSansBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = header

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 32, 0, 32)
closeBtn.Position = UDim2.new(0.94, 0, 0.5, -16)
closeBtn.BackgroundColor3 = Color3.fromRGB(200, 40, 40)
closeBtn.BackgroundTransparency = 0.05
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.TextSize = 18
closeBtn.Font = Enum.Font.SourceSansBold
closeBtn.Parent = header

closeBtn.MouseButton1Click:Connect(function()
    frame.Visible = false
end)

-- ============================================================
--  [6] ВКЛАДКИ
-- ============================================================
local tabContainer = Instance.new("Frame")
tabContainer.Size = UDim2.new(0, 100, 1, -50)
tabContainer.Position = UDim2.new(0, 0, 0, 50)
tabContainer.BackgroundColor3 = THEMES.midnight.btn
tabContainer.BackgroundTransparency = 0.15
tabContainer.Parent = frame

local contentContainer = Instance.new("Frame")
contentContainer.Size = UDim2.new(1, -110, 1, -60)
contentContainer.Position = UDim2.new(0, 105, 0, 55)
contentContainer.BackgroundTransparency = 1
contentContainer.Parent = frame

-- КНОПКИ ВКЛАДОК
local infoBtn = Instance.new("TextButton")
infoBtn.Size = UDim2.new(1, 0, 0, 40)
infoBtn.Position = UDim2.new(0, 0, 0, 0)
infoBtn.BackgroundColor3 = THEMES.midnight.accent
infoBtn.BackgroundTransparency = 0.15
infoBtn.Text = "INFO"
infoBtn.TextColor3 = THEMES.midnight.main
infoBtn.TextSize = 14
infoBtn.Font = Enum.Font.SourceSansBold
infoBtn.Parent = tabContainer

local settingsBtn = Instance.new("TextButton")
settingsBtn.Size = UDim2.new(1, 0, 0, 40)
settingsBtn.Position = UDim2.new(0, 0, 0, 45)
settingsBtn.BackgroundColor3 = THEMES.midnight.btn
settingsBtn.BackgroundTransparency = 0.15
settingsBtn.Text = "SETTINGS"
settingsBtn.TextColor3 = THEMES.midnight.text
settingsBtn.TextSize = 14
settingsBtn.Font = Enum.Font.SourceSansBold
settingsBtn.Parent = tabContainer

-- ============================================================
--  [7] INFO
-- ============================================================
local infoContent = Instance.new("Frame")
infoContent.Size = UDim2.new(1, 0, 1, 0)
infoContent.BackgroundTransparency = 1
infoContent.Parent = contentContainer

local infoTitle = Instance.new("TextLabel")
infoTitle.Size = UDim2.new(1, 0, 0.15, 0)
infoTitle.Position = UDim2.new(0, 0, 0.05, 0)
infoTitle.BackgroundTransparency = 1
infoTitle.Text = "📋 ИНФОРМАЦИЯ"
infoTitle.TextColor3 = THEMES.midnight.accent
infoTitle.TextSize = 28
infoTitle.Font = Enum.Font.SourceSansBold
infoTitle.Parent = infoContent

local infoHello = Instance.new("TextLabel")
infoHello.Size = UDim2.new(1, 0, 0.15, 0)
infoHello.Position = UDim2.new(0, 0, 0.2, 0)
infoHello.BackgroundTransparency = 1
infoHello.Text = "Привет! Это мой первый скрипт!"
infoHello.TextColor3 = THEMES.midnight.text
infoHello.TextSize = 22
infoHello.Font = Enum.Font.SourceSansBold
infoHello.Parent = infoContent

local infoRate = Instance.new("TextLabel")
infoRate.Size = UDim2.new(1, 0, 0.15, 0)
infoRate.Position = UDim2.new(0, 0, 0.4, 0)
infoRate.BackgroundTransparency = 1
infoRate.Text = "Если не сложно, оцените его. 🌟"
infoRate.TextColor3 = THEMES.midnight.text
infoRate.TextSize = 18
infoRate.Font = Enum.Font.SourceSansBold
infoRate.Parent = infoContent

local infoNick = Instance.new("TextLabel")
infoNick.Size = UDim2.new(1, 0, 0.15, 0)
infoNick.Position = UDim2.new(0, 0, 0.6, 0)
infoNick.BackgroundTransparency = 1
infoNick.Text = "👤 Мой Roblox: TORMENTOR412"
infoNick.TextColor3 = THEMES.midnight.accent
infoNick.TextSize = 20
infoNick.Font = Enum.Font.SourceSansBold
infoNick.Parent = infoContent

local line = Instance.new("Frame")
line.Size = UDim2.new(0.9, 0, 0.002, 0)
line.Position = UDim2.new(0.05, 0, 0.8, 0)
line.BackgroundColor3 = THEMES.midnight.accent
line.BackgroundTransparency = 0.5
line.Parent = infoContent

local infoFooter = Instance.new("TextLabel")
infoFooter.Size = UDim2.new(1, 0, 0.1, 0)
infoFooter.Position = UDim2.new(0, 0, 0.85, 0)
infoFooter.BackgroundTransparency = 1
infoFooter.Text = "❤️ Спасибо за использование!"
infoFooter.TextColor3 = THEMES.midnight.text
infoFooter.TextSize = 16
infoFooter.Font = Enum.Font.SourceSansBold
infoFooter.Parent = infoContent

-- ============================================================
--  [8] SETTINGS
-- ============================================================
local settingsContent = Instance.new("Frame")
settingsContent.Size = UDim2.new(1, 0, 1, 0)
settingsContent.BackgroundTransparency = 0.1
settingsContent.BackgroundColor3 = Color3.fromRGB(15, 15, 30)
settingsContent.Visible = false
settingsContent.Parent = contentContainer

-- РАМКА
local settingsBorder = Instance.new("Frame")
settingsBorder.Size = UDim2.new(1, 0, 1, 0)
settingsBorder.BackgroundTransparency = 1
settingsBorder.BorderSizePixel = 2
settingsBorder.BorderColor3 = THEMES.midnight.accent
settingsBorder.Parent = settingsContent

local settingsTitle = Instance.new("TextLabel")
settingsTitle.Size = UDim2.new(1, 0, 0.08, 0)
settingsTitle.Position = UDim2.new(0, 0, 0.02, 0)
settingsTitle.BackgroundTransparency = 1
settingsTitle.Text = "⚙️ НАСТРОЙКИ"
settingsTitle.TextColor3 = THEMES.midnight.accent
settingsTitle.TextSize = 24
settingsTitle.Font = Enum.Font.SourceSansBold
settingsTitle.Parent = settingsContent

-- ТЕМА
local themeLabel = Instance.new("TextLabel")
themeLabel.Size = UDim2.new(0.3, 0, 0.06, 0)
themeLabel.Position = UDim2.new(0.05, 0, 0.12, 0)
themeLabel.BackgroundTransparency = 1
themeLabel.Text = "🎨 Тема:"
themeLabel.TextColor3 = THEMES.midnight.text
themeLabel.TextSize = 16
themeLabel.Font = Enum.Font.SourceSansBold
themeLabel.TextXAlignment = Enum.TextXAlignment.Left
themeLabel.Parent = settingsContent

-- КНОПКИ ТЕМ
local themeContainer = Instance.new("Frame")
themeContainer.Size = UDim2.new(0.6, 0, 0.06, 0)
themeContainer.Position = UDim2.new(0.35, 0, 0.12, 0)
themeContainer.BackgroundTransparency = 1
themeContainer.Parent = settingsContent

local themeValue = Instance.new("TextLabel")
themeValue.Size = UDim2.new(0.4, 0, 1, 0)
themeValue.Position = UDim2.new(0.6, 0, 0, 0)
themeValue.BackgroundTransparency = 1
themeValue.Text = "🌙 MIDNIGHT"
themeValue.TextColor3 = THEMES.midnight.accent
themeValue.TextSize = 14
themeValue.Font = Enum.Font.SourceSansBold
themeValue.TextXAlignment = Enum.TextXAlignment.Right
themeValue.Parent = themeContainer

for i, name in ipairs(themeNames) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 30, 0, 30)
    btn.Position = UDim2.new(0.05 + (i-1) * 0.16, 0, 0, 0)
    btn.BackgroundColor3 = THEMES[name].accent
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
        tempTheme = name
        themeValue.Text = themeIcons[i] .. " " .. themeDisplay[i]
        print("🎨 Выбрана тема: " .. name)
    end)
end

-- ПРОЗРАЧНОСТЬ
local transLabel = Instance.new("TextLabel")
transLabel.Size = UDim2.new(0.3, 0, 0.06, 0)
transLabel.Position = UDim2.new(0.05, 0, 0.22, 0)
transLabel.BackgroundTransparency = 1
transLabel.Text = "🔲 Прозрачность:"
transLabel.TextColor3 = THEMES.midnight.text
transLabel.TextSize = 16
transLabel.Font = Enum.Font.SourceSansBold
transLabel.TextXAlignment = Enum.TextXAlignment.Left
transLabel.Parent = settingsContent

local transValue = Instance.new("TextLabel")
transValue.Size = UDim2.new(0.15, 0, 0.06, 0)
transValue.Position = UDim2.new(0.8, 0, 0.22, 0)
transValue.BackgroundTransparency = 1
transValue.Text = "5%"
transValue.TextColor3 = THEMES.midnight.accent
transValue.TextSize = 16
transValue.Font = Enum.Font.SourceSansBold
transValue.TextXAlignment = Enum.TextXAlignment.Right
transValue.Parent = settingsContent

local transSlider = Instance.new("Frame")
transSlider.Size = UDim2.new(0.45, 0, 0.035, 0)
transSlider.Position = UDim2.new(0.35, 0, 0.235, 0)
transSlider.BackgroundColor3 = THEMES.midnight.btn
transSlider.BackgroundTransparency = 0.1
transSlider.BorderSizePixel = 1
transSlider.BorderColor3 = THEMES.midnight.accent
transSlider.Parent = settingsContent

local transFill = Instance.new("Frame")
transFill.Size = UDim2.new(0.05, 0, 1, 0)
transFill.BackgroundColor3 = THEMES.midnight.accent
transFill.BackgroundTransparency = 0.5
transFill.BorderSizePixel = 0
transFill.Parent = transSlider

local transKnob = Instance.new("TextButton")
transKnob.Size = UDim2.new(0, 16, 0, 16)
transKnob.Position = UDim2.new(0.05, -8, 0.5, -8)
transKnob.BackgroundColor3 = THEMES.midnight.accent
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
langLabel.Position = UDim2.new(0.05, 0, 0.32, 0)
langLabel.BackgroundTransparency = 1
langLabel.Text = "🌍 Язык:"
langLabel.TextColor3 = THEMES.midnight.text
langLabel.TextSize = 16
langLabel.Font = Enum.Font.SourceSansBold
langLabel.TextXAlignment = Enum.TextXAlignment.Left
langLabel.Parent = settingsContent

local langContainer = Instance.new("Frame")
langContainer.Size = UDim2.new(0.3, 0, 0.06, 0)
langContainer.Position = UDim2.new(0.35, 0, 0.32, 0)
langContainer.BackgroundTransparency = 1
langContainer.Parent = settingsContent

local langRu = Instance.new("TextButton")
langRu.Size = UDim2.new(0.45, 0, 1, 0)
langRu.Position = UDim2.new(0, 0, 0, 0)
langRu.BackgroundColor3 = THEMES.midnight.accent
langRu.BackgroundTransparency = 0.1
langRu.Text = "🇷🇺 Рус"
langRu.TextColor3 = THEMES.midnight.text
langRu.TextSize = 14
langRu.Font = Enum.Font.SourceSansBold
langRu.Parent = langContainer

local langEn = Instance.new("TextButton")
langEn.Size = UDim2.new(0.45, 0, 1, 0)
langEn.Position = UDim2.new(0.55, 0, 0, 0)
langEn.BackgroundColor3 = THEMES.midnight.btn
langEn.BackgroundTransparency = 0.1
langEn.Text = "🇬🇧 Eng"
langEn.TextColor3 = THEMES.midnight.text
langEn.TextSize = 14
langEn.Font = Enum.Font.SourceSansBold
langEn.Parent = langContainer

local langValue = Instance.new("TextLabel")
langValue.Size = UDim2.new(0.2, 0, 0.06, 0)
langValue.Position = UDim2.new(0.7, 0, 0.32, 0)
langValue.BackgroundTransparency = 1
langValue.Text = "🇷🇺 Русский"
langValue.TextColor3 = THEMES.midnight.accent
langValue.TextSize = 14
langValue.Font = Enum.Font.SourceSansBold
langValue.TextXAlignment = Enum.TextXAlignment.Right
langValue.Parent = settingsContent

langRu.MouseButton1Click:Connect(function()
    tempLang = "ru"
    langValue.Text = "🇷🇺 Русский"
    langRu.BackgroundColor3 = THEMES.midnight.accent
    langEn.BackgroundColor3 = THEMES.midnight.btn
    print("🌍 Выбран русский")
end)

langEn.MouseButton1Click:Connect(function()
    tempLang = "en"
    langValue.Text = "🇬🇧 English"
    langEn.BackgroundColor3 = THEMES.midnight.accent
    langRu.BackgroundColor3 = THEMES.midnight.btn
    print("🌍 Выбран английский")
end)

-- КНОПКА СОХРАНИТЬ
local saveBtn = Instance.new("TextButton")
saveBtn.Size = UDim2.new(0.25, 0, 0.07, 0)
saveBtn.Position = UDim2.new(0.35, 0, 0.45, 0)
saveBtn.BackgroundColor3 = THEMES.midnight.accent
saveBtn.BackgroundTransparency = 0.15
saveBtn.Text = "💾 Сохранить"
saveBtn.TextColor3 = THEMES.midnight.text
saveBtn.TextSize = 18
saveBtn.Font = Enum.Font.SourceSansBold
saveBtn.Parent = settingsContent

local saveCorners = Instance.new("UICorner")
saveCorners.CornerRadius = UDim.new(0, 10)
saveCorners.Parent = saveBtn

saveBtn.MouseButton1Click:Connect(function()
    -- СОХРАНЯЕМ НАСТРОЙКИ
    currentTheme = tempTheme
    currentTransparency = tempTransparency
    currentLang = tempLang
    
    -- ОБНОВЛЯЕМ UI
    updateUI()
    updateValues()
    
    print("✅ Настройки сохранены!")
    print("🎨 Тема: " .. currentTheme)
    print("🔲 Прозрачность: " .. math.round(currentTransparency * 100) .. "%")
    print("🌍 Язык: " .. (currentLang == "ru" and "Русский" or "English"))
end)

-- ============================================================
--  [9] ВОДЯНОЙ ЗНАК
-- ============================================================
local watermark = Instance.new("TextLabel")
watermark.Size = UDim2.new(1, 0, 0, 20)
watermark.Position = UDim2.new(0, 0, 0.97, 0)
watermark.BackgroundTransparency = 1
watermark.Text = "MUSLIM MENU v14.4 | TORMENTOR412"
watermark.TextColor3 = THEMES.midnight.accent
watermark.TextSize = 10
watermark.Font = Enum.Font.SourceSans
watermark.TextTransparency = 0.5
watermark.Parent = frame

-- ============================================================
--  [10] ПЕРЕКЛЮЧЕНИЕ ВКЛАДОК
-- ============================================================
infoBtn.MouseButton1Click:Connect(function()
    infoContent.Visible = true
    settingsContent.Visible = false
    infoBtn.BackgroundColor3 = THEMES[currentTheme].accent
    infoBtn.BackgroundTransparency = 0.15
    infoBtn.TextColor3 = THEMES[currentTheme].main
    settingsBtn.BackgroundColor3 = THEMES[currentTheme].btn
    settingsBtn.BackgroundTransparency = 0.15
    settingsBtn.TextColor3 = THEMES[currentTheme].text
end)

settingsBtn.MouseButton1Click:Connect(function()
    infoContent.Visible = false
    settingsContent.Visible = true
    settingsBtn.BackgroundColor3 = THEMES[currentTheme].accent
    settingsBtn.BackgroundTransparency = 0.15
    settingsBtn.TextColor3 = THEMES[currentTheme].main
    infoBtn.BackgroundColor3 = THEMES[currentTheme].btn
    infoBtn.BackgroundTransparency = 0.15
    infoBtn.TextColor3 = THEMES[currentTheme].text
end)

-- ============================================================
--  [11] ХОТКЕЙ F1
-- ============================================================
game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.F1 then
        frame.Visible = not frame.Visible
    end
end)

-- ============================================================
--  [12] ИНИЦИАЛИЗАЦИЯ
-- ============================================================
updateUI()
updateValues()

print("✅ Muslim Menu v14.4 загружен успешно!")
print("🔑 F1 - открыть/закрыть")
