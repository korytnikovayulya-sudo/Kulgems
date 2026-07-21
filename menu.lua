-- ============================================================
--  WERTIUM HUB - FINAL (NO TABS, WIDE MENU)
--  by Tormentor412
-- ============================================================

print("🚀 Загрузка Wertium Hub...")

local player = game:GetService("Players").LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "WertiumHub"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- ============================================================
--  [ПРИВЕТСТВИЕ] HELLO
-- ============================================================
local hello = Instance.new("TextLabel")
hello.Size = UDim2.new(1, 0, 1, 0)
hello.BackgroundTransparency = 1
hello.Text = "HELLO"
hello.TextColor3 = Color3.fromRGB(255, 215, 0)
hello.TextScaled = true
hello.Font = Enum.Font.GothamBold
hello.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
hello.TextStrokeTransparency = 0.5
hello.Parent = gui

game:GetService("TweenService"):Create(hello, TweenInfo.new(1.5, Enum.EasingStyle.Quad), {TextTransparency = 1}):Play()
game:GetService("Debris"):AddItem(hello, 1.5)

wait(1.5)

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
--  ЯЗЫКИ (ПО УМОЛЧАНИЮ РУССКИЙ)
-- ============================================================
local LANG = {
    ru = {
        title = "WERTIUM HUB",
        theme_label = "🎨 Тема:",
        lang_label = "🌍 Язык:",
        watermark = "WERTIUM HUB | TORMENTOR412"
    },
    en = {
        title = "WERTIUM HUB",
        theme_label = "🎨 Theme:",
        lang_label = "🌍 Language:",
        watermark = "WERTIUM HUB | TORMENTOR412"
    }
}

-- ============================================================
--  НАСТРОЙКИ
-- ============================================================
local currentTheme = "midnight"
local currentLang = "ru"

-- ============================================================
--  ФУНКЦИЯ ПРИМЕНЕНИЯ НАСТРОЕК
-- ============================================================
local function applyAllSettings()
    local theme = THEMES[currentTheme]
    local lang = LANG[currentLang]
    
    frame.BackgroundColor3 = theme.main
    frame.BorderColor3 = theme.accent
    
    header.BackgroundColor3 = theme.header
    title.Text = lang.title
    title.TextColor3 = theme.accent
    
    -- Обновляем цвет прицелов
    crosshairCircle.BorderColor3 = theme.accent
    lineH.BackgroundColor3 = theme.accent
    lineV.BackgroundColor3 = theme.accent
    dot.BackgroundColor3 = theme.accent
    -- для правого прицела
    crosshairCircle2.BorderColor3 = theme.accent
    lineH2.BackgroundColor3 = theme.accent
    lineV2.BackgroundColor3 = theme.accent
    dot2.BackgroundColor3 = theme.accent
    
    themeLabel.Text = lang.theme_label
    themeLabel.TextColor3 = theme.text
    langLabel.Text = lang.lang_label
    langLabel.TextColor3 = theme.text
    
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
    
    -- ЯЗЫКОВЫЕ КНОПКИ
    langRu.BackgroundColor3 = theme.btn
    langEn.BackgroundColor3 = theme.btn
    if currentLang == "ru" then
        langRu.BackgroundColor3 = theme.accent
        langRu.TextColor3 = theme.main
    else
        langEn.BackgroundColor3 = theme.accent
        langEn.TextColor3 = theme.main
    end
    
    -- ЗНАЧЕНИЕ ТЕМЫ
    for i, name in ipairs(themeNames) do
        if name == currentTheme then
            themeValue.Text = themeIcons[i] .. " " .. themeDisplay[i]
            themeValue.TextColor3 = theme.accent
        end
    end
end

-- ============================================================
--  ОСНОВНОЕ МЕНЮ (ШИРОКОЕ, БЕЗ ВКЛАДОК)
-- ============================================================
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 800, 0, 500)
frame.Position = UDim2.new(0.5, -400, 0.5, -250)
frame.BackgroundColor3 = Color3.fromRGB(10, 10, 14)
frame.BackgroundTransparency = 0.05
frame.BorderSizePixel = 2
frame.BorderColor3 = Color3.fromRGB(100, 180, 255)
frame.Active = true
frame.Draggable = true
frame.ClipsDescendants = true
frame.Parent = gui

