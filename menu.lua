-- ============================================================
--  MUSLIM MENU v14.4 - WORKING
--  by Tormentor412
-- ============================================================

print("🚀 Загрузка Muslim Menu v14.4...")

local player = game:GetService("Players").LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "MuslimMenu"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

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

-- КНОПКИ
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

local line = Instance.new("Frame")
line.Size = UDim2.new(0.9, 0, 0.002, 0)
line.Position = UDim2.new(0.05, 0, 0.8, 0)
line.BackgroundColor3 = Color3.fromRGB(100, 180, 255)
line.BackgroundTransparency = 0.5
line.Parent = infoContent

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
--  SETTINGS (ВИДИМЫЙ!)
-- ============================================================
local settingsContent = Instance.new("Frame")
settingsContent.Size = UDim2.new(1, 0, 1, 0)
settingsContent.BackgroundTransparency = 0.2
settingsContent.BackgroundColor3 = Color3.fromRGB(15, 15, 30)
settingsContent.Visible = false
settingsContent.Parent = contentContainer

-- РАМКА ДЛЯ ВИДИМОСТИ
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

local settingsText = Instance.new("TextLabel")
settingsText.Size = UDim2.new(1, 0, 0.5, 0)
settingsText.Position = UDim2.new(0, 0, 0.15, 0)
settingsText.BackgroundTransparency = 1
settingsText.Text = "🎨 Тема: MIDNIGHT\n\n🔲 Прозрачность: 5%\n\n🌍 Язык: Русский\n\n💾 Сохранить"
settingsText.TextColor3 = Color3.fromRGB(220, 230, 240)
settingsText.TextSize = 18
settingsText.Font = Enum.Font.SourceSans
settingsText.TextYAlignment = Enum.TextYAlignment.Top
settingsText.Parent = settingsContent

-- ============================================================
--  ПЕРЕКЛЮЧЕНИЕ
-- ============================================================
infoBtn.MouseButton1Click:Connect(function()
    infoContent.Visible = true
    settingsContent.Visible = false
    infoBtn.BackgroundColor3 = Color3.fromRGB(100, 180, 255)
    infoBtn.BackgroundTransparency = 0.15
    infoBtn.TextColor3 = Color3.fromRGB(10, 10, 14)
    settingsBtn.BackgroundColor3 = Color3.fromRGB(22, 26, 34)
    settingsBtn.BackgroundTransparency = 0.15
    settingsBtn.TextColor3 = Color3.fromRGB(220, 230, 240)
end)

settingsBtn.MouseButton1Click:Connect(function()
    infoContent.Visible = false
    settingsContent.Visible = true
    settingsBtn.BackgroundColor3 = Color3.fromRGB(100, 180, 255)
    settingsBtn.BackgroundTransparency = 0.15
    settingsBtn.TextColor3 = Color3.fromRGB(10, 10, 14)
    infoBtn.BackgroundColor3 = Color3.fromRGB(22, 26, 34)
    infoBtn.BackgroundTransparency = 0.15
    infoBtn.TextColor3 = Color3.fromRGB(220, 230, 240)
end)

-- ============================================================
--  F1
-- ============================================================
game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.F1 then
        frame.Visible = not frame.Visible
    end
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

print("✅ Muslim Menu v14.4 загружен успешно!")
print("🔑 F1 - открыть/закрыть")
