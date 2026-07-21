-- ============================================================
--  MUSLIM MENU v12.2 - ESP FIXED + COMBAT FIX
--  by Tormentor412
-- ============================================================

print("🚀 Загрузка Muslim Menu v12.2 (ESP + COMBAT FIXED)...")

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
frame.Size = UDim2.new(0, 700, 0, 480)
frame.Position = UDim2.new(0.5, -350, 0.5, -240)
frame.BackgroundColor3 = THEMES[currentTheme].main
frame.BackgroundTransparency = 0
frame.BorderSizePixel = 2
frame.BorderColor3 = THEMES[currentTheme].accent
frame.Active = true
frame.Draggable = true
frame.ClipsDescendants = true
frame.Parent = gui

local corners = Instance.new("UICorner")
corners.CornerRadius = UDim.new(0, 20)
corners.Parent = frame

-- ===== ЗАГОЛОВОК =====
local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 50)
header.BackgroundColor3 = THEMES[currentTheme].header
header.BackgroundTransparency = 0
header.Parent = frame

local headerCorners = Instance.new("UICorner")
headerCorners.CornerRadius = UDim.new(0, 20)
headerCorners.Parent = header

local icon = Instance.new("TextLabel")
icon.Size = UDim2.new(0, 35, 1, 0)
icon.Position = UDim2.new(0.02, 0, 0, 0)
icon.BackgroundTransparency = 1
icon.Text = "⚡"
icon.TextColor3 = THEMES[currentTheme].accent
icon.TextSize = 22
icon.Font = Enum.Font.SourceSansBold
icon.Parent = header

local title = Instance.new("TextLabel")
title.Name = "Title"
title.Size = UDim2.new(0.5, 0, 1, 0)
title.Position = UDim2.new(0.08, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "MUSLIM MENU"
title.TextColor3 = THEMES[currentTheme].accent
title.TextSize = 20
title.Font = Enum.Font.SourceSansBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = header

local versionBadge = Instance.new("TextLabel")
versionBadge.Size = UDim2.new(0, 60, 0, 22)
versionBadge.Position = UDim2.new(0.6, 0, 0.5, -11)
versionBadge.BackgroundColor3 = THEMES[currentTheme].accent
versionBadge.BackgroundTransparency = 0.15
versionBadge.Text = "v12.2"
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
closeBtn.Position = UDim2.new(0.92, 0, 0.5, -16)
closeBtn.BackgroundColor3 = Color3.fromRGB(200, 40, 40)
closeBtn.BackgroundTransparency = 0
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.TextSize = 18
closeBtn.Font = Enum.Font.SourceSansBold
closeBtn.Parent = header

local closeCorners = Instance.new("UICorner")
closeCorners.CornerRadius = UDim.new(0, 6)
closeCorners.Parent = closeBtn

-- ============================================================
--  КНОПКА M
-- ============================================================
local mButton = Instance.new("TextButton")
mButton.Name = "FloatBtn"
mButton.Size = UDim2.new(0, 60, 0, 60)
mButton.Position = UDim2.new(0.5, -30, 0.85, 0)
mButton.BackgroundColor3 = THEMES[currentTheme].main
mButton.BackgroundTransparency = 0
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
--  ВКЛАДКИ
-- ============================================================
local tabContainer = Instance.new("Frame")
tabContainer.Size = UDim2.new(0, 100, 1, -50)
tabContainer.Position = UDim2.new(0, 0, 0, 50)
tabContainer.BackgroundColor3 = THEMES[currentTheme].btn
tabContainer.BackgroundTransparency = 0
tabContainer.BorderSizePixel = 0
tabContainer.Parent = frame

local activeTab = "ESP"
local contentContainer = Instance.new("Frame")
contentContainer.Size = UDim2.new(1, -100, 1, -50)
contentContainer.Position = UDim2.new(0, 100, 0, 50)
contentContainer.BackgroundTransparency = 1
contentContainer.Parent = frame

local tabButtons = {}
local function createTabButton(name, yPos)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 40)
    btn.Position = UDim2.new(0, 0, 0, yPos)
    btn.BackgroundColor3 = THEMES[currentTheme].btn
    btn.BackgroundTransparency = 0
    btn.Text = name
    btn.TextColor3 = THEMES[currentTheme].text
    btn.TextSize = 14
    btn.Font = Enum.Font.SourceSansBold
    btn.Parent = tabContainer
    
    local btnCorners = Instance.new("UICorner")
    btnCorners.CornerRadius = UDim.new(0, 0)
    btnCorners.Parent = btn
    
    btn.MouseButton1Click:Connect(function()
        for _, tb in pairs(tabButtons) do
            tb.BackgroundColor3 = THEMES[currentTheme].btn
            tb.TextColor3 = THEMES[currentTheme].text
        end
        btn.BackgroundColor3 = THEMES[currentTheme].accent
        btn.TextColor3 = THEMES[currentTheme].main
        activeTab = name
        updateContent()
    end)
    
    tabButtons[name] = btn
    return btn
