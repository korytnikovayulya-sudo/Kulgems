-- ============================================================
--  WERTIUM HUB - С ESP
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

-- ОСНОВНОЕ ОКНО (БОЛЬШОЕ, КРАСНОЕ)
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 800, 0, 500)
frame.Position = UDim2.new(0.5, -400, 0.5, -250)
frame.BackgroundColor3 = Color3.fromRGB(140, 20, 20)
frame.BackgroundTransparency = 0.05
frame.BorderSizePixel = 2
frame.BorderColor3 = Color3.fromRGB(200, 50, 50)
frame.Active = true
frame.Draggable = true
frame.ClipsDescendants = true
frame.Parent = gui

-- УГЛЫ
local corners = Instance.new("UICorner")
corners.CornerRadius = UDim.new(0, 20)
corners.Parent = frame

-- БЕЛАЯ ПОДСВЕТКА
local stroke = Instance.new("UIStroke")
stroke.Thickness = 4
stroke.Color = Color3.fromRGB(255, 255, 255)
stroke.Transparency = 0.1
stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
stroke.Parent = frame

-- ЗАГОЛОВОК
local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 90)
header.BackgroundColor3 = Color3.fromRGB(120, 15, 15)
header.BackgroundTransparency = 0.15
header.Parent = frame

local headerCorners = Instance.new("UICorner")
headerCorners.CornerRadius = UDim.new(0, 20)
headerCorners.Parent = header

-- ЛЕВЫЙ ПРИЦЕЛ (ЧЁРНЫЙ)
local crosshairL = Instance.new("Frame")
crosshairL.Size = UDim2.new(0, 45, 0.6, 0)
crosshairL.Position = UDim2.new(0.02, 0, 0.2, 0)
crosshairL.BackgroundTransparency = 1
crosshairL.Parent = header

local circleL = Instance.new("Frame")
circleL.Size = UDim2.new(1, 0, 1, 0)
circleL.BackgroundTransparency = 1
circleL.BorderSizePixel = 2
circleL.BorderColor3 = Color3.fromRGB(0, 0, 0)
circleL.Parent = crosshairL
local circleLc = Instance.new("UICorner")
circleLc.CornerRadius = UDim.new(1, 0)
circleLc.Parent = circleL

local hL = Instance.new("Frame")
hL.Size = UDim2.new(0.8, 0, 0.08, 0)
hL.Position = UDim2.new(0.1, 0, 0.46, 0)
hL.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
hL.BackgroundTransparency = 0.3
hL.BorderSizePixel = 0
hL.Parent = crosshairL

local vL = Instance.new("Frame")
vL.Size = UDim2.new(0.08, 0, 0.8, 0)
vL.Position = UDim2.new(0.46, 0, 0.1, 0)
vL.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
vL.BackgroundTransparency = 0.3
vL.BorderSizePixel = 0
vL.Parent = crosshairL

local dotL = Instance.new("Frame")
dotL.Size = UDim2.new(0.15, 0, 0.15, 0)
dotL.Position = UDim2.new(0.425, 0, 0.425, 0)
dotL.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
dotL.BackgroundTransparency = 0.2
dotL.BorderSizePixel = 0
dotL.Parent = crosshairL
local dotLc = Instance.new("UICorner")
dotLc.CornerRadius = UDim.new(1, 0)
dotLc.Parent = dotL

-- ПРАВЫЙ ПРИЦЕЛ (ЧЁРНЫЙ)
local crosshairR = Instance.new("Frame")
crosshairR.Size = UDim2.new(0, 45, 0.6, 0)
crosshairR.Position = UDim2.new(0.88, 0, 0.2, 0)
crosshairR.BackgroundTransparency = 1
crosshairR.Parent = header

local circleR = Instance.new("Frame")
circleR.Size = UDim2.new(1, 0, 1, 0)
circleR.BackgroundTransparency = 1
circleR.BorderSizePixel = 2
circleR.BorderColor3 = Color3.fromRGB(0, 0, 0)
circleR.Parent = crosshairR
local circleRc = Instance.new("UICorner")
circleRc.CornerRadius = UDim.new(1, 0)
circleRc.Parent = circleR

