-- =====================================================
--              MUSLIM MENU v2.0
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
hello.TextColor3 = Color3.fromRGB(255, 215, 0) -- Золотой
hello.TextScaled = true
hello.Font = Enum.Font.SourceSansBold
hello.Parent = gui

game:GetService("TweenService"):Create(hello, TweenInfo.new(1.5, Enum.EasingStyle.Quad), {TextTransparency = 1}):Play()
game:GetService("Debris"):AddItem(hello, 1.5)

wait(1.5)

-- ===== ОСНОВНОЕ МЕНЮ С МЯГКИМИ УГЛАМИ =====
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 420, 0, 520)
frame.Position = UDim2.new(0.5, -210, 0.5, -260)
frame.BackgroundColor3 = Color3.fromRGB(0, 80, 40) -- Тёмно-зелёный
frame.BackgroundTransparency = 0.15
frame.BorderSizePixel = 0

-- СКРУГЛЕНИЕ УГЛОВ (мягкие углы)
local corners = Instance.new("UICorner")
corners.CornerRadius = UDim.new(0, 20) -- Радиус скругления 20
corners.Parent = frame

frame.Active = true
frame.Draggable = true
frame.Parent = gui

-- ===== ЗАГОЛОВОК =====
local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 50)
header.BackgroundColor3 = Color3.fromRGB(0, 120, 60)
header.BackgroundTransparency = 0
header.Parent = frame

local headerCorners = Instance.new("UICorner")
headerCorners.CornerRadius = UDim.new(0, 20)
headerCorners.Parent = header