end

createTabButton("ESP", 0)
createTabButton("COMBAT", 45)

-- ============================================================
--  КОНТЕНТ ВКЛАДОК
-- ============================================================
local function createToggleInContainer(parent, label, pos, callback)
    local container = Instance.new("Frame")
    container.Size = UDim2.new(0.9, 0, 0, 44)
    container.Position = pos
    container.BackgroundColor3 = THEMES[currentTheme].btn
    container.BackgroundTransparency = 0
    container.BorderSizePixel = 1
    container.BorderColor3 = THEMES[currentTheme].accent
    container.Parent = parent
    
    local corners = Instance.new("UICorner")
    corners.CornerRadius = UDim.new(0, 10)
    corners.Parent = container
    
    local labelText = Instance.new("TextLabel")
    labelText.Size = UDim2.new(0.6, 0, 1, 0)
    labelText.Position = UDim2.new(0.05, 0, 0, 0)
    labelText.BackgroundTransparency = 1
    labelText.Text = label
    labelText.TextColor3 = THEMES[currentTheme].text
    labelText.TextSize = 15
    labelText.Font = Enum.Font.SourceSansBold
    labelText.TextXAlignment = Enum.TextXAlignment.Left
    labelText.Parent = container
    
    local toggle = Instance.new("TextButton")
    toggle.Size = UDim2.new(0, 50, 0, 28)
    toggle.Position = UDim2.new(0.82, 0, 0.5, -14)
    toggle.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    toggle.BackgroundTransparency = 0
    toggle.Text = ""
    toggle.Parent = container
    
    local toggleCorners = Instance.new("UICorner")
    toggleCorners.CornerRadius = UDim.new(0, 14)
    toggleCorners.Parent = toggle
    
    local knob = Instance.new("Frame")
    knob.Size = UDim2.new(0, 20, 0, 20)
    knob.Position = UDim2.new(0.05, 0, 0.5, -10)
    knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    knob.BackgroundTransparency = 0
    knob.Parent = toggle
    
    local knobCorners = Instance.new("UICorner")
    knobCorners.CornerRadius = UDim.new(0, 10)
    knobCorners.Parent = knob
    
    local state = false
    toggle.MouseButton1Click:Connect(function()
        state = not state
        toggle.BackgroundColor3 = state and THEMES[currentTheme].accent or Color3.fromRGB(40, 40, 50)
        knob.Position = state and UDim2.new(0.55, 0, 0.5, -10) or UDim2.new(0.05, 0, 0.5, -10)
        if callback then callback(state) end
    end)
end

-- ESP
local espContent = Instance.new("Frame")
espContent.Size = UDim2.new(1, 0, 1, 0)
espContent.BackgroundTransparency = 1
espContent.Parent = contentContainer

-- COMBAT
local combatContent = Instance.new("Frame")
combatContent.Size = UDim2.new(1, 0, 1, 0)
combatContent.BackgroundTransparency = 1
combatContent.Visible = false
combatContent.Parent = contentContainer

-- ============================================================
--  ПЕРЕМЕННЫЕ ESP
-- ============================================================
local ESP_MURDER = false
local ESP_SHERIFF = false
local ESP_INNOCENT = false

