local UILibrary = {}

function UILibrary:CreateUI(title)
    local ScreenGui = Instance.new("ScreenGui")
    local Frame = Instance.new("Frame")
    local Title = Instance.new("TextLabel")
    
    ScreenGui.Name = "ModernUI"
    ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    
    Frame.Name = "MainFrame"
    Frame.Parent = ScreenGui
    Frame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
    Frame.BorderSizePixel = 0
    Frame.Position = UDim2.new(0.3, 0, 0.3, 0)
    Frame.Size = UDim2.new(0, 400, 0, 300)
    
    Title.Name = "Title"
    Title.Parent = Frame
    Title.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
    Title.BorderSizePixel = 0
    Title.Size = UDim2.new(1, 0, 0, 50)
    Title.Font = Enum.Font.GothamBold
    Title.Text = title
    Title.TextColor3 = Color3.new(1, 1, 1)
    Title.TextSize = 18
    
    return Frame
end

function UILibrary:CreateButton(parent, text, callback)
    local Button = Instance.new("TextButton")
    Button.Parent = parent
    Button.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
    Button.BorderSizePixel = 0
    Button.Size = UDim2.new(0, 200, 0, 50)
    Button.Font = Enum.Font.Gotham
    Button.Text = text
    Button.TextColor3 = Color3.new(1, 1, 1)
    Button.TextSize = 16
    
    Button.MouseButton1Click:Connect(function()
        callback()
    end)
    
    return Button
end

function UILibrary:CreateSlider(parent, min, max, callback)
    local Slider = Instance.new("Frame")
    local Bar = Instance.new("Frame")
    local Knob = Instance.new("Frame")
    
    Slider.Parent = parent
    Slider.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
    Slider.BorderSizePixel = 0
    Slider.Size = UDim2.new(0, 300, 0, 30)
    
    Bar.Parent = Slider
    Bar.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
    Bar.BorderSizePixel = 0
    Bar.Size = UDim2.new(1, 0, 0.4, 0)
    Bar.Position = UDim2.new(0, 0, 0.3, 0)
    
    Knob.Parent = Bar
    Knob.BackgroundColor3 = Color3.new(1, 1, 1)
    Knob.Size = UDim2.new(0, 15, 1, 0)
    Knob.Position = UDim2.new(0, 0, 0, 0)
    Knob.BorderSizePixel = 0
    Knob.Draggable = true
    
    Knob:GetPropertyChangedSignal("Position"):Connect(function()
        local value = math.clamp((Knob.Position.X.Scale * max), min, max)
        callback(value)
    end)
    
    return Slider
end

-- Function to create a textbox
function UILibrary:CreateTextbox(parent, placeholder, callback)
    local Textbox = Instance.new("TextBox")
    Textbox.Parent = parent
    Textbox.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
    Textbox.BorderSizePixel = 0
    Textbox.Size = UDim2.new(0, 300, 0, 40)
    Textbox.Font = Enum.Font.Gotham
    Textbox.Text = ""
    Textbox.PlaceholderText = placeholder
    Textbox.PlaceholderColor3 = Color3.new(0.5, 0.5, 0.5)
    Textbox.TextColor3 = Color3.new(1, 1, 1)
    Textbox.TextSize = 16
    
    Textbox.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            callback(Textbox.Text)
        end
    end)
    
    return Textbox
end

return UILibrary
