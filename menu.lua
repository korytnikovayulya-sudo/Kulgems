-- ============================================================
--  ТЕСТ: ПРОСТОЙ КВАДРАТ С ПРИЦЕЛОМ
-- ============================================================

print("🚀 ТЕСТОВЫЙ КВАДРАТ ЗАГРУЖЕН!")

local player = game:GetService("Players").LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "TestSquare"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- ПРИВЕТСТВИЕ
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

-- ============================================================
--  СОЗДАЁМ КВАДРАТ
-- ============================================================
local size = 150
local square = Instance.new("Frame")
square.Size = UDim2.new(0, size, 0, size)
square.Position = UDim2.new(0.5, -size/2, 0.5, -size/2)
square.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
square.BackgroundTransparency = 0
square.BorderSizePixel = 2
square.BorderColor3 = Color3.fromRGB(255, 50, 50)
square.ZIndex = 999
square.Active = true
square.Parent = gui

local corners = Instance.new("UICorner")
corners.CornerRadius = UDim.new(0, 12)
corners.Parent = square

-- ПРИЦЕЛ
local crosshair = Instance.new("Frame")
crosshair.Size = UDim2.new(0, size * 0.5, 0, size * 0.5)
crosshair.Position = UDim2.new(0.5, -size * 0.25, 0.35, -size * 0.25)
crosshair.BackgroundTransparency = 1
crosshair.Parent = square

-- КРУГ
local circle = Instance.new("Frame")
circle.Size = UDim2.new(1, 0, 1, 0)
circle.BackgroundTransparency = 1
circle.BorderSizePixel = 2
circle.BorderColor3 = Color3.fromRGB(255, 255, 255)
circle.Parent = crosshair
local circleCorners = Instance.new("UICorner")
circleCorners.CornerRadius = UDim.new(1, 0)
circleCorners.Parent = circle

-- ГОРИЗОНТАЛЬНАЯ ЛИНИЯ
local hLine = Instance.new("Frame")
hLine.Size = UDim2.new(0.8, 0, 0.08, 0)
hLine.Position = UDim2.new(0.1, 0, 0.46, 0)
hLine.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
hLine.BackgroundTransparency = 0.3
hLine.BorderSizePixel = 0
hLine.Parent = crosshair

-- ВЕРТИКАЛЬНАЯ ЛИНИЯ
local vLine = Instance.new("Frame")
vLine.Size = UDim2.new(0.08, 0, 0.8, 0)
vLine.Position = UDim2.new(0.46, 0, 0.1, 0)
vLine.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
vLine.BackgroundTransparency = 0.3
vLine.BorderSizePixel = 0
vLine.Parent = crosshair

-- ТОЧКА
local dot = Instance.new("Frame")
dot.Size = UDim2.new(0.15, 0, 0.15, 0)
dot.Position = UDim2.new(0.425, 0, 0.425, 0)
dot.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
dot.BackgroundTransparency = 0.2
dot.BorderSizePixel = 0
dot.Parent = crosshair
local dotCorners = Instance.new("UICorner")
dotCorners.CornerRadius = UDim.new(1, 0)
dotCorners.Parent = dot

-- НАДПИСЬ SHOOT
local label = Instance.new("TextLabel")
label.Size = UDim2.new(1, 0, 0.2, 0)
label.Position = UDim2.new(0, 0, 0.78, 0)
label.BackgroundTransparency = 1
label.Text = "SHOOT"
label.TextColor3 = Color3.fromRGB(255, 50, 50)
label.TextSize = size * 0.14
label.Font = Enum.Font.GothamBold
label.TextXAlignment = Enum.TextXAlignment.Center
label.Parent = square

print("✅ КВАДРАТ СОЗДАН!")

-- ============================================================
--  АНИМАЦИЯ ПРИЦЕЛА
-- ============================================================
local angle = 0
game:GetService("RunService").RenderStepped:Connect(function()
    if crosshair and crosshair.Parent then
        angle = angle + 0.04
        crosshair.Rotation = math.deg(angle)
    end
end)

-- ============================================================
--  ПЕРЕТАСКИВАНИЕ
-- ============================================================
local isDragging = false
local dragOffset = nil

local function onInputBegan(input, gameProcessed)
    if gameProcessed then return end
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        local mousePos = Vector2.new(input.Position.X, input.Position.Y)
        local framePos = Vector2.new(square.AbsolutePosition.X, square.AbsolutePosition.Y)
        local frameSize = Vector2.new(square.AbsoluteSize.X, square.AbsoluteSize.Y)
        
        if mousePos.X >= framePos.X and mousePos.X <= framePos.X + frameSize.X and
           mousePos.Y >= framePos.Y and mousePos.Y <= framePos.Y + frameSize.Y then
            print("🔫 КЛИК ПО КВАДРАТУ!")
            return
        end
        
        isDragging = true
        dragOffset = mousePos - framePos
    end
end

local function onInputChanged(input, gameProcessed)
    if gameProcessed then return end
    if input.UserInputType == Enum.UserInputType.MouseMovement and isDragging then
        local mousePos = Vector2.new(input.Position.X, input.Position.Y)
        local newPos = mousePos - dragOffset
        local parentSize = gui.AbsoluteSize
        local frameSize = Vector2.new(square.AbsoluteSize.X, square.AbsoluteSize.Y)
        
        newPos = Vector2.new(
            math.clamp(newPos.X, 0, parentSize.X - frameSize.X),
            math.clamp(newPos.Y, 0, parentSize.Y - frameSize.Y)
        )
        square.Position = UDim2.new(0, newPos.X, 0, newPos.Y)
    end
end

local function onInputEnded(input, gameProcessed)
    if gameProcessed then return end
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        isDragging = false
    end
end

game:GetService("UserInputService").InputBegan:Connect(onInputBegan)
game:GetService("UserInputService").InputChanged:Connect(onInputChanged)
game:GetService("UserInputService").InputEnded:Connect(onInputEnded)

print("✅ ТЕСТОВЫЙ КВАДРАТ ГОТОВ!")
print("🖱️ Перетащи его мышкой!")