-- ============================================================
--  ESP (РАБОЧАЯ ВЕРСИЯ — BILLBOARD)
-- ============================================================
local espList = {}

local function createESPForPlayer(plr)
    if plr == player then return end
    if espList[plr] then return end
    
    local billboard = Instance.new("BillboardGui")
    billboard.Name = plr.Name .. "_ESP"
    billboard.Size = UDim2.new(0, 200, 0, 40)
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.AlwaysOnTop = true
    billboard.Parent = game:GetService("CoreGui")
    
    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 0.3
    textLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    textLabel.TextSize = 16
    textLabel.Font = Enum.Font.SourceSansBold
    textLabel.Parent = billboard
    
    espList[plr] = {
        billboard = billboard,
        label = textLabel,
        connection = nil,
        player = plr
    }
    
    local conn
    conn = game:GetService("RunService").RenderStepped:Connect(function()
        if not plr or not plr.Parent or not plr.Character or not plr.Character:FindFirstChild("Head") then
            if billboard then billboard:Destroy() end
            espList[plr] = nil
            conn:Disconnect()
            return
        end
        
        billboard.Adornee = plr.Character.Head
        
        local role = "innocent"
        local hasKnife = plr.Backpack:FindFirstChild("Knife") or plr.Character:FindFirstChild("Knife")
        local hasGun = plr.Backpack:FindFirstChild("Gun") or plr.Character:FindFirstChild("Gun")
        
        if hasKnife then
            role = "murderer"
        elseif hasGun then
            role = "sheriff"
        end
        
        local show = false
        local color = Color3.fromRGB(255, 255, 255)
        local text = ""
        
        if role == "murderer" and ESP_MURDER then
            show = true
            color = Color3.fromRGB(255, 0, 0)
            text = "🔴 УБИЙЦА " .. plr.Name
        elseif role == "sheriff" and ESP_SHERIFF then
            show = true
            color = Color3.fromRGB(0, 100, 255)
            text = "🔵 ШЕРИФ " .. plr.Name
        elseif role == "innocent" and ESP_INNOCENT then
            show = true
            color = Color3.fromRGB(0, 255, 0)
            text = "🟢 НЕВИННЫЙ " .. plr.Name
        end
        
        if show then
            textLabel.Text = text
            textLabel.TextColor3 = color
            textLabel.BackgroundTransparency = 0.3
            textLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        else
            textLabel.Text = ""
            textLabel.BackgroundTransparency = 1
        end
    end)
    
    espList[plr].connection = conn
end

local function updateAllESP()
    for plr, data in pairs(espList) do
        if data.billboard then data.billboard:Destroy() end
        if data.connection then data.connection:Disconnect() end
    end
    espList = {}
    
    for _, plr in pairs(game:GetService("Players"):GetPlayers()) do
        createESPForPlayer(plr)
    end
end

game:GetService("Players").PlayerAdded:Connect(function(plr)
    createESPForPlayer(plr)
end)

-- Кнопки ESP
createToggleInContainer(espContent, "🔴 ESP Murder", UDim2.new(0.05, 0, 0.05, 0), function(state)
    ESP_MURDER = state
    updateAllESP()
end)

createToggleInContainer(espContent, "🔵 ESP Sheriff", UDim2.new(0.05, 0, 0.15, 0), function(state)
    ESP_SHERIFF = state
    updateAllESP()
end)

createToggleInContainer(espContent, "🟢 ESP Innocent", UDim2.new(0.05, 0, 0.25, 0), function(state)
    ESP_INNOCENT = state
    updateAllESP()
end)

-- ============================================================
--  COMBAT ВКЛАДКА (ФИКС + SHOOT MURDERER)
-- ============================================================
local shootMode = false
local shootFrame = nil
local animConnection = nil

