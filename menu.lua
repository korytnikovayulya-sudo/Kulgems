-- ============================================================
--  MUSLIM MENU v14.4 - FULLY WORKING (FIXED)
--  by Tormentor412
-- ============================================================

print("🚀 Загрузка Muslim Menu v14.4...")

local player = game:GetService("Players").LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "MuslimMenu"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- ============================================================
--  ТЕМЫ
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

-- ============================================================
--  ЯЗЫКИ (ПО УМОЛЧАНИЮ АНГЛИЙСКИЙ)
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
        lang = "🌍 Language:",
        save = "💾 Save",
        watermark = "MUSLIM MENU v14.4 | TORMENTOR412"
    }
}

-- ============================================================
--  НАСТРОЙКИ (ПО УМОЛЧАНИЮ АНГЛИЙСКИЙ, БЕЗ ПРОЗРАЧНОСТИ)
-- ============================================================
local currentTheme = "midnight"
local currentLang = "en"          -- ПО УМОЛЧАНИЮ АНГЛИЙСКИЙ
local tempLang = "en"             -- ВРЕМЕННЫЙ ВЫБОР ЯЗЫКА

-- ============================================================
--  ФУНКЦИЯ ПРИМЕНЕНИЯ ВСЕХ НАСТРОЕК (БЕЗ ПРОЗРАЧНОСТИ)
-- ============================================================
local function applyAllSettings()
    local theme = THEMES[currentTheme]
    local lang = LANG[currentLang]
    
    -- МЕНЮ
    frame.BackgroundColor3 = theme.main
    frame.BorderColor3 = theme.accent
    
    -- ЗАГОЛОВОК
    header.BackgroundColor3 = theme.header
    title.Text = lang.title
    title.TextColor3 = theme.accent
    
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
    lineInfo.BackgroundColor3 = theme.accent
    
    -- SETTINGS
    settingsTitle.Text = lang.settings
    settingsTitle.TextColor3 = theme.accent
    settingsBorder.BorderColor3 = theme.accent
    
    themeLabel.Text = lang.theme
    themeLabel.TextColor3 = theme.text
    langLabel.Text = lang.lang
    langLabel.TextColor3 = theme.text
    saveBtn.Text = lang.save
    saveBtn.TextColor3 = theme.text
    saveBtn.BackgroundColor3 = theme.accent
    
    -- ВОДЯНОЙ ЗНАК
    watermark.Text = lang.watermark
    watermark.TextColor3 = theme.accent
    
    -- КНОПКИ ТЕМ
    for i, btn in pairs(themeContainer:GetChildren()) do
        if btn:IsA("TextButton") then
            local name = themeNames[i]
            if name then
                btn.BackgroundColor3 = THEMES[name].accent
            end
        end
    end
    
    -- ЯЗЫКОВЫЕ КНОПКИ (подсветка только после сохранения)
    langRu.BackgroundColor3 = theme.btn
    langEn.BackgroundColor3 = theme.btn
    if currentLang == "ru" then
        langRu.BackgroundColor3 = theme.accent
    else
        langEn.BackgroundColor3 = theme.accent
    end
    
    -- КНОПКИ ВКЛАДОК
    infoBtn.BackgroundColor3 = theme.btn
    settingsBtn.BackgroundColor3 = theme.btn
    if infoContent.Visible then
        infoBtn.BackgroundColor3 = theme.accent
        infoBtn.TextColor3 = theme.main
        settingsBtn.TextColor3 = theme.text
    else
        settingsBtn.BackgroundColor3 = theme.accent
        settingsBtn.TextColor3 = theme.main
        infoBtn.TextColor3 = theme.text
    end
    
    -- ЗНАЧЕНИЕ ТЕМЫ
    for i, name in ipairs(themeNames) do
        if name == currentTheme then
            themeValue.Text = themeIcons[i] .. " " .. themeDisplay[i]
        end
    end
    
    -- ЗНАЧЕНИЕ ЯЗЫКА (отображаем текущий выбранный язык)
    langValue.Text = currentLang == "ru" and "🇷🇺 Русский" or "🇬🇧 English"
end