local title = Instance.new("TextLabel")
title.Size = UDim2.new(0.7, 0, 1, 0)
title.Position = UDim2.new(0.05, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "☪️ MUSLIM MENU"
title.TextColor3 = Color3.fromRGB(255, 215, 0) -- Золотой
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
local function createToggle(yPos, labelText, defaultValue, callback)
    local container = Instance.new("Frame")
    container.Size = UDim2.new(0.9, 0, 0, 45)
    container.Position = UDim2.new(0.05, 0, yPos, 0)
    container.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    container.BackgroundTransparency = 0.1
    container.BorderSizePixel = 0
    container.Parent = frame

    local containerCorners = Instance.new("UICorner")
    containerCorners.CornerRadius = UDim.new(0, 10)
    containerCorners.Parent = container

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.7, 0, 1, 0)
    label.Position = UDim2.new(0.05, 0, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = labelText
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextSize = 18
    label.Font = Enum.Font.SourceSansBold
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = container

    local toggle = Instance.new("TextButton")
    toggle.Size = UDim2.new(0, 35, 0, 35)
    toggle.Position = UDim2.new(0.85, 0, 0.05, 0)
    toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    toggle.Text = defaultValue and "✅" or "⬜"
    toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
    toggle.TextSize = 22
    toggle.Font = Enum.Font.SourceSansBold
    toggle.Parent = container

    local toggleCorners = Instance.new("UICorner")
    toggleCorners.CornerRadius = UDim.new(0, 10)
    toggleCorners.Parent = toggle

    local state = defaultValue
    toggle.MouseButton1Click:Connect(function()
        state = not state
        toggle.Text = state and "✅" or "⬜"
        if callback then callback(state) end
    end)

    return {container, toggle}
end

-- ============================================================
-- ===== ESP (ПОДСВЕТКА ВСЕХ ИГРОКОВ) =====
-- ============================================================
local espHighlights = {}

local function toggleESP(state)
    if state then
        for _, plr in pairs(game:GetService("Players"):GetPlayers()) do
            if plr ~= player and plr.Character then
                local highlight = Instance.new("Highlight")
                highlight.Parent = plr.Character
                highlight.FillColor = Color3.fromRGB(255, 0, 0)
                highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
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

-- ============================================================
-- ===== ESP SURVIVORS (ЗЕЛЁНАЯ ПОДСВЕТКА) =====
-- ============================================================
local espSurvivorsHighlights = {}

local function toggleESPSurvivors(state)
    if state then
        for _, plr in pairs(game:GetService("Players"):GetPlayers()) do
            if plr ~= player and plr.Character then
                local highlight = Instance.new("Highlight")
                highlight.Parent = plr.Character
                highlight.FillColor = Color3.fromRGB(0, 255, 0) -- Зелёный
                highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                highlight.FillTransparency = 0.5
                table.insert(espSurvivorsHighlights, highlight)
            end
        end
    else
        for _, highlight in pairs(espSurvivorsHighlights) do
            if highlight and highlight.Parent then
                highlight:Destroy()
            end
        end
        espSurvivorsHighlights = {}
    end
end

-- ============================================================
-- ===== ESP KILLERS (СИНЯЯ ПОДСВЕТКА) =====
-- ============================================================
local espKillersHighlights = {}

local function toggleESPKillers(state)
    if state then
        for _, plr in pairs(game:GetService("Players"):GetPlayers()) do
            if plr ~= player and plr.Character then
                local highlight = Instance.new("Highlight")
                highlight.Parent = plr.Character
                highlight.FillColor = Color3.fromRGB(0, 100, 255) -- Синий
                highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                highlight.FillTransparency = 0.5
                table.insert(espKillersHighlights, highlight)
            end
        end
    else
        for _, highlight in pairs(espKillersHighlights) do
            if highlight and highlight.Parent then
                highlight:Destroy()
            end
        end
        espKillersHighlights = {}
    end
end

-- ============================================================
-- ===== SILENT AIM (РАБОЧАЯ ВЕРСИЯ) =====
-- ============================================================
local silentAimState = false
local silentAimConnection = nil

local function toggleSilentAim(state)
    silentAimState = state
    if silentAimState then
        print("🎯 Silent Aim включён!")
        if silentAimConnection then
            silentAimConnection:Disconnect()
            silentAimConnection = nil
        end
        silentAimConnection = game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
            if gameProcessed then return end
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                local target = nil
                local minDist = math.huge
                for _, plr in pairs(game:GetService("Players"):GetPlayers()) do
                    if plr ~= player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                        local dist = (plr.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
                        if dist < minDist then
                            minDist = dist
                            target = plr
                        end
                    end
                end
                if target then
                    print("🎯 Наведено на: " .. target.Name)
                    player.Character.HumanoidRootPart.CFrame = CFrame.new(player.Character.HumanoidRootPart.Position, target.Character.HumanoidRootPart.Position)
                else
                    print("🎯 Целей нет")
                end
            end
        end)
    else
        print("🎯 Silent Aim выключён!")
        if silentAimConnection then
            silentAimConnection:Disconnect()
            silentAimConnection = nil
        end
    end
end

-- ===== КНОПКИ =====
createToggle(0.14, "📡 ESP (подсветка игроков)", false, function(state) toggleESP(state) end)
createToggle(0.28, "🎯 Silent Aim (авто-прицел)", false, function(state) toggleSilentAim(state) end)
createToggle(0.42, "🟢 ESP Survivors (зелёный)", false, function(state) toggleESPSurvivors(state) end)
createToggle(0.56, "🔵 ESP Killers (синий)", false, function(state) toggleESPKillers(state) end)

-- ===== КНОПКА ПЕРЕЗАПУСКА =====
local restartBtn = Instance.new("TextButton")
restartBtn.Size = UDim2.new(0.4, 0, 0, 40)
restartBtn.Position = UDim2.new(0.3, 0, 0.74, 0)
restartBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
restartBtn.BackgroundTransparency = 0.2
restartBtn.Text = "🔄 Перезапустить"
restartBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
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

-- ===== ВОДЯНОЙ ЗНАК =====
local watermark = Instance.new("TextLabel")
watermark.Size = UDim2.new(0, 220, 0, 25)
watermark.Position = UDim2.new(0, 10, 1, -35)
watermark.BackgroundTransparency = 1
watermark.Text = "👑 Tormentor412 Owner"
watermark.TextColor3 = Color3.fromRGB(255, 215, 0) -- Золотой
watermark.TextSize = 16
watermark.Font = Enum.Font.SourceSansBold
watermark.TextXAlignment = Enum.TextXAlignment.Left
watermark.Parent = gui

print("✅ Muslim Menu v2.0 загружено! Приятной игры!")
