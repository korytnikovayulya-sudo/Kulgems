-- =====================================================
--              ПРЕМИУМ МЕНЮ ДЛЯ ДЕЛЬТЫ
--                by Tormentor412
-- =====================================================

print("Загрузка премиум меню...")

local player = game:GetService("Players").LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "PremiumMenu"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- ===== ПРИВЕТСТВИЕ =====
local hello = Instance.new("TextLabel")
hello.Size = UDim2.new(1, 0, 1, 0)
hello.BackgroundTransparency = 1
hello.Text = "Hello!"
hello.TextColor3 = Color3.fromRGB(255, 255, 255)
hello.TextScaled = true
hello.Font = Enum.Font.SourceSansBold
hello.Parent = gui

game:GetService("TweenService"):Create(hello, TweenInfo.new(1.5, Enum.EasingStyle.Quad), {TextTransparency = 1}):Play()
game:GetService("Debris"):AddItem(hello, 1.5)

wait(1.5)

-- ===== ОСНОВНОЕ МЕНЮ =====
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 400, 0, 500)
frame.Position = UDim2.new(0.5, -200, 0.5, -250)
frame.BackgroundColor3 = Color3.fromRGB(0, 100, 255)
frame.BackgroundTransparency = 0.3
frame.BorderSizePixel = 2
frame.BorderColor3 = Color3.fromRGB(255, 255, 255)
frame.Active = true
frame.Draggable = true
frame.Parent = gui

-- ===== ЗАГОЛОВОК =====
local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 40)
header.BackgroundColor3 = Color3.fromRGB(0, 80, 200)
header.BackgroundTransparency = 0
header.Parent = frame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(0.6, 0, 1, 0)
title.Position = UDim2.new(0.05, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "🔷 PREMIUM MENU"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 20
title.Font = Enum.Font.SourceSansBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = header

-- Кнопка закрыть
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 30, 1, -4)
closeBtn.Position = UDim2.new(0.92, 0, 0, 2)
closeBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.TextSize = 20
closeBtn.Font = Enum.Font.SourceSansBold
closeBtn.Parent = header
closeBtn.MouseButton1Click:Connect(function() frame.Visible = false end)

-- Кнопка удалить
local deleteBtn = Instance.new("TextButton")
deleteBtn.Size = UDim2.new(0, 30, 1, -4)
deleteBtn.Position = UDim2.new(0.85, 0, 0, 2)
deleteBtn.BackgroundColor3 = Color3.fromRGB(200, 100, 50)
deleteBtn.Text = "🗑"
deleteBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
deleteBtn.TextSize = 18
deleteBtn.Font = Enum.Font.SourceSansBold
deleteBtn.Parent = header
deleteBtn.MouseButton1Click:Connect(function() gui:Destroy() end)

-- ===== ФУНКЦИЯ СОЗДАНИЯ КНОПОК =====
local function createToggle(yPos, labelText, defaultValue, callback)
    local container = Instance.new("Frame")
    container.Size = UDim2.new(0.9, 0, 0, 40)
    container.Position = UDim2.new(0.05, 0, yPos, 0)
    container.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    container.BackgroundTransparency = 0.1
    container.BorderSizePixel = 0
    container.Parent = frame

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
    toggle.Size = UDim2.new(0, 30, 0, 30)
    toggle.Position = UDim2.new(0.85, 0, 0.05, 0)
    toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    toggle.Text = defaultValue and "✅" or "⬜"
    toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
    toggle.TextSize = 20
    toggle.Font = Enum.Font.SourceSansBold
    toggle.Parent = container

    local state = defaultValue
    toggle.MouseButton1Click:Connect(function()
        state = not state
        toggle.Text = state and "✅" or "⬜"
        if callback then callback(state) end
    end)

    return {container, toggle}
end

-- ============================================================
-- ===== РАБОТАЮЩИЙ ESP (ПОДСВЕТКА ИГРОКОВ) =====
-- ============================================================
local espHighlights = {}