-- ============================================================
--  ОСНОВНОЕ МЕНЮ
-- ============================================================
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 700, 0, 450)
frame.Position = UDim2.new(0.5, -350, 0.5, -225)
frame.BackgroundColor3 = Color3.fromRGB(10, 10, 14)
frame.BackgroundTransparency = 0.05
frame.BorderSizePixel = 2
frame.BorderColor3 = Color3.fromRGB(100, 180, 255)
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
header.BackgroundColor3 = Color3.fromRGB(16, 18, 24)
header.BackgroundTransparency = 0.15
header.Parent = frame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(0.5, 0, 1, 0)
title.Position = UDim2.new(0.05, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "MUSLIM MENU v14.4"
title.TextColor3 = Color3.fromRGB(100, 180, 255)
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
--  ВКЛАДКИ
-- ============================================================
local tabContainer = Instance.new("Frame")
tabContainer.Size = UDim2.new(0, 100, 1, -50)
tabContainer.Position = UDim2.new(0, 0, 0, 50)
tabContainer.BackgroundColor3 = Color3.fromRGB(22, 26, 34)
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
infoBtn.BackgroundColor3 = Color3.fromRGB(100, 180, 255)
infoBtn.BackgroundTransparency = 0.15
infoBtn.Text = "INFO"
infoBtn.TextColor3 = Color3.fromRGB(10, 10, 14)
infoBtn.TextSize = 14
infoBtn.Font = Enum.Font.SourceSansBold
infoBtn.Parent = tabContainer

local settingsBtn = Instance.new("TextButton")
settingsBtn.Size = UDim2.new(1, 0, 0, 40)
settingsBtn.Position = UDim2.new(0, 0, 0, 45)
settingsBtn.BackgroundColor3 = Color3.fromRGB(22, 26, 34)
settingsBtn.BackgroundTransparency = 0.15
settingsBtn.Text = "SETTINGS"
settingsBtn.TextColor3 = Color3.fromRGB(220, 230, 240)
settingsBtn.TextSize = 14
settingsBtn.Font = Enum.Font.SourceSansBold
settingsBtn.Parent = tabContainer

-- ============================================================
--  INFO
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
infoTitle.TextColor3 = Color3.fromRGB(100, 180, 255)
infoTitle.TextSize = 28
infoTitle.Font = Enum.Font.SourceSansBold
infoTitle.Parent = infoContent

local infoHello = Instance.new("TextLabel")
infoHello.Size = UDim2.new(1, 0, 0.15, 0)
infoHello.Position = UDim2.new(0, 0, 0.2, 0)
infoHello.BackgroundTransparency = 1
infoHello.Text = "Привет! Это мой первый скрипт!"
infoHello.TextColor3 = Color3.fromRGB(220, 230, 240)
infoHello.TextSize = 22
infoHello.Font = Enum.Font.SourceSansBold
infoHello.Parent = infoContent

local infoRate = Instance.new("TextLabel")
infoRate.Size = UDim2.new(1, 0, 0.15, 0)
infoRate.Position = UDim2.new(0, 0, 0.4, 0)
infoRate.BackgroundTransparency = 1
infoRate.Text = "Если не сложно, оцените его. 🌟"
infoRate.TextColor3 = Color3.fromRGB(220, 230, 240)
infoRate.TextSize = 18
infoRate.Font = Enum.Font.SourceSansBold
infoRate.Parent = infoContent

local infoNick = Instance.new("TextLabel")
infoNick.Size = UDim2.new(1, 0, 0.15, 0)
infoNick.Position = UDim2.new(0, 0, 0.6, 0)
infoNick.BackgroundTransparency = 1
infoNick.Text = "👤 Мой Roblox: TORMENTOR412"
infoNick.TextColor3 = Color3.fromRGB(100, 180, 255)
infoNick.TextSize = 20
infoNick.Font = Enum.Font.SourceSansBold
infoNick.Parent = infoContent

local lineInfo = Instance.new("Frame")
lineInfo.Size = UDim2.new(0.9, 0, 0.002, 0)
lineInfo.Position = UDim2.new(0.05, 0, 0.8, 0)
lineInfo.BackgroundColor3 = Color3.fromRGB(100, 180, 255)
lineInfo.BackgroundTransparency = 0.5
lineInfo.Parent = infoContent

local infoFooter = Instance.new("TextLabel")
infoFooter.Size = UDim2.new(1, 0, 0.1, 0)
infoFooter.Position = UDim2.new(0, 0, 0.85, 0)
infoFooter.BackgroundTransparency = 1
infoFooter.Text = "❤️ Спасибо за использование!"
infoFooter.TextColor3 = Color3.fromRGB(220, 230, 240)
infoFooter.TextSize = 16
infoFooter.Font = Enum.Font.SourceSansBold
infoFooter.Parent = infoContent

-- ============================================================
--  SETTINGS (БЕЗ ПРОЗРАЧНОСТИ)
-- ============================================================
local settingsContent = Instance.new("Frame")
settingsContent.Size = UDim2.new(1, 0, 1, 0)
settingsContent.BackgroundTransparency = 1
settingsContent.Visible = false
settingsContent.Parent = contentContainer

local settingsBorder = Instance.new("Frame")
settingsBorder.Size = UDim2.new(1, 0, 1, 0)
settingsBorder.BackgroundTransparency = 1
settingsBorder.BorderSizePixel = 2
settingsBorder.BorderColor3 = Color3.fromRGB(100, 180, 255)
settingsBorder.Parent = settingsContent

local settingsTitle = Instance.new("TextLabel")
settingsTitle.Size = UDim2.new(1, 0, 0.08, 0)
settingsTitle.Position = UDim2.new(0, 0, 0.02, 0)
settingsTitle.BackgroundTransparency = 1
settingsTitle.Text = "⚙️ НАСТРОЙКИ"
settingsTitle.TextColor3 = Color3.fromRGB(100, 180, 255)
settingsTitle.TextSize = 24
settingsTitle.Font = Enum.Font.SourceSansBold
settingsTitle.Parent = settingsContent

-- ТЕМА
local themeLabel = Instance.new("TextLabel")
themeLabel.Size = UDim2.new(0.3, 0, 0.06, 0)
themeLabel.Position = UDim2.new(0.05, 0, 0.12, 0)
themeLabel.BackgroundTransparency = 1
themeLabel.Text = "🎨 Тема:"
themeLabel.TextColor3 = Color3.fromRGB(220, 230, 240)
themeLabel.TextSize = 16
themeLabel.Font = Enum.Font.SourceSansBold
themeLabel.TextXAlignment = Enum.TextXAlignment.Left
themeLabel.Parent = settingsContent

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
themeValue.TextColor3 = Color3.fromRGB(100, 180, 255)
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
        currentTheme = name
        themeValue.Text = themeIcons[i] .. " " .. themeDisplay[i]
        applyAllSettings()
        print("🎨 Тема: " .. name)
    end)
