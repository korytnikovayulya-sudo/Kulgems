-- ============================================================
--  WERTIUM HUB - SHOOT MURDERER (УБИЙСТВО ПО КНОПКЕ)
-- ============================================================

print("🚀 Загрузка Wertium Hub...")

local player = game:GetService("Players").LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "WertiumHub"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- ============================================================
--  ПРИВЕТСТВИЕ HELLO
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
--  КНОПКА W
-- ============================================================
local wButton = Instance.new("TextButton")
wButton.Size = UDim2.new(0, 60, 0, 60)
wButton.Position = UDim2.new(1, -80, 1, -80)
wButton.BackgroundColor3 = Color3.fromRGB(200, 30, 30)
wButton.BackgroundTransparency = 0.1
wButton.Text = "W"
wButton.TextColor3 = Color3.fromRGB(255, 255, 255)
wButton.TextSize = 30
wButton.Font = Enum.Font.GothamBold
wButton.Visible = false
wButton.Parent = gui

local wCorners = Instance.new("UICorner")
wCorners.CornerRadius = UDim.new(1, 0)
wCorners.Parent = wButton

local wStroke = Instance.new("UIStroke")
wStroke.Thickness = 2
wStroke.Color = Color3.fromRGB(255, 255, 255)
wStroke.Transparency = 0.3
wStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
wStroke.Parent = wButton

-- ============================================================
--  ОСНОВНОЕ ОКНО
-- ============================================================
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 900, 0, 500)
frame.Position = UDim2.new(0.5, -450, 0.5, -250)
frame.BackgroundColor3 = Color3.fromRGB(140, 20, 20)
frame.BackgroundTransparency = 0.05
frame.BorderSizePixel = 2
frame.BorderColor3 = Color3.fromRGB(200, 50, 50)
frame.Active = true
frame.Draggable = true
frame.ClipsDescendants = true
frame.Parent = gui

local corners = Instance.new("UICorner")
corners.CornerRadius = UDim.new(0, 20)
corners.Parent = frame

local stroke = Instance.new("UIStroke")
stroke.Thickness = 4
stroke.Color = Color3.fromRGB(255, 255, 255)
stroke.Transparency = 0.1
stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
stroke.Parent = frame

-- ============================================================
--  ЗАГОЛОВОК
-- ============================================================
local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 80)
header.BackgroundColor3 = Color3.fromRGB(120, 15, 15)
header.BackgroundTransparency = 0.15
header.Parent = frame

local headerCorners = Instance.new("UICorner")
headerCorners.CornerRadius = UDim.new(0, 20)
headerCorners.Parent = header

-- ЛЕВЫЙ ПРИЦЕЛ
local crosshairL = Instance.new("Frame")
crosshairL.Size = UDim2.new(0, 40, 0.6, 0)
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

-- ПРАВЫЙ ПРИЦЕЛ
local crosshairR = Instance.new("Frame")
crosshairR.Size = UDim2.new(0, 40, 0.6, 0)
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

local angle2 = 0
game:GetService("RunService").RenderStepped:Connect(function()
    angle2 = angle2 + 0.03
    crosshairL.Rotation = math.deg(angle2)
    crosshairR.Rotation = math.deg(-angle2)
end)

-- НАЗВАНИЕ
local title = Instance.new("TextLabel")
title.Size = UDim2.new(0.4, 0, 0.7, 0)
title.Position = UDim2.new(0.3, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "WERTIUM HUB"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 34
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Center
title.Parent = header

local version = Instance.new("TextLabel")
version.Size = UDim2.new(0.4, 0, 0.3, 0)
version.Position = UDim2.new(0.3, 0, 0.7, 0)
version.BackgroundTransparency = 1
version.Text = "VD"
version.TextColor3 = Color3.fromRGB(200, 200, 200)
version.TextSize = 16
version.Font = Enum.Font.SourceSansBold
version.TextXAlignment = Enum.TextXAlignment.Center
version.Parent = header

-- КНОПКА ЗАКРЫТИЯ
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 40, 0, 40)
closeBtn.Position = UDim2.new(0.94, 0, 0.5, -20)
closeBtn.BackgroundColor3 = Color3.fromRGB(200, 30, 30)
closeBtn.BackgroundTransparency = 0.1
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.TextSize = 22
closeBtn.Font = Enum.Font.SourceSansBold
closeBtn.Parent = header

