-- ============================================================
--  WERTIUM HUB - КРАСНОЕ МЕНЮ С БЕЛОЙ ПОДСВЕТКОЙ
-- ============================================================

print("🚀 Загрузка...")

local player = game:GetService("Players").LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "WertiumHub"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- ПРИВЕТСТВИЕ HELLO
local hello = Instance.new("TextLabel")
hello.Size = UDim2.new(1, 0, 1, 0)
hello.BackgroundTransparency = 1
hello.Text = "HELLO"
hello.TextColor3 = Color3.fromRGB(255, 215, 0)
hello.TextScaled = true
hello.Font = Enum.Font.GothamBold
hello.Parent = gui

game:GetService("TweenService"):Create(hello, TweenInfo.new(1.5, Enum.EasingStyle.Quad), {TextTransparency = 1}):Play()
game:GetService("Debris"):AddItem(hello, 1.5)

wait(1.5)

-- ОСНОВНОЕ ОКНО (КРАСНОЕ)
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 600, 0, 400)
frame.Position = UDim2.new(0.5, -300, 0.5, -200)
frame.BackgroundColor3 = Color3.fromRGB(140, 20, 20)  -- КРАСНЫЙ
frame.BackgroundTransparency = 0.05
frame.BorderSizePixel = 2
frame.BorderColor3 = Color3.fromRGB(200, 50, 50)      -- РАМКА ТОЖЕ КРАСНАЯ
frame.Active = true
frame.Draggable = true
frame.ClipsDescendants = true
frame.Parent = gui

-- МЯГКИЕ УГЛЫ
local corners = Instance.new("UICorner")
corners.CornerRadius = UDim.new(0, 20)
corners.Parent = frame

-- БЕЛАЯ ЗАМЕТНАЯ ПОДСВЕТКА
local stroke = Instance.new("UIStroke")
stroke.Thickness = 4
stroke.Color = Color3.fromRGB(255, 255, 255)
stroke.Transparency = 0.1   -- ПОЧТИ НЕПРОЗРАЧНАЯ
stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
stroke.Parent = frame

-- ЗАГОЛОВОК
local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 70)
header.BackgroundColor3 = Color3.fromRGB(120, 15, 15)  -- ТЕМНЕЕ КРАСНЫЙ
header.BackgroundTransparency = 0.15
header.Parent = frame

local headerCorners = Instance.new("UICorner")
headerCorners.CornerRadius = UDim.new(0, 20)
headerCorners.Parent = header

-- ЛЕВЫЙ ПРИЦЕЛ (ГОЛУБОЙ)
local crosshairL = Instance.new("Frame")
crosshairL.Size = UDim2.new(0, 40, 0.8, 0)
crosshairL.Position = UDim2.new(0.02, 0, 0.1, 0)
crosshairL.BackgroundTransparency = 1
crosshairL.Parent = header

local circleL = Instance.new("Frame")
circleL.Size = UDim2.new(1, 0, 1, 0)
circleL.BackgroundTransparency = 1
circleL.BorderSizePixel = 2
circleL.BorderColor3 = Color3.fromRGB(100, 200, 255)   -- ГОЛУБОЙ
circleL.Parent = crosshairL
local circleLc = Instance.new("UICorner")
circleLc.CornerRadius = UDim.new(1, 0)
circleLc.Parent = circleL

local hL = Instance.new("Frame")
hL.Size = UDim2.new(0.8, 0, 0.08, 0)
hL.Position = UDim2.new(0.1, 0, 0.46, 0)
hL.BackgroundColor3 = Color3.fromRGB(100, 200, 255)
hL.BackgroundTransparency = 0.3
hL.BorderSizePixel = 0
hL.Parent = crosshairL

local vL = Instance.new("Frame")
vL.Size = UDim2.new(0.08, 0, 0.8, 0)
vL.Position = UDim2.new(0.46, 0, 0.1, 0)
vL.BackgroundColor3 = Color3.fromRGB(100, 200, 255)
vL.BackgroundTransparency = 0.3
vL.BorderSizePixel = 0
vL.Parent = crosshairL