end

-- ЯЗЫК (без подсветки при выборе)
local langLabel = Instance.new("TextLabel")
langLabel.Size = UDim2.new(0.3, 0, 0.06, 0)
langLabel.Position = UDim2.new(0.05, 0, 0.22, 0)
langLabel.BackgroundTransparency = 1
langLabel.Text = "🌍 Язык:"
langLabel.TextColor3 = Color3.fromRGB(220, 230, 240)
langLabel.TextSize = 16
langLabel.Font = Enum.Font.SourceSansBold
langLabel.TextXAlignment = Enum.TextXAlignment.Left
langLabel.Parent = settingsContent

local langContainer = Instance.new("Frame")
langContainer.Size = UDim2.new(0.3, 0, 0.06, 0)
langContainer.Position = UDim2.new(0.35, 0, 0.22, 0)
langContainer.BackgroundTransparency = 1
langContainer.Parent = settingsContent

local langRu = Instance.new("TextButton")
langRu.Size = UDim2.new(0.45, 0, 1, 0)
langRu.Position = UDim2.new(0, 0, 0, 0)
langRu.BackgroundColor3 = Color3.fromRGB(22, 26, 34)  -- нейтральный
langRu.BackgroundTransparency = 0.1
langRu.Text = "🇷🇺 Рус"
langRu.TextColor3 = Color3.fromRGB(220, 230, 240)
langRu.TextSize = 14
langRu.Font = Enum.Font.SourceSansBold
langRu.Parent = langContainer