local function toggleESP(state)
    if state then
        -- Включаем подсветку для всех игроков
        for _, plr in pairs(game:GetService("Players"):GetPlayers()) do
            if plr ~= player and plr.Character then
                local highlight = Instance.new("Highlight")
                highlight.Parent = plr.Character
                highlight.FillColor = Color3.fromRGB(255, 0, 0) -- Красный цвет
                highlight.OutlineColor = Color3.fromRGB(255, 255, 255) -- Белая обводка
                highlight.FillTransparency = 0.5
                table.insert(espHighlights, highlight)
            end
        end
    else
        -- Удаляем всю подсветку
        for _, highlight in pairs(espHighlights) do
            if highlight and highlight.Parent then
                highlight:Destroy()
            end
        end
        espHighlights = {}
    end
end

-- ============================================================
-- ===== ОСНОВНАЯ ЛОГИКА SILENT AIM (ДЛЯ ПРИМЕРА) =====
-- ============================================================
local silentAimState = false

local function toggleSilentAim(state)
    silentAimState = state
    if silentAimState then
        print("🎯 Silent Aim включен!")
        -- Подключаем обработчик нажатия мыши (это просто демонстрация)
        local connection
        connection = game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
            if gameProcessed then return end
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                -- Ищем ближайшего игрока
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
                    print("🎯 Silent Aim навелся на игрока: " .. target.Name)
                    -- В рабочем варианте здесь код, который поворачивает камеру игрока на цель
                else
                    print("🎯 Целей поблизости нет")
                end
            end
        end)
        -- Сохраняем соединение, чтобы отключить его позже
        getgenv().silentAimConnection = connection
    else
        print("🎯 Silent Aim выключен!")
        if getgenv().silentAimConnection then
            getgenv().silentAimConnection:Disconnect()
            getgenv().silentAimConnection = nil
        end
    end
end

-- ===== КНОПКИ С ФУНКЦИЯМИ =====
createToggle(0.12, "📡 ESP (подсветка игроков)", false, function(state)
    toggleESP(state)
end)

createToggle(0.25, "🎯 Silent Aim (авто-прицел)", false, function(state)
    toggleSilentAim(state)
end)

createToggle(0.38, "👤 ESP Survivors", false, function(state)
    print("👤 ESP Survivors: " .. (state and "Включён" or "Выключён"))
    -- Здесь можно добавить логику для Survivors
end)

createToggle(0.51, "👹 ESP Killers", false, function(state)
    print("👹 ESP Killers: " .. (state and "Включён" or "Выключён"))
    -- Здесь можно добавить логику для Killers
end)

-- ===== КНОПКА ПЕРЕЗАПУСКА =====
local restartBtn = Instance.new("TextButton")
restartBtn.Size = UDim2.new(0.3, 0, 0, 35)
restartBtn.Position = UDim2.new(0.35, 0, 0.68, 0)
restartBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
restartBtn.BackgroundTransparency = 0.2
restartBtn.Text = "🔄 Перезапустить"
restartBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
restartBtn.TextSize = 16
restartBtn.Font = Enum.Font.SourceSansBold
restartBtn.Parent = frame

restartBtn.MouseButton1Click:Connect(function()
    frame.Visible = false
    wait(0.5)
    frame.Visible = true
end)

-- ===== ВОДЯНОЙ ЗНАК =====
local watermark = Instance.new("TextLabel")
watermark.Size = UDim2.new(0, 200, 0, 20)
watermark.Position = UDim2.new(0, 10, 1, -30)
watermark.BackgroundTransparency = 1
watermark.Text = "👑 Tormentor412 Owner"
watermark.TextColor3 = Color3.fromRGB(255, 255, 255)
watermark.TextSize = 14
watermark.Font = Enum.Font.SourceSansBold
watermark.TextXAlignment = Enum.TextXAlignment.Left
watermark.Parent = gui

print("✅ Премиум меню загружено! Приятной игры!")