local closeCorners = Instance.new("UICorner")
closeCorners.CornerRadius = UDim.new(0, 8)
closeCorners.Parent = closeBtn

closeBtn.MouseButton1Click:Connect(function()
    frame.Visible = false
    wButton.Visible = true
end)

wButton.MouseButton1Click:Connect(function()
    frame.Visible = true
    wButton.Visible = false
end)

-- ============================================================
--  ЛЕВАЯ ПАНЕЛЬ С ВКЛАДКАМИ
-- ============================================================
local tabContainer = Instance.new("Frame")
tabContainer.Size = UDim2.new(0, 140, 1, -80)
tabContainer.Position = UDim2.new(0, 0, 0, 80)
tabContainer.BackgroundColor3 = Color3.fromRGB(100, 15, 15)
tabContainer.BackgroundTransparency = 0.2
tabContainer.Parent = frame

local tabContainerCorners = Instance.new("UICorner")
tabContainerCorners.CornerRadius = UDim.new(0, 20)
tabContainerCorners.Parent = tabContainer

local contentContainer = Instance.new("Frame")
contentContainer.Size = UDim2.new(1, -150, 1, -90)
contentContainer.Position = UDim2.new(0, 145, 0, 85)
contentContainer.BackgroundTransparency = 1
contentContainer.Parent = frame

-- ============================================================
--  ВКЛАДКИ
-- ============================================================
local tabs = {}
local currentTab = "VISUALS"
local tweenService = game:GetService("TweenService")

local function createTab(name, yPos)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -10, 0, 45)
    btn.Position = UDim2.new(0.05, 0, 0, yPos)
    btn.BackgroundColor3 = Color3.fromRGB(80, 10, 10)
    btn.BackgroundTransparency = 0.3
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(200, 200, 200)
    btn.TextSize = 16
    btn.Font = Enum.Font.SourceSansBold
    btn.Parent = tabContainer
    
    local btnCorners = Instance.new("UICorner")
    btnCorners.CornerRadius = UDim.new(0, 20)
    btnCorners.Parent = btn
    
    tabs[name] = btn
    return btn
end

createTab("VISUALS", 5)
createTab("AIM", 55)
createTab("MISC", 105)

-- ============================================================
--  VISUALS (ESP)
-- ============================================================
local visualsContent = Instance.new("Frame")
visualsContent.Size = UDim2.new(1, 0, 1, 0)
visualsContent.BackgroundTransparency = 1
visualsContent.Visible = true
visualsContent.Parent = contentContainer

local visualsTitle = Instance.new("TextLabel")
visualsTitle.Size = UDim2.new(1, 0, 0.1, 0)
visualsTitle.Position = UDim2.new(0, 0, 0, 0)
visualsTitle.BackgroundTransparency = 1
visualsTitle.Text = "VISUALS"
visualsTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
visualsTitle.TextSize = 26
visualsTitle.Font = Enum.Font.SourceSansBold
visualsTitle.TextXAlignment = Enum.TextXAlignment.Left
visualsTitle.Parent = visualsContent

local espBtn = Instance.new("TextButton")
espBtn.Size = UDim2.new(0, 200, 0, 45)
espBtn.Position = UDim2.new(0, 0, 0.15, 0)
espBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
espBtn.BackgroundTransparency = 0.3
espBtn.Text = "ESP: Выкл"
espBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
espBtn.TextSize = 20
espBtn.Font = Enum.Font.SourceSansBold
espBtn.Parent = visualsContent

local espCorners = Instance.new("UICorner")
espCorners.CornerRadius = UDim.new(0, 10)
espCorners.Parent = espBtn