local langEn = Instance.new("TextButton")
langEn.Size = UDim2.new(0.45, 0, 1, 0)
langEn.Position = UDim2.new(0.55, 0, 0, 0)
langEn.BackgroundColor3 = Color3.fromRGB(22, 26, 34)  -- нейтральный
langEn.BackgroundTransparency = 0.1
langEn.Text = "🇬🇧 Eng"
langEn.TextColor3 = Color3.fromRGB(220, 230, 240)
langEn.TextSize = 14
langEn.Font = Enum.Font.SourceSansBold
langEn.Parent = langContainer

local langValue = Instance.new("TextLabel")
langValue.Size = UDim2.new(0.2, 0, 0.06, 0)
langValue.Position = UDim2.new(0.7, 0, 0.22, 0)
langValue.BackgroundTransparency = 1
langValue.Text = "🇬🇧 English"
langValue.TextColor3 = Color3.fromRGB(100, 180, 255)
langValue.TextSize = 14
langValue.Font = Enum.Font.SourceSansBold
langValue.TextXAlignment = Enum.TextXAlignment.Right
langValue.Parent = settingsContent

-- ВЫБОР ЯЗЫКА (БЕЗ ПОДСВЕТКИ И ПРИМЕНЕНИЯ)
langRu.MouseButton1Click:Connect(function()
    tempLang = "ru"
    langValue.Text = "🇷🇺 Русский"
    print("🌍 Выбран русский (нажми Сохранить)")
end)

langEn.MouseButton1Click:Connect(function()
    tempLang = "en"
    langValue.Text = "🇬🇧 English"
    print("🌍 Выбран английский (нажми Сохранить)")
end)

-- КНОПКА СОХРАНИТЬ (применяет язык)
local saveBtn = Instance.new("TextButton")
saveBtn.Size = UDim2.new(0.25, 0, 0.07, 0)
saveBtn.Position = UDim2.new(0.35, 0, 0.35, 0)
saveBtn.BackgroundColor3 = Color3.fromRGB(100, 180, 255)
saveBtn.BackgroundTransparency = 0.15
saveBtn.Text = "💾 Сохранить"
saveBtn.TextColor3 = Color3.fromRGB(220, 230, 240)
saveBtn.TextSize = 18
saveBtn.Font = Enum.Font.SourceSansBold
saveBtn.Parent = settingsContent

local saveCorners = Instance.new("UICorner")
saveCorners.CornerRadius = UDim.new(0, 10)
saveCorners.Parent = saveBtn

saveBtn.MouseButton1Click:Connect(function()
    currentLang = tempLang
    applyAllSettings()
    print("✅ Язык сохранён: " .. (currentLang == "ru" and "Русский" or "English"))
end)

-- ============================================================
--  ВОДЯНОЙ ЗНАК
-- ============================================================
local watermark = Instance.new("TextLabel")
watermark.Size = UDim2.new(1, 0, 0, 20)
watermark.Position = UDim2.new(0, 0, 0.97, 0)
watermark.BackgroundTransparency = 1
watermark.Text = "MUSLIM MENU v14.4 | TORMENTOR412"
watermark.TextColor3 = Color3.fromRGB(100, 180, 255)
watermark.TextSize = 10
watermark.Font = Enum.Font.SourceSans
watermark.TextTransparency = 0.5
watermark.Parent = frame

-- ============================================================
--  ПЕРЕКЛЮЧЕНИЕ ВКЛАДОК
-- ============================================================
infoBtn.MouseButton1Click:Connect(function()
    infoContent.Visible = true
    settingsContent.Visible = false
    applyAllSettings()
end)

settingsBtn.MouseButton1Click:Connect(function()
    infoContent.Visible = false
    settingsContent.Visible = true
    applyAllSettings()
end)

-- ============================================================
--  ХОТКЕЙ F1
-- ============================================================
game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.F1 then
        frame.Visible = not frame.Visible
    end
end)

-- ============================================================
--  ЗАПУСК
-- ============================================================
applyAllSettings()

print("✅ Muslim Menu v14.4 загружен успешно!")
print("🔑 F1 - открыть/закрыть")
print("🌍 Язык по умолчанию: Английский")