-- МЯГКИЕ УГЛЫ
local corners = Instance.new("UICorner")
corners.CornerRadius = UDim.new(0, 20)
corners.Parent = frame

-- БЕЛАЯ ПОДСВЕТКА
local stroke = Instance.new("UIStroke")
stroke.Thickness = 2
stroke.Color = Color3.fromRGB(255, 255, 255)
stroke.Transparency = 0.5
stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
stroke.Parent = frame

-- ============================================================
--  ЗАГОЛОВОК С ДВУМЯ ПРИЦЕЛАМИ
-- ============================================================
local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 70)
header.BackgroundColor3 = Color3.fromRGB(16, 18, 24)
header.BackgroundTransparency = 0.15
header.Parent = frame

local headerCorners = Instance.new("UICorner")
headerCorners.CornerRadius = UDim.new(0, 20)
headerCorners.Parent = header

-- ЛЕВЫЙ ПРИЦЕЛ
local crosshairContainer = Instance.new("Frame")
crosshairContainer.Size = UDim2.new(0, 50, 1, 0)
crosshairContainer.Position = UDim2.new(0.02, 0, 0, 0)
crosshairContainer.BackgroundTransparency = 1
crosshairContainer.Parent = header

local crosshairCircle = Instance.new("Frame")
crosshairCircle.Size = UDim2.new(1, 0, 0.8, 0)
crosshairCircle.Position = UDim2.new(0, 0, 0.1, 0)
crosshairCircle.BackgroundTransparency = 1
crosshairCircle.BorderSizePixel = 2
crosshairCircle.BorderColor3 = Color3.fromRGB(100, 180, 255)
crosshairCircle.Parent = crosshairContainer
local circleCorners = Instance.new("UICorner")
circleCorners.CornerRadius = UDim.new(1, 0)
circleCorners.Parent = crosshairCircle

local lineH = Instance.new("Frame")
lineH.Size = UDim2.new(0.8, 0, 0.08, 0)
lineH.Position = UDim2.new(0.1, 0, 0.46, 0)
lineH.BackgroundColor3 = Color3.fromRGB(100, 180, 255)
lineH.BackgroundTransparency = 0.3
lineH.BorderSizePixel = 0
lineH.Parent = crosshairContainer

local lineV = Instance.new("Frame")
lineV.Size = UDim2.new(0.08, 0, 0.8, 0)
lineV.Position = UDim2.new(0.46, 0, 0.1, 0)
lineV.BackgroundColor3 = Color3.fromRGB(100, 180, 255)
lineV.BackgroundTransparency = 0.3
lineV.BorderSizePixel = 0
lineV.Parent = crosshairContainer

local dot = Instance.new("Frame")
dot.Size = UDim2.new(0.15, 0, 0.15, 0)
dot.Position = UDim2.new(0.425, 0, 0.425, 0)
dot.BackgroundColor3 = Color3.fromRGB(100, 180, 255)
dot.BackgroundTransparency = 0.2
dot.BorderSizePixel = 0
dot.Parent = crosshairContainer
local dotCorners = Instance.new("UICorner")
dotCorners.CornerRadius = UDim.new(1, 0)
dotCorners.Parent = dot

-- ПРАВЫЙ ПРИЦЕЛ
local crosshairContainer2 = Instance.new("Frame")
crosshairContainer2.Size = UDim2.new(0, 50, 1, 0)
crosshairContainer2.Position = UDim2.new(0.88, 0, 0, 0)
crosshairContainer2.BackgroundTransparency = 1
crosshairContainer2.Parent = header

local crosshairCircle2 = Instance.new("Frame")
crosshairCircle2.Size = UDim2.new(1, 0, 0.8, 0)
crosshairCircle2.Position = UDim2.new(0, 0, 0.1, 0)
crosshairCircle2.BackgroundTransparency = 1
crosshairCircle2.BorderSizePixel = 2
crosshairCircle2.BorderColor3 = Color3.fromRGB(100, 180, 255)
crosshairCircle2.Parent = crosshairContainer2
local circleCorners2 = Instance.new("UICorner")
circleCorners2.CornerRadius = UDim.new(1, 0)
circleCorners2.Parent = crosshairCircle2

