-- ============================================================
--  MUSLIM MENU v13.9 - INFO ONLY
--  by Tormentor412
-- ============================================================

print("🚀 Загрузка Muslim Menu v13.9...")

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
versionBadge.Text = "v13.9"
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
--  ВКЛАДКА INFO (ТОЛЬКО ОНА)
-- ============================================================
local tabContainer = Instance.new("Frame")
tabContainer.Size = UDim2.new(0, 100, 1, -50)
tabContainer.Position = UDim2.new(0, 0, 0, 50)
tabContainer.BackgroundColor3 = THEMES[currentTheme].btn
tabContainer.BackgroundTransparency = 0.15
tabContainer.BorderSizePixel = 0
tabContainer.Parent = frame

local contentContainer = Instance.new("Frame")
contentContainer.Size = UDim2.new(1, -100, 1, -50)
contentContainer.Position = UDim2.new(0, 100, 0, 50)
contentContainer.BackgroundTransparency = 1
contentContainer.Parent = frame

-- Кнопка INFO (только одна)
local infoBtn = Instance.new("TextButton")
infoBtn.Size = UDim2.new(1, 0, 0, 40)
infoBtn.Position = UDim2.new(0, 0, 0, 0)
infoBtn.BackgroundColor3 = THEMES[currentTheme].accent
infoBtn.BackgroundTransparency = 0.15
infoBtn.Text = "INFO"
infoBtn.TextColor3 = THEMES[currentTheme].main
infoBtn.TextSize = 14
infoBtn.Font = Enum.Font.SourceSansBold
infoBtn.Parent = tabContainer

local infoBtnCorners = Instance.new("UICorner")
infoBtnCorners.CornerRadius = UDim.new(0, 0)
infoBtnCorners.Parent = infoBtn

-- ============================================================
--  КОНТЕНТ INFO
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
--  ВОДЯНОЙ ЗНАК
-- ============================================================
local watermark = Instance.new("TextLabel")
watermark.Name = "Watermark"
watermark.Size = UDim2.new(1, 0, 0, 20)
watermark.Position = UDim2.new(0, 0, 0.97, 0)
watermark.BackgroundTransparency = 1
watermark.Text = "MUSLIM MENU v13.9 | TORMENTOR412"
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
print("✅ Muslim Menu v13.9 загружен успешно!")
print("🔑 F1 - открыть/закрыть")
print("🔑 M - открыть/закрыть (когда меню скрыто)")