-- ============================================================
--  ESP ЛОГИКА
-- ============================================================
local espEnabled = false
local espLabels = {}

local function getRole(p)
    if not p or not p.Character then return "innocent" end
    local char = p.Character
    local backpack = p:FindFirstChild("Backpack")
    
    local function checkTool(tool)
        if not tool:IsA("Tool") then return false end
        local name = tool.Name:lower()
        if name:find("knife") or name:find("dagger") then
            return "murderer"
        elseif name:find("gun") or name:find("pistol") or name:find("revolver") then
            return "sheriff"
        end
        return false
    end
    
    for _, tool in pairs(char:GetChildren()) do
        local role = checkTool(tool)
        if role then return role end
    end
    if backpack then
        for _, tool in pairs(backpack:GetChildren()) do
            local role = checkTool(tool)
            if role then return role end
        end
    end
    return "innocent"
end

local function createBillboard(p)
    if p == player then return end
    if espLabels[p] then return end

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

    local highlight = Instance.new("Highlight")
    highlight.Adornee = p.Character
    highlight.FillColor = color
    highlight.FillTransparency = 0.5
    highlight.OutlineColor = color
    highlight.OutlineTransparency = 0.3
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.Parent = p.Character

    local head = p.Character and p.Character:FindFirstChild("Head")
    if not head then 
        highlight:Destroy()
        return 
    end

    local bill = Instance.new("BillboardGui")
    bill.Size = UDim2.new(0, 200, 0, 40)
    bill.Adornee = head
    bill.StudsOffset = Vector3.new(0, 3.5, 0)
    bill.AlwaysOnTop = true
    bill.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    bill.Parent = gui

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = color
    label.TextSize = 22
    label.Font = Enum.Font.SourceSansBold
    label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    label.TextStrokeTransparency = 0.1
    label.Parent = bill

    espLabels[p] = { label = label, bill = bill, highlight = highlight }
end

local function removeBillboard(p)
    if espLabels[p] then
        if espLabels[p].bill then espLabels[p].bill:Destroy() end
        if espLabels[p].highlight then espLabels[p].highlight:Destroy() end
        espLabels[p] = nil
    end
end

local function clearAllBillboards()
    for p, data in pairs(espLabels) do
        if data.bill then data.bill:Destroy() end
        if data.highlight then data.highlight:Destroy() end
    end
    espLabels = {}
end

local function updateAllESP()
    clearAllBillboards()
    if espEnabled then
        for _, p in pairs(game.Players:GetPlayers()) do
            createBillboard(p)
        end
    end
end

game.Players.PlayerAdded:Connect(function(p)
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
    wait(0.5)
    if espEnabled then
        createBillboard(p)
    end
end)

game.Players.PlayerRemoving:Connect(function(p)
    removeBillboard(p)
end)

local function espLoop()
    while espEnabled do
        for p, data in pairs(espLabels) do
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
                if data.label then
                    data.label.Text = text
                    data.label.TextColor3 = color
                end
                if data.highlight then
                    data.highlight.FillColor = color
                    data.highlight.OutlineColor = color
                end
            else
                removeBillboard(p)
            end
        end
        for _, p in pairs(game.Players:GetPlayers()) do
            if p ~= player and not espLabels[p] and p.Character and p.Character:FindFirstChild("Head") then
                createBillboard(p)
            end
        end
        wait(3)
    end
end

local function toggleESP()
    espEnabled = not espEnabled
    if espEnabled then
        espBtn.Text = "ESP: Вкл"
        updateAllESP()
        spawn(espLoop)
        print("✅ ESP включен")
    else
        espBtn.Text = "ESP: Выкл"
        clearAllBillboards()
        print("❌ ESP выключен")
    end
end

espBtn.MouseButton1Click:Connect(toggleESP)

-- ============================================================
--  AIM (CAMLOCK + SHOOT MURDERER)
-- ============================================================
local aimContent = Instance.new("Frame")
aimContent.Size = UDim2.new(1, 0, 1, 0)
aimContent.BackgroundTransparency = 1
aimContent.Visible = false
aimContent.Parent = contentContainer