local hR = Instance.new("Frame")
hR.Size = UDim2.new(0.8, 0, 0.08, 0)
hR.Position = UDim2.new(0.1, 0, 0.46, 0)
hR.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
hR.BackgroundTransparency = 0.3
hR.BorderSizePixel = 0
hR.Parent = crosshairR

local vR = Instance.new("Frame")
vR.Size = UDim2.new(0.08, 0, 0.8, 0)
vR.Position = UDim2.new(0.46, 0, 0.1, 0)
vR.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
vR.BackgroundTransparency = 0.3
vR.BorderSizePixel = 0
vR.Parent = crosshairR

local dotR = Instance.new("Frame")
dotR.Size = UDim2.new(0.15, 0, 0.15, 0)
dotR.Position = UDim2.new(0.425, 0, 0.425, 0)
dotR.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
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
title.Size = UDim2.new(0.5, 0, 0.6, 0)
title.Position = UDim2.new(0.25, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "WERTIUM HUB"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 38
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Center
title.Parent = header

-- ВЕРСИЯ VD
local version = Instance.new("TextLabel")
version.Size = UDim2.new(0.5, 0, 0.25, 0)
version.Position = UDim2.new(0.25, 0, 0.6, 0)
version.BackgroundTransparency = 1
version.Text = "VD"
version.TextColor3 = Color3.fromRGB(200, 200, 200)
version.TextSize = 18
version.Font = Enum.Font.SourceSansBold
version.TextXAlignment = Enum.TextXAlignment.Center
version.Parent = header

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
--  ПАНЕЛЬ УПРАВЛЕНИЯ (ESP)
-- ============================================================
local controlPanel = Instance.new("Frame")
controlPanel.Size = UDim2.new(1, 0, 0, 60)
controlPanel.Position = UDim2.new(0, 0, 0, 90)
controlPanel.BackgroundTransparency = 1
controlPanel.Parent = frame

local espBtn = Instance.new("TextButton")
espBtn.Size = UDim2.new(0, 160, 0, 40)
espBtn.Position = UDim2.new(0.5, -80, 0.5, -20)
espBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
espBtn.BackgroundTransparency = 0.3
espBtn.Text = "ESP: Вкл"
espBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
espBtn.TextSize = 20
espBtn.Font = Enum.Font.SourceSansBold
espBtn.Parent = controlPanel

local espCorners = Instance.new("UICorner")
espCorners.CornerRadius = UDim.new(0, 10)
espCorners.Parent = espBtn

-- ============================================================
--  ЛОГИКА ESP
-- ============================================================
local espEnabled = false
local espBillboards = {}  -- таблица { [Player] = BillboardGui }

local function getRole(player)
    -- Определяем роль по наличию оружия
    if not player or not player.Character then return "innocent" end
    local backpack = player:FindFirstChild("Backpack")
    if backpack then
        for _, tool in pairs(backpack:GetChildren()) do
            if tool:IsA("Tool") then
                local name = tool.Name:lower()
                if name:find("knife") or name:find("dagger") then
                    return "murderer"
                elseif name:find("gun") or name:find("pistol") or name:find("revolver") then
                    return "sheriff"
                end
            end
        end
    end
    -- Проверяем также в руках (Character)
    local char = player.Character
    if char then
        for _, tool in pairs(char:GetChildren()) do
            if tool:IsA("Tool") then
                local name = tool.Name:lower()
                if name:find("knife") or name:find("dagger") then
                    return "murderer"
                elseif name:find("gun") or name:find("pistol") or name:find("revolver") then
                    return "sheriff"
                end
            end
        end
    end
    return "innocent"
end

local function createBillboard(player)
    if player == game.Players.LocalPlayer then return end  -- не показываем себе
    if espBillboards[player] then return end

    local role = getRole(player)
    local text = ""
    local color = Color3.fromRGB(0, 255, 0) -- зелёный по умолчанию
    if role == "murderer" then
        text = "MURDERER"
        color = Color3.fromRGB(255, 0, 0)
    elseif role == "sheriff" then
        text = "SHERIFF"
        color = Color3.fromRGB(0, 150, 255)
    else
        text = "INNOCENT"
        color = Color3.fromRGB(0, 255, 0)
    end

    local billboard = Instance.new("BillboardGui")
    billboard.Size = UDim2.new(0, 200, 0, 40)
    billboard.Adornee = player.Character and player.Character:FindFirstChild("Head")
    if not billboard.Adornee then
        billboard:Destroy()
        return
    end
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.Parent = gui

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = color
    label.TextSize = 18
    label.Font = Enum.Font.SourceSansBold
    label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    label.TextStrokeTransparency = 0.3
    label.Parent = billboard

    espBillboards[player] = billboard
end

local function removeBillboard(player)
    if espBillboards[player] then
        espBillboards[player]:Destroy()
        espBillboards[player] = nil
    end
end

local function clearAllBillboards()
    for _, bill in pairs(espBillboards) do
        bill:Destroy()
    end
    espBillboards = {}
end

local function updateAllESP()
    -- Удаляем все биллборды и создаём заново
    clearAllBillboards()
    for _, p in pairs(game.Players:GetPlayers()) do
        createBillboard(p)
    end
end

-- Подписываемся на изменения игроков
game.Players.PlayerAdded:Connect(function(p)
    if espEnabled then
        p.CharacterAdded:Connect(function()
            wait(0.5)
            if espEnabled then
                removeBillboard(p)
                createBillboard(p)
            end
        end)
        p.CharacterRemoving:Connect(function()
            removeBillboard(p)
        end)
        -- Создаём при добавлении
        wait(0.5)
        if espEnabled then
            createBillboard(p)
        end
    end
end)

game.Players.PlayerRemoving:Connect(function(p)
    removeBillboard(p)
end)

-- Таймер обновления ролей (каждые 3 секунды)
local function espLoop()
    while espEnabled do
        -- Обновляем все биллборды (пересоздаём, т.к. роли могут меняться)
        -- Оптимизация: можно обновлять только текст и цвет, но для простоты пересоздаём
        if espEnabled then
            for p, bill in pairs(espBillboards) do
                if p and p.Character and p.Character:FindFirstChild("Head") then
                    local role = getRole(p)
                    local text = ""
                    local color = Color3.fromRGB(0, 255, 0)
                    if role == "murderer" then
                        text = "MURDERER"
                        color = Color3.fromRGB(255, 0, 0)
                    elseif role == "sheriff" then
                        text = "SHERIFF"
                        color = Color3.fromRGB(0, 150, 255)
                    else
                        text = "INNOCENT"
                        color = Color3.fromRGB(0, 255, 0)
                    end
                    local label = bill:FindFirstChild("TextLabel")
                    if label then
                        label.Text = text
                        label.TextColor3 = color
                    end
                else
                    removeBillboard(p)
                end
            end
            -- Проверяем новых игроков, которых ещё нет в таблице
            for _, p in pairs(game.Players:GetPlayers()) do
                if p ~= player and not espBillboards[p] and p.Character and p.Character:FindFirstChild("Head") then
                    createBillboard(p)
                end
            end
        end
        wait(3)
    end
end

-- Функция включения/выключения ESP
local function toggleESP()
    espEnabled = not espEnabled
    if espEnabled then
        espBtn.Text = "ESP: Выкл"
        updateAllESP()
        -- Запускаем цикл обновления
        spawn(espLoop)
    else
        espBtn.Text = "ESP: Вкл"
        clearAllBillboards()
    end
end

espBtn.MouseButton1Click:Connect(toggleESP)

-- ============================================================
--  ВОДЯНОЙ ЗНАК
-- ============================================================
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

print("✅ Меню с ESP загружено!")
print("🔑 F1 - открыть/закрыть")
