-- =====================================================
--              MUSLIM MENU v3.1
--                by Tormentor412
-- =====================================================

print("Загрузка Muslim Menu...")

local player = game:GetService("Players").LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "MuslimMenu"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- ===== ПРИВЕТСТВИЕ "Hello!" =====
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

-- ===== ОСНОВНОЕ МЕНЮ =====
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 400, 0, 480)
frame.Position = UDim2.new(0.5, -200, 0.5, -240)
frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
frame.BackgroundTransparency = 0
frame.BorderSizePixel = 2
frame.BorderColor3 = Color3.fromRGB(255, 215, 0)

local corners = Instance.new("UICorner")
corners.CornerRadius = UDim.new(0, 20)
corners.Parent = frame

frame.Active = true
frame.Draggable = true
frame.Parent = gui

-- ===== ЗАГОЛОВОК =====
local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 50)
header.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
header.BackgroundTransparency = 0
header.Parent = frame

local headerCorners = Instance.new("UICorner")
headerCorners.CornerRadius = UDim.new(0, 20)
headerCorners.Parent = header

local title = Instance.new("TextLabel")
title.Size = UDim2.new(0.7, 0, 1, 0)
title.Position = UDim2.new(0.05, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "✦ MUSLIM MENU ✦"
title.TextColor3 = Color3.fromRGB(255, 215, 0)
title.TextSize = 22
title.Font = Enum.Font.SourceSansBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = header

-- Кнопка закрыть
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 35, 1, -6)
closeBtn.Position = UDim2.new(0.92, 0, 0, 3)
closeBtn.BackgroundColor3 = Color3.fromRGB(180, 30, 30)
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.TextSize = 22
closeBtn.Font = Enum.Font.SourceSansBold
closeBtn.Parent = header

local closeCorners = Instance.new("UICorner")
closeCorners.CornerRadius = UDim.new(0, 8)
closeCorners.Parent = closeBtn

closeBtn.MouseButton1Click:Connect(function() frame.Visible = false end)

-- Кнопка удалить
local deleteBtn = Instance.new("TextButton")
deleteBtn.Size = UDim2.new(0, 35, 1, -6)
deleteBtn.Position = UDim2.new(0.85, 0, 0, 3)
deleteBtn.BackgroundColor3 = Color3.fromRGB(200, 100, 30)
deleteBtn.Text = "🗑"
deleteBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
deleteBtn.TextSize = 18
deleteBtn.Font = Enum.Font.SourceSansBold
deleteBtn.Parent = header

local deleteCorners = Instance.new("UICorner")
deleteCorners.CornerRadius = UDim.new(0, 8)
deleteCorners.Parent = deleteBtn

deleteBtn.MouseButton1Click:Connect(function() gui:Destroy() end)