local aimTitle = Instance.new("TextLabel")
aimTitle.Size = UDim2.new(1, 0, 0.08, 0)
aimTitle.Position = UDim2.new(0, 0, 0, 0)
aimTitle.BackgroundTransparency = 1
aimTitle.Text = "AIM"
aimTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
aimTitle.TextSize = 26
aimTitle.Font = Enum.Font.SourceSansBold
aimTitle.TextXAlignment = Enum.TextXAlignment.Left
aimTitle.Parent = aimContent

-- Camlock Toggle
local camlockBtn = Instance.new("TextButton")
camlockBtn.Size = UDim2.new(0, 200, 0, 40)
camlockBtn.Position = UDim2.new(0, 0, 0.12, 0)
camlockBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
camlockBtn.BackgroundTransparency = 0.3
camlockBtn.Text = "Camlock: Выкл"
camlockBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
camlockBtn.TextSize = 18
camlockBtn.Font = Enum.Font.SourceSansBold
camlockBtn.Parent = aimContent

local camlockCorners = Instance.new("UICorner")
camlockCorners.CornerRadius = UDim.new(0, 10)
camlockCorners.Parent = camlockBtn

-- Shoot Murderer Toggle
local shootBtn = Instance.new("TextButton")
shootBtn.Size = UDim2.new(0, 200, 0, 40)
shootBtn.Position = UDim2.new(0, 0, 0.22, 0)
shootBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
shootBtn.BackgroundTransparency = 0.3
shootBtn.Text = "Shoot Murderer: Выкл"
shootBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
shootBtn.TextSize = 18
shootBtn.Font = Enum.Font.SourceSansBold
shootBtn.Parent = aimContent

local shootCorners = Instance.new("UICorner")
shootCorners.CornerRadius = UDim.new(0, 10)
shootCorners.Parent = shootBtn

-- ============================================================
--  CAMLOCK ЛОГИКА
-- ============================================================
local camlockEnabled = false
local camera = workspace.CurrentCamera

camlockBtn.MouseButton1Click:Connect(function()
    camlockEnabled = not camlockEnabled
    if camlockEnabled then
        camlockBtn.Text = "Camlock: Вкл"
        print("✅ Camlock включен")
    else
        camlockBtn.Text = "Camlock: Выкл"
        print("❌ Camlock выключен")
    end
end)

local function findMurderer()
    for _, p in pairs(game.Players:GetPlayers()) do
        if p ~= player and p.Character and p.Character:FindFirstChild("Head") then
            if getRole(p) == "murderer" then
                return p
            end
        end
    end
    return nil
end

game:GetService("RunService").RenderStepped:Connect(function()
    if not camlockEnabled then return end
    local target = findMurderer()
    if not target then return end
    local head = target.Character:FindFirstChild("Head")
    if not head then return end
    local targetPos = head.Position
    local currentPos = camera.CFrame.Position
    local direction = (targetPos - currentPos).Unit
    camera.CFrame = CFrame.new(currentPos, currentPos + direction)
end)

-- ============================================================
--  SHOOT MURDERER (КВАДРАТ С ПРИЦЕЛОМ)
-- ============================================================
local shootEnabled = false
local shootFrame = nil
local shootCrosshair = nil
local shootLabel = nil
local shootAngle = 0