local function toggleShootMode(state)
    shootMode = state
    if state then
        print("✅ COMBAT - Shoot Murderer включён!")
        
        local screenGui = player:WaitForChild("PlayerGui"):FindFirstChild("ShootGui")
        if not screenGui then
            screenGui = Instance.new("ScreenGui")
            screenGui.Name = "ShootGui"
            screenGui.Parent = player:WaitForChild("PlayerGui")
        end
        
        shootFrame = Instance.new("Frame")
        shootFrame.Size = UDim2.new(0, 160, 0, 160)
        shootFrame.Position = UDim2.new(0.5, -80, 0.7, -80)
        shootFrame.BackgroundColor3 = Color3.fromRGB(255, 105, 180)
        shootFrame.BackgroundTransparency = 0.85
        shootFrame.BorderSizePixel = 3
        shootFrame.BorderColor3 = Color3.fromRGB(255, 20, 147)
        shootFrame.Active = true
        shootFrame.Draggable = true
        shootFrame.Parent = screenGui
        
        local corners2 = Instance.new("UICorner")
        corners2.CornerRadius = UDim.new(0, 20)
        corners2.Parent = shootFrame
        
        local glassShine = Instance.new("Frame")
        glassShine.Size = UDim2.new(0.8, 0, 0.3, 0)
        glassShine.Position = UDim2.new(0.1, 0, 0.05, 0)
        glassShine.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        glassShine.BackgroundTransparency = 0.6
        glassShine.BorderSizePixel = 0
        glassShine.Parent = shootFrame
        
        local shineCorners = Instance.new("UICorner")
        shineCorners.CornerRadius = UDim.new(0, 15)
        shineCorners.Parent = glassShine
        
        local shootText = Instance.new("TextLabel")
        shootText.Size = UDim2.new(1, 0, 0.3, 0)
        shootText.Position = UDim2.new(0, 0, 0.35, 0)
        shootText.BackgroundTransparency = 1
        shootText.Text = "SHOOT"
        shootText.TextColor3 = Color3.fromRGB(255, 255, 255)
        shootText.TextSize = 24
        shootText.Font = Enum.Font.SourceSansBold
        shootText.TextStrokeTransparency = 0.3
        shootText.Parent = shootFrame
        
        local crosshairContainer = Instance.new("Frame")
        crosshairContainer.Size = UDim2.new(0.4, 0, 0.4, 0)
        crosshairContainer.Position = UDim2.new(0.3, 0, 0.7, 0)
        crosshairContainer.BackgroundTransparency = 1
        crosshairContainer.Parent = shootFrame
        
        local crosshairCircle = Instance.new("Frame")
        crosshairCircle.Size = UDim2.new(1, 0, 1, 0)
        crosshairCircle.BackgroundTransparency = 1
        crosshairCircle.BorderSizePixel = 3
        crosshairCircle.BorderColor3 = Color3.fromRGB(255, 255, 255)
        crosshairCircle.Parent = crosshairContainer
        
        local circleCorners2 = Instance.new("UICorner")
        circleCorners2.CornerRadius = UDim.new(1, 0)
        circleCorners2.Parent = crosshairCircle
        
        local line1 = Instance.new("Frame")
        line1.Size = UDim2.new(1, 0, 0.1, 0)
        line1.Position = UDim2.new(0, 0, 0.45, 0)
        line1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        line1.BackgroundTransparency = 0.3
        line1.BorderSizePixel = 0
        line1.Parent = crosshairContainer
        
        local line2 = Instance.new("Frame")
        line2.Size = UDim2.new(0.1, 0, 1, 0)
        line2.Position = UDim2.new(0.45, 0, 0, 0)
        line2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        line2.BackgroundTransparency = 0.3
        line2.BorderSizePixel = 0
        line2.Parent = crosshairContainer
        
        local dot = Instance.new("Frame")
        dot.Size = UDim2.new(0.12, 0, 0.12, 0)
        dot.Position = UDim2.new(0.44, 0, 0.44, 0)
        dot.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
        dot.BackgroundTransparency = 0.2
        dot.BorderSizePixel = 0
        dot.Parent = crosshairContainer
        
        local dotCorners = Instance.new("UICorner")
        dotCorners.CornerRadius = UDim.new(1, 0)
        dotCorners.Parent = dot
        
        local angle = 0
        animConnection = game:GetService("RunService").RenderStepped:Connect(function()
            if not shootFrame or not shootFrame.Parent then
                if animConnection then
                    animConnection:Disconnect()
                    animConnection = nil
                end
                return
            end
            angle = angle + 0.02
            crosshairContainer.Rotation = math.deg(angle)
        end)
        
        local shootButton = Instance.new("TextButton")
        shootButton.Size = UDim2.new(1, 0, 1, 0)
        shootButton.BackgroundTransparency = 1
        shootButton.Text = ""
        shootButton.Parent = shootFrame
        
        shootButton.MouseButton1Click:Connect(function()
            if not shootMode then return end
            
            local char = player.Character
            if not char then
                print("❌ Персонаж не найден!")
                return
            end
            
            -- Ищем оружие
            local gun = nil
            for _, tool in pairs(char:GetChildren()) do
                if tool:IsA("Tool") and (tool.Name == "Gun" or tool.Name:lower():find("gun") or tool.Name:lower():find("pistol")) then
                    gun = tool
                    break
                end
            end
            
            if not gun then
                for _, tool in pairs(player.Backpack:GetChildren()) do
                    if tool:IsA("Tool") and (tool.Name == "Gun" or tool.Name:lower():find("gun") or tool.Name:lower():find("pistol")) then
                        gun = tool
                        break
                    end
                end
            end
            
            if not gun then
                print("❌ Оружие не найдено!")
                return
            end
            
            -- Активируем оружие
            if gun.Parent ~= char then
                gun.Parent = char
            end
            
            -- Ждём активации и стреляем
            wait(0.1)
            
            if gun:FindFirstChild("RemoteEvent") then
                gun.RemoteEvent:FireServer("Shoot")
                print("🔫 Выстрел!")
            elseif gun:FindFirstChild("Fire") then
                gun.Fire:FireServer()
                print("🔫 Выстрел!")
            else
                -- Пробуем через Character
                local humanoid = char:FindFirstChild("Humanoid")
                if humanoid then
                    humanoid:EquipTool(gun)
                    wait(0.1)
                    if gun:FindFirstChild("RemoteEvent") then
                        gun.RemoteEvent:FireServer("Shoot")
                        print("🔫 Выстрел через RemoteEvent!")
                    end
                end
            end
        end)
        
    else
        if shootFrame then
            shootFrame:Destroy()
            shootFrame = nil
        end
        if animConnection then
            animConnection:Disconnect()
            animConnection = nil
        end
        print("⬜ Shoot Murderer выключен!")
    end