-- ===== ФУНКЦИЯ КНОПОК-ГАЛОЧЕК =====
local function createToggle(yPos, labelText, icon, defaultValue, callback)
    local container = Instance.new("Frame")
    container.Size = UDim2.new(0.9, 0, 0, 45)
    container.Position = UDim2.new(0.05, 0, yPos, 0)
    container.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    container.BackgroundTransparency = 0
    container.BorderSizePixel = 1
    container.BorderColor3 = Color3.fromRGB(60, 60, 60)
    container.Parent = frame

    local containerCorners = Instance.new("UICorner")
    containerCorners.CornerRadius = UDim.new(0, 10)
    containerCorners.Parent = container

    local iconLabel = Instance.new("TextLabel")
    iconLabel.Size = UDim2.new(0, 30, 1, 0)
    iconLabel.Position = UDim2.new(0.02, 0, 0, 0)
    iconLabel.BackgroundTransparency = 1
    iconLabel.Text = icon
    iconLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
    iconLabel.TextSize = 20
    iconLabel.Font = Enum.Font.SourceSansBold
    iconLabel.Parent = container

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.65, 0, 1, 0)
    label.Position = UDim2.new(0.12, 0, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = labelText
    label.TextColor3 = Color3.fromRGB(220, 220, 220)
    label.TextSize = 17
    label.Font = Enum.Font.SourceSansBold
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = container

    local toggle = Instance.new("TextButton")
    toggle.Size = UDim2.new(0, 35, 0, 35)
    toggle.Position = UDim2.new(0.85, 0, 0.05, 0)
    toggle.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    toggle.Text = defaultValue and "✦" or "○"
    toggle.TextColor3 = defaultValue and Color3.fromRGB(255, 215, 0) or Color3.fromRGB(150, 150, 150)
    toggle.TextSize = 24
    toggle.Font = Enum.Font.SourceSansBold
    toggle.Parent = container

    local toggleCorners = Instance.new("UICorner")
    toggleCorners.CornerRadius = UDim.new(0, 8)
    toggleCorners.Parent = toggle

    local state = defaultValue
    toggle.MouseButton1Click:Connect(function()
        state = not state
        toggle.Text = state and "✦" or "○"
        toggle.TextColor3 = state and Color3.fromRGB(255, 215, 0) or Color3.fromRGB(150, 150, 150)
        if callback then callback(state) end
    end)

    return {container, toggle}
end

-- ===== ESP (ПОДСВЕТКА) =====
local espHighlights = {}

local function toggleESP(state)
    if state then
        for _, plr in pairs(game:GetService("Players"):GetPlayers()) do
            if plr ~= player and plr.Character then
                local highlight = Instance.new("Highlight")
                highlight.Parent = plr.Character
                highlight.FillColor = Color3.fromRGB(255, 50, 50)
                highlight.OutlineColor = Color3.fromRGB(255, 215, 0)
                highlight.FillTransparency = 0.5
                table.insert(espHighlights, highlight)
            end
        end
    else
        for _, highlight in pairs(espHighlights) do
            if highlight and highlight.Parent then
                highlight:Destroy()
            end
        end
        espHighlights = {}
    end
end

-- ===== КНОПКА ESP =====
createToggle(0.14, "ESP (подсветка)", "◈", false, function(state) toggleESP(state) end)

-- ===== КНОПКА ПЕРЕЗАПУСКА =====
local restartBtn = Instance.new("TextButton")
restartBtn.Size = UDim2.new(0.4, 0, 0, 40)
restartBtn.Position = UDim2.new(0.3, 0, 0.38, 0)
restartBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
restartBtn.BackgroundTransparency = 0
restartBtn.Text = "⟳ Перезапустить"
restartBtn.TextColor3 = Color3.fromRGB(255, 215, 0)
restartBtn.TextSize = 18
restartBtn.Font = Enum.Font.SourceSansBold
restartBtn.Parent = frame

local restartCorners = Instance.new("UICorner")
restartCorners.CornerRadius = UDim.new(0, 12)
restartCorners.Parent = restartBtn

restartBtn.MouseButton1Click:Connect(function()
    frame.Visible = false
    wait(0.5)
    frame.Visible = true
end)

-- ===== НИК ВНУТРИ МЕНЮ (ЛЕВЫЙ НИЖНИЙ УГОЛ) =====
local watermark = Instance.new("TextLabel")
watermark.Size = UDim2.new(0.8, 0, 0, 30)
watermark.Position = UDim2.new(0.05, 0, 0.85, 0) -- Внутри меню
watermark.BackgroundTransparency = 1
watermark.Text = "◆ Tormentor412"
watermark.TextColor3 = Color3.fromRGB(255, 215, 0)
watermark.TextSize = 16
watermark.Font = Enum.Font.SourceSansBold
watermark.TextXAlignment = Enum.TextXAlignment.Left
watermark.Parent = frame -- ВАЖНО: frame, а не gui!

print("✅ Muslim Menu v3.1 загружено!")
