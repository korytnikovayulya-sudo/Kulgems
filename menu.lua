-- ============================================================
--  VISUALS ВКЛАДКА (С ТЕКСТОМ ПОД КНОПКОЙ)
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

-- КНОПКА ESP
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

-- ТЕКСТ ПОД КНОПКОЙ
local espHint = Instance.new("TextLabel")
espHint.Size = UDim2.new(0, 400, 0, 30)
espHint.Position = UDim2.new(0, 5, 0.3, 5)
espHint.BackgroundTransparency = 1
espHint.Text = "THIS FUNCTION WORKS WHEN THE STATUS IS OFF"
espHint.TextColor3 = Color3.fromRGB(255, 255, 255)
espHint.TextSize = 14
espHint.Font = Enum.Font.SourceSansItalic
espHint.TextXAlignment = Enum.TextXAlignment.Left
espHint.TextTransparency = 0.3
espHint.Parent = visualsContent