end

-- Кнопки COMBAT
createToggleInContainer(combatContent, "⚔️ Shoot Murderer", UDim2.new(0.05, 0, 0.05, 0), function(state)
    toggleShootMode(state)
end)

-- ============================================================
--  ПЕРЕКЛЮЧЕНИЕ ВКЛАДОК
-- ============================================================
local function updateContent()
    espContent.Visible = (activeTab == "ESP")
    combatContent.Visible = (activeTab == "COMBAT")
end

updateContent()

-- ============================================================
--  ОБНОВЛЕНИЕ ТЕМЫ (ПО УМОЛЧАНИЮ)
-- ============================================================
local function updateTheme(themeName)
    currentTheme = themeName
    local theme = THEMES[themeName]
    
    frame.BackgroundColor3 = theme.main
    frame.BorderColor3 = theme.accent
    header.BackgroundColor3 = theme.header
    title.TextColor3 = theme.accent
    icon.TextColor3 = theme.accent
    versionBadge.BackgroundColor3 = theme.accent
    versionBadge.TextColor3 = theme.accent
    tabContainer.BackgroundColor3 = theme.btn
    
    for _, btn in pairs(tabButtons) do
        btn.BackgroundColor3 = theme.btn
        btn.TextColor3 = theme.text
    end
end

-- Применяем стартовую тему
updateTheme("midnight")

print("✅ Muslim Menu v12.2 полностью загружен!")
print("📌 ESP работает (торец murderer/sheriff/innocent)")
print("📌 COMBAT вкладка открывается и работает!")