local function createShootUI()
    if shootFrame then return end
    
    -- ОСНОВНОЙ КВАДРАТ (ЧЁРНЫЙ, МАТОВЫЙ)
    shootFrame = Instance.new("Frame")
    shootFrame.Size = UDim2.new(0, 120, 0, 120)
    shootFrame.Position = UDim2.new(0.5, -60, 0.5, -60)
    shootFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    shootFrame.BackgroundTransparency = 0.05
    shootFrame.BorderSizePixel = 2
    shootFrame.BorderColor3 = Color3.fromRGB(255, 50, 50)
    shootFrame.ZIndex = 999
    shootFrame.Parent = gui
    
    local shootCorners = Instance.new("UICorner")
    shootCorners.CornerRadius = UDim.new(0, 12)
    shootCorners.Parent = shootFrame
    
    -- АНИМИРОВАННЫЙ ПРИЦЕЛ ВНУТРИ КВАДРАТА
    local crosshairContainer = Instance.new("Frame")
    crosshairContainer.Size = UDim2.new(0, 60, 0, 60)
    crosshairContainer.Position = UDim2.new(0.5, -30, 0.5, -30)
    crosshairContainer.BackgroundTransparency = 1
    crosshairContainer.Parent = shootFrame
    shootCrosshair = crosshairContainer
    
    local circle = Instance.new("Frame")
    circle.Size = UDim2.new(1, 0, 1, 0)
    circle.BackgroundTransparency = 1
    circle.BorderSizePixel = 2
    circle.BorderColor3 = Color3.fromRGB(255, 50, 50)
    circle.Parent = crosshairContainer
    local circleCorners2 = Instance.new("UICorner")
    circleCorners2.CornerRadius = UDim.new(1, 0)
    circleCorners2.Parent = circle
    
    local hLine = Instance.new("Frame")
    hLine.Size = UDim2.new(0.8, 0, 0.08, 0)
    hLine.Position = UDim2.new(0.1, 0, 0.46, 0)
    hLine.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    hLine.BackgroundTransparency = 0.3
    hLine.BorderSizePixel = 0
    hLine.Parent = crosshairContainer
    
    local vLine = Instance.new("Frame")
    vLine.Size = UDim2.new(0.08, 0, 0.8, 0)
    vLine.Position = UDim2.new(0.46, 0, 0.1, 0)
    vLine.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    vLine.BackgroundTransparency = 0.3
    vLine.BorderSizePixel = 0
    vLine.Parent = crosshairContainer
    
    local dot2 = Instance.new("Frame")
    dot2.Size = UDim2.new(0.15, 0, 0.15, 0)
    dot2.Position = UDim2.new(0.425, 0, 0.425, 0)
    dot2.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    dot2.BackgroundTransparency = 0.2
    dot2.BorderSizePixel = 0
    dot2.Parent = crosshairContainer
    local dotCorners2 = Instance.new("UICorner")
    dotCorners2.CornerRadius = UDim.new(1, 0)
    dotCorners2.Parent = dot2
    
    -- НАДПИСЬ SHOOT
    shootLabel = Instance.new("TextLabel")
    shootLabel.Size = UDim2.new(1, 0, 0.25, 0)
    shootLabel.Position = UDim2.new(0, 0, 0.75, 0)
    shootLabel.BackgroundTransparency = 1
    shootLabel.Text = "SHOOT"
    shootLabel.TextColor3 = Color3.fromRGB(255, 50, 50)
    shootLabel.TextSize = 14
    shootLabel.Font = Enum.Font.GothamBold
    shootLabel.TextXAlignment = Enum.TextXAlignment.Center
    shootLabel.Parent = shootFrame
end

local function destroyShootUI()
    if shootFrame then
        shootFrame:Destroy()
        shootFrame = nil
        shootCrosshair = nil
        shootLabel = nil
    end
end

-- АНИМАЦИЯ ПРИЦЕЛА В КВАДРАТЕ
game:GetService("RunService").RenderStepped:Connect(function()
    if shootCrosshair and shootCrosshair.Parent then
        shootAngle = shootAngle + 0.04
        shootCrosshair.Rotation = math.deg(shootAngle)
    end
end)

-- ФУНКЦИЯ УБИЙСТВА MURDERER
local function shootMurderer()
    local target = findMurderer()
    if not target then
        print("❌ Убийца не найден!")
        return
    end
    
    local humanoid = target.Character:FindFirstChild("Humanoid")
    if humanoid then
        humanoid.Health = 0
        print("🔫 Убийца уничтожен!")
    else
        print("❌ У игрока нет Humanoid!")
    end
