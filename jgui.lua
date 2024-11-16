local UILibrary = {}

-- Function to create a basic UI container
function UILibrary:CreateUI(title)
    local ScreenGui = Instance.new("ScreenGui")
    local Frame = Instance.new("Frame")
    local Title = Instance.new("TextLabel")
    local UICorner = Instance.new("UICorner")
    local UIStroke = Instance.new("UIStroke")

    -- Screen GUI
    ScreenGui.Name = "ModernUI"
    ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    ScreenGui.ResetOnSpawn = false

    -- Main Frame
    Frame.Name = "MainFrame"
    Frame.Parent = ScreenGui
    Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Frame.Position = UDim2.new(0.3, 0, 0.3, 0)
    Frame.Size = UDim2.new(0, 450, 0, 350)
    Frame.BorderSizePixel = 0
    
    -- Rounded corners for the frame
    UICorner.CornerRadius = UDim.new(0, 10)
    UICorner.Parent = Frame

    -- Stroke effect for the frame
    UIStroke.Parent = Frame
    UIStroke.Color = Color3.fromRGB(50, 50, 50)
    UIStroke.Thickness = 2

    -- Title Label
    Title.Name = "Title"
    Title.Parent = Frame
    Title.BackgroundTransparency = 1
    Title.Size = UDim2.new(1, 0, 0, 50)
    Title.Font = Enum.Font.GothamBold
    Title.Text = title
    Title.TextColor3 = Color3.fromRGB(240, 240, 240)
    Title.TextSize = 24

    return Frame
end

-- Function to create a button
function UILibrary:CreateButton(parent, text, callback)
    local Button = Instance.new("TextButton")
    local UICorner = Instance.new("UICorner")

    Button.Parent = parent
    Button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Button.Size = UDim2.new(0, 200, 0, 50)
    Button.Font = Enum.Font.Gotham
    Button.Text = text
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.TextSize = 16
    Button.BorderSizePixel = 0

    -- Rounded corners for the button
    UICorner.CornerRadius = UDim.new(0, 8)
    UICorner.Parent = Button

    -- Button effects
    Button.MouseEnter:Connect(function()
        Button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    end)
    Button.MouseLeave:Connect(function()
        Button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    end)
    Button.MouseButton1Click:Connect(callback)

    return Button
end

-- Function to create a slider
function UILibrary:CreateSlider(parent, min, max, callback)
    local SliderFrame = Instance.new("Frame")
    local SliderBar = Instance.new("Frame")
    local SliderKnob = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")

    SliderFrame.Parent = parent
    SliderFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    SliderFrame.Size = UDim2.new(0, 300, 0, 40)
    SliderFrame.BorderSizePixel = 0

    -- Rounded corners for the slider
    UICorner.CornerRadius = UDim.new(0, 8)
    UICorner.Parent = SliderFrame

    SliderBar.Parent = SliderFrame
    SliderBar.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    SliderBar.Size = UDim2.new(1, -20, 0.3, 0)
    SliderBar.Position = UDim2.new(0.05, 0, 0.35, 0)

    SliderKnob.Parent = SliderBar
    SliderKnob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    SliderKnob.Size = UDim2.new(0, 20, 1, 0)
    SliderKnob.BorderSizePixel = 0
    SliderKnob.Position = UDim2.new(0, 0, 0, 0)

    -- Slider functionality
    local dragging = false

    SliderKnob.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
        end
    end)

    SliderKnob.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)

    SliderKnob:GetPropertyChangedSignal("Position"):Connect(function()
        local value = math.clamp((SliderKnob.Position.X.Scale * max), min, max)
        callback(value)
    end)

    return SliderFrame
end

-- Function to create a textbox
function UILibrary:CreateTextbox(parent, placeholder, callback)
    local Textbox = Instance.new("TextBox")
    local UICorner = Instance.new("UICorner")

    Textbox.Parent = parent
    Textbox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Textbox.Size = UDim2.new(0, 300, 0, 40)
    Textbox.Font = Enum.Font.Gotham
    Textbox.Text = ""
    Textbox.PlaceholderText = placeholder
    Textbox.PlaceholderColor3 = Color3.fromRGB(180, 180, 180)
    Textbox.TextColor3 = Color3.fromRGB(255, 255, 255)
    Textbox.TextSize = 16
    Textbox.BorderSizePixel = 0

    -- Rounded corners for the textbox
    UICorner.CornerRadius = UDim.new(0, 8)
    UICorner.Parent = Textbox

    Textbox.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            callback(Textbox.Text)
        end
    end)

    return Textbox
end

return UILibrary