local lineH2 = Instance.new("Frame")
lineH2.Size = UDim2.new(0.8, 0, 0.08, 0)
lineH2.Position = UDim2.new(0.1, 0, 0.46, 0)
lineH2.BackgroundColor3 = Color3.fromRGB(100, 180, 255)
lineH2.BackgroundTransparency = 0.3
lineH2.BorderSizePixel = 0
lineH2.Parent = crosshairContainer2

local lineV2 = Instance.new("Frame")
lineV2.Size = UDim2.new(0.08, 0, 0.8, 0)
lineV2.Position = UDim2.new(0.46, 0, 0.1, 0)
lineV2.BackgroundColor3 = Color3.fromRGB(100, 180, 255)
lineV2.BackgroundTransparency = 0.3
lineV2.BorderSizePixel = 0
lineV2.Parent = crosshairContainer2

local dot2 = Instance.new("Frame")
dot2.Size = UDim2.new(0.15, 0, 0.15, 0)
dot2.Position = UDim2.new(0.425, 0, 0.425, 0)
dot2.BackgroundColor3 = Color3.fromRGB(100, 180, 255)
dot2.BackgroundTransparency = 0.2
dot2.BorderSizePixel = 0
dot2.Parent = crosshairContainer2
local dotCorners2 = Instance.new("UICorner")
dotCorners2.CornerRadius = UDim.new(1, 0)
dotCorners2.Parent = dot2

-- АНИМАЦИЯ ПРИЦЕЛОВ
local angle = 0
local animConnection = game:GetService("RunService").RenderStepped:Connect(function()
    if not crosshairContainer or not crosshairContainer2 then
        if animConnection then
            animConnection:Disconnect()
            animConnection = nil
        end
        return
    end
    angle = angle + 0.03
    crosshairContainer.Rotation = math.deg(angle)
    crosshairContainer2.Rotation = math.deg(-angle) -- противоположное вращение для симметрии
end)

-- НАЗВАНИЕ ПО ЦЕНТРУ
local title = Instance.new("TextLabel")
title.Size = UDim2.new(0.6, 0, 1, 0)
title.Position = UDim2.new(0.2, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "WERTIUM HUB"
title.TextColor3 = Color3.fromRGB(100, 180, 255)
title.TextSize = 34
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Center
title.TextYAlignment = Enum.TextYAlignment.Center
title.Parent = header

-- КНОПКА ЗАКРЫТИЯ
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 35, 0, 35)
closeBtn.Position = UDim2.new(0.95, 0, 0.5, -17)
closeBtn.BackgroundColor3 = Color3.fromRGB(200, 40, 40)
closeBtn.BackgroundTransparency = 0.1
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.TextSize = 20
closeBtn.Font = Enum.Font.SourceSansBold
closeBtn.Parent = header

closeBtn.MouseButton1Click:Connect(function()
    frame.Visible = false
end)

-- ============================================================
--  НАСТРОЙКИ (ТЕМА И ЯЗЫК) - РАСПОЛОЖЕНЫ НИЖЕ
-- ============================================================
local settingsArea = Instance.new("Frame")
settingsArea.Size = UDim2.new(1, 0, 0, 200)
settingsArea.Position = UDim2.new(0, 0, 0, 70)
settingsArea.BackgroundTransparency = 1
settingsArea.Parent = frame

-- ТЕМА
local themeLabel = Instance.new("TextLabel")
themeLabel.Size = UDim2.new(0.2, 0, 0.08, 0)
themeLabel.Position = UDim2.new(0.05, 0, 0.05, 0)
themeLabel.BackgroundTransparency = 1
themeLabel.Text = "🎨 Тема:"
themeLabel.TextColor3 = Color3.fromRGB(220, 230, 240)
themeLabel.TextSize = 18
themeLabel.Font = Enum.Font.SourceSansBold
themeLabel.TextXAlignment = Enum.TextXAlignment.Left
themeLabel.Parent = settingsArea