local dotL = Instance.new("Frame")
dotL.Size = UDim2.new(0.15, 0, 0.15, 0)
dotL.Position = UDim2.new(0.425, 0, 0.425, 0)
dotL.BackgroundColor3 = Color3.fromRGB(100, 200, 255)
dotL.BackgroundTransparency = 0.2
dotL.BorderSizePixel = 0
dotL.Parent = crosshairL
local dotLc = Instance.new("UICorner")
dotLc.CornerRadius = UDim.new(1, 0)
dotLc.Parent = dotL

-- ПРАВЫЙ ПРИЦЕЛ (ГОЛУБОЙ)
local crosshairR = Instance.new("Frame")
crosshairR.Size = UDim2.new(0, 40, 0.8, 0)
crosshairR.Position = UDim2.new(0.88, 0, 0.1, 0)
crosshairR.BackgroundTransparency = 1
crosshairR.Parent = header

local circleR = Instance.new("Frame")
circleR.Size = UDim2.new(1, 0, 1, 0)
circleR.BackgroundTransparency = 1
circleR.BorderSizePixel = 2
circleR.BorderColor3 = Color3.fromRGB(100, 200, 255)
circleR.Parent = crosshairR
local circleRc = Instance.new("UICorner")
circleRc.CornerRadius = UDim.new(1, 0)
circleRc.Parent = circleR

local hR = Instance.new("Frame")
hR.Size = UDim2.new(0.8, 0, 0.08, 0)
hR.Position = UDim2.new(0.1, 0, 0.46, 0)
hR.BackgroundColor3 = Color3.fromRGB(100, 200, 255)
hR.BackgroundTransparency = 0.3
hR.BorderSizePixel = 0
hR.Parent = crosshairR

local vR = Instance.new("Frame")
vR.Size = UDim2.new(0.08, 0, 0.8, 0)
vR.Position = UDim2.new(0.46, 0, 0.1, 0)
vR.BackgroundColor3 = Color3.fromRGB(100, 200, 255)
vR.BackgroundTransparency = 0.3
vR.BorderSizePixel = 0
vR.Parent = crosshairR

local dotR = Instance.new("Frame")
dotR.Size = UDim2.new(0.15, 0, 0.15, 0)
dotR.Position = UDim2.new(0.425, 0, 0.425, 0)
dotR.BackgroundColor3 = Color3.fromRGB(100, 200, 255)
dotR.BackgroundTransparency = 0.2
dotR.BorderSizePixel = 0
dotR.Parent = crosshairR
local dotRc = Instance.new("UICorner")
dotRc.CornerRadius = UDim.new(1, 0)
dotRc.Parent = dotR

-- АНИМАЦИЯ ПРИЦЕЛОВ
local angle2 = 0
game:GetService("RunService").RenderStepped:Connect(function()
    angle2 = angle2 + 0.03
    crosshairL.Rotation = math.deg(angle2)
    crosshairR.Rotation = math.deg(-angle2)
end)

-- НАЗВАНИЕ
local title = Instance.new("TextLabel")
title.Size = UDim2.new(0.5, 0, 1, 0)
title.Position = UDim2.new(0.25, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "WERTIUM HUB"
title.TextColor3 = Color3.fromRGB(255, 255, 255)   -- БЕЛЫЙ ТЕКСТ
title.TextSize = 34
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Center
title.Parent = header

-- КНОПКА ЗАКРЫТИЯ
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(0.95, 0, 0.5, -15)
closeBtn.BackgroundColor3 = Color3.fromRGB(200, 40, 40)
closeBtn.BackgroundTransparency = 0.1
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.TextSize = 18
closeBtn.Font = Enum.Font.SourceSansBold
closeBtn.Parent = header

closeBtn.MouseButton1Click:Connect(function()
    frame.Visible = false
end)

-- ВОДЯНОЙ ЗНАК
local watermark = Instance.new("TextLabel")
watermark.Size = UDim2.new(1, 0, 0, 25)
watermark.Position = UDim2.new(0, 0, 0.95, 0)
watermark.BackgroundTransparency = 1
watermark.Text = "WERTIUM HUB | TORMENTOR412"
watermark.TextColor3 = Color3.fromRGB(200, 200, 200)
watermark.TextSize = 12
watermark.Font = Enum.Font.SourceSans
watermark.TextTransparency = 0.5
watermark.Parent = frame

-- ХОТКЕЙ F1
game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.F1 then
        frame.Visible = not frame.Visible
    end
end)

print("✅ Красное меню с белой подсветкой и голубыми прицелами загружено!")
print("🔑 F1 - открыть/закрыть")
