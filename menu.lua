-- ============================================================
--  WERTIUM HUB - EMPTY MENU (ready for content)
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
--  ОСНОВНОЕ МЕНЮ (ПУСТОЕ)
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
    crosshairContainer2.Rotation = math.deg(-angle)
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

print("✅ Wertium Hub (empty) загружен успешно!")
print("🔑 F1 - открыть/закрыть")