end

-- НАЖАТИЕ НА КВАДРАТ
local function onShootClick()
    if shootFrame then
        shootMurderer()
    end
end

-- ВКЛЮЧЕНИЕ/ВЫКЛЮЧЕНИЕ SHOOT
shootBtn.MouseButton1Click:Connect(function()
    shootEnabled = not shootEnabled
    if shootEnabled then
        shootBtn.Text = "Shoot Murderer: Вкл"
        createShootUI()
        shootFrame.MouseButton1Click:Connect(onShootClick)
        print("✅ Shoot Murderer включен")
    else
        shootBtn.Text = "Shoot Murderer: Выкл"
        destroyShootUI()
        print("❌ Shoot Murderer выключен")
    end
end)

-- ============================================================
--  MISC (ПУСТО)
-- ============================================================
local miscContent = Instance.new("Frame")
miscContent.Size = UDim2.new(1, 0, 1, 0)
miscContent.BackgroundTransparency = 1
miscContent.Visible = false
miscContent.Parent = contentContainer

local miscTitle = Instance.new("TextLabel")
miscTitle.Size = UDim2.new(1, 0, 0.1, 0)
miscTitle.Position = UDim2.new(0, 0, 0, 0)
miscTitle.BackgroundTransparency = 1
miscTitle.Text = "MISC"
miscTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
miscTitle.TextSize = 26
miscTitle.Font = Enum.Font.SourceSansBold
miscTitle.TextXAlignment = Enum.TextXAlignment.Left
miscTitle.Parent = miscContent

local miscLabel = Instance.new("TextLabel")
miscLabel.Size = UDim2.new(1, 0, 0.5, 0)
miscLabel.Position = UDim2.new(0, 0, 0.15, 0)
miscLabel.BackgroundTransparency = 1
miscLabel.Text = "MISC functions coming soon..."
miscLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
miscLabel.TextSize = 20
miscLabel.Font = Enum.Font.SourceSans
miscLabel.TextXAlignment = Enum.TextXAlignment.Left
miscLabel.Parent = miscContent

-- ============================================================
--  ПЕРЕКЛЮЧЕНИЕ ВКЛАДОК
-- ============================================================
local function switchTab(tabName)
    currentTab = tabName
    visualsContent.Visible = false
    aimContent.Visible = false
    miscContent.Visible = false
    
    if tabName == "VISUALS" then
        visualsContent.Visible = true
    elseif tabName == "AIM" then
        aimContent.Visible = true
    elseif tabName == "MISC" then
        miscContent.Visible = true
    end
    
    for name, btn in pairs(tabs) do
        local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        if name == tabName then
            tweenService:Create(btn, tweenInfo, {
                BackgroundColor3 = Color3.fromRGB(200, 50, 50),
                BackgroundTransparency = 0.1,
                TextColor3 = Color3.fromRGB(255, 255, 255),
                Size = UDim2.new(1, -10, 0, 48)
            }):Play()
        else
            tweenService:Create(btn, tweenInfo, {
                BackgroundColor3 = Color3.fromRGB(80, 10, 10),
                BackgroundTransparency = 0.3,
                TextColor3 = Color3.fromRGB(200, 200, 200),
                Size = UDim2.new(1, -10, 0, 45)
            }):Play()
        end
    end
end

for name, btn in pairs(tabs) do
    btn.MouseButton1Click:Connect(function()
        switchTab(name)
    end)
end

switchTab("VISUALS")

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

-- ============================================================
--  F1
-- ============================================================
game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.F1 then
        if frame then
            frame.Visible = not frame.Visible
            if frame.Visible then
                wButton.Visible = false
            else
                wButton.Visible = true
            end
        end
    end
end)

print("✅ WERTIUM HUB загружен успешно!")
print("🔑 F1 - открыть/закрыть")
print("🎯 Camlock - наводится на убийцу")
print("🔫 Shoot Murderer - квадрат с прицелом, убивает убийцу по нажатию")