local themeContainer = Instance.new("Frame")
themeContainer.Size = UDim2.new(0.6, 0, 0.08, 0)
themeContainer.Position = UDim2.new(0.25, 0, 0.05, 0)
themeContainer.BackgroundTransparency = 1
themeContainer.Parent = settingsArea

local themeValue = Instance.new("TextLabel")
themeValue.Size = UDim2.new(0.3, 0, 1, 0)
themeValue.Position = UDim2.new(0.7, 0, 0, 0)
themeValue.BackgroundTransparency = 1
themeValue.Text = "🌙 MIDNIGHT"
themeValue.TextColor3 = Color3.fromRGB(100, 180, 255)
themeValue.TextSize = 16
themeValue.Font = Enum.Font.SourceSansBold
themeValue.TextXAlignment = Enum.TextXAlignment.Right
themeValue.Parent = themeContainer

for i, name in ipairs(themeNames) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 35, 0, 35)
    btn.Position = UDim2.new(0.05 + (i-1) * 0.14, 0, 0, 0)
    btn.BackgroundColor3 = THEMES[name].accent
    btn.BackgroundTransparency = 0
    btn.Text = themeIcons[i]
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 16
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

-- ЯЗЫК
local langLabel = Instance.new("TextLabel")
langLabel.Size = UDim2.new(0.2, 0, 0.08, 0)
langLabel.Position = UDim2.new(0.05, 0, 0.2, 0)
langLabel.BackgroundTransparency = 1
langLabel.Text = "🌍 Язык:"
langLabel.TextColor3 = Color3.fromRGB(220, 230, 240)
langLabel.TextSize = 18
langLabel.Font = Enum.Font.SourceSansBold
langLabel.TextXAlignment = Enum.TextXAlignment.Left
langLabel.Parent = settingsArea

local langContainer = Instance.new("Frame")
langContainer.Size = UDim2.new(0.3, 0, 0.08, 0)
langContainer.Position = UDim2.new(0.25, 0, 0.2, 0)
langContainer.BackgroundTransparency = 1
langContainer.Parent = settingsArea

local langRu = Instance.new("TextButton")
langRu.Size = UDim2.new(0.45, 0, 1, 0)
langRu.Position = UDim2.new(0, 0, 0, 0)
langRu.BackgroundColor3 = Color3.fromRGB(22, 26, 34)
langRu.BackgroundTransparency = 0.1
langRu.Text = "🇷🇺 Рус"
langRu.TextColor3 = Color3.fromRGB(220, 230, 240)
langRu.TextSize = 16
langRu.Font = Enum.Font.SourceSansBold
langRu.Parent = langContainer

local langEn = Instance.new("TextButton")
langEn.Size = UDim2.new(0.45, 0, 1, 0)
langEn.Position = UDim2.new(0.55, 0, 0, 0)
langEn.BackgroundColor3 = Color3.fromRGB(22, 26, 34)
langEn.BackgroundTransparency = 0.1
langEn.Text = "🇬🇧 Eng"
langEn.TextColor3 = Color3.fromRGB(220, 230, 240)
langEn.TextSize = 16
langEn.Font = Enum.Font.SourceSansBold
langEn.Parent = langContainer

langRu.MouseButton1Click:Connect(function()
    currentLang = "ru"
    applyAllSettings()
    print("🌍 Язык: Русский")
end)

langEn.MouseButton1Click:Connect(function()
    currentLang = "en"
    applyAllSettings()
    print("🌍 Язык: English")
end)

-- ============================================================
--  ВОДЯНОЙ ЗНАК
-- ============================================================
local watermark = Instance.new("TextLabel")
watermark.Size = UDim2.new(1, 0, 0, 25)
watermark.Position = UDim2.new(0, 0, 0.95, 0)
watermark.BackgroundTransparency = 1
watermark.Text = "WERTIUM HUB | TORMENTOR412"
watermark.TextColor3 = Color3.fromRGB(100, 180, 255)
watermark.TextSize = 12
watermark.Font = Enum.Font.SourceSans
watermark.TextTransparency = 0.5
watermark.Parent = frame

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

print("✅ Wertium Hub загружен успешно!")
print("🔑 F1 - открыть/закрыть")
print("🌍 Язык по умолчанию: Русский")
