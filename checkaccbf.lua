

repeat wait() until game:IsLoaded() and game.Players.LocalPlayer:FindFirstChild("DataLoaded")
repeat
    pcall(function()
        if game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("Main"):FindFirstChild("ChooseTeam") then
            if getgenv().Teams == "Marines" then
                for r, v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Marines.Frame.TextButton.Activated)) do
                    v.Function()
                end
            elseif getgenv().Teams == "Pirates" then
                for r, v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.TextButton.Activated)) do
                    v.Function()
                end
            else
                for r, v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Marines.Frame.TextButton.Activated)) do
                    v.Function()
                end
            end
        end
    end)
until game.Players.LocalPlayer.Team ~= nil
repeat

until game.Players.LocalPlayer.Data.Fragments.Value and game.Players.LocalPlayer.Data.Beli.Value
getgenv().fraglimit = 20000
getgenv().exeucteautochange = true
getgenv().checkv3 = true
local function CheckRace()
    local bf = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Wenlocktoad", "1")
    local c4 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Alchemist", "1")
    if game.Players.LocalPlayer.Character:FindFirstChild("RaceTransformed") then
        return game:GetService("Players").LocalPlayer.Data.Race.Value .. " V4"
    end
    if bf == -2 then
        return game:GetService("Players").LocalPlayer.Data.Race.Value .. " V3"
    end
    if c4 == -2 then
        return game:GetService("Players").LocalPlayer.Data.Race.Value .. " V2"
    end
    return game:GetService("Players").LocalPlayer.Data.Race.Value .. " V1"
end;
function getypeaccc()
    local havegod = false
    local beli = game.Players.LocalPlayer.Data.Beli.Value
    local frag = game.Players.LocalPlayer.Data.Fragments.Value
    if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyGodhuman", true) then
        havegod = true
    end
    --print(Res)
    local weapon = {}
    for i, v in next, game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventory") do
        if v.Name == "Soul Guitar" then
            table.insert(weapon, v.Name)
        end
        if v.Name == "Cursed Dual Katana" then
            table.insert(weapon, v.Name)
        end
        if v.Name == "Mirror Fractal" then
            table.insert(weapon, v.Name)
        end
        if v.Name == "Valkyrie Helm" then
            table.insert(weapon, v.Name)
        end
    end
    if getgenv().checkv3 then
        if not table.find(weapon, "Valkyrie Helm") and not table.find(weapon, "Mirror Fractal") then 
            return "No Conditions For Change Acc"
        end
        if table.find(weapon, "Valkyrie Helm") and table.find(weapon, "Mirror Fractal") and havegod and (beli >= 2500000 and frag >= getgenv().fraglimit) then
            if table.find(weapon, "Cursed Dual Katana") and table.find(weapon, "Soul Guitar") and beli >= 2500000 and frag >= getgenv().fraglimit and string.find(CheckRace(), "V3") then
                return "GOD CDK SGT MM Have V3"
            elseif table.find(weapon, "Cursed Dual Katana") and table.find(weapon, "Soul Guitar") and beli >= 2500000 and frag >= getgenv().fraglimit and not string.find(CheckRace(), "V3") then
                return "GOD CDK SGT MM Don't V3"
            elseif table.find(weapon, "Cursed Dual Katana") and not table.find(weapon, "Soul Guitar") and beli >= 2500000 and frag >= getgenv().fraglimit and string.find(CheckRace(), "V3") then
                return "GOD CDK MM Have V3"
            elseif table.find(weapon, "Cursed Dual Katana") and not table.find(weapon, "Soul Guitar") and beli >= 2500000 and frag >= getgenv().fraglimit and not string.find(CheckRace(), "V3") then
                return "GOD CDK MM Don't V3"
            elseif not table.find(weapon, "Cursed Dual Katana") and table.find(weapon, "Soul Guitar") and beli >= 2500000 and frag >= getgenv().fraglimit and string.find(CheckRace(), "V3") then
                return "GOD SGT MM Have V3"
            elseif not table.find(weapon, "Cursed Dual Katana") and table.find(weapon, "Soul Guitar") and beli >= 2500000 and frag >= getgenv().fraglimit and not string.find(CheckRace(), "V3") then
                return "GOD SGT MM Don't V3"
            elseif not table.find(weapon, "Cursed Dual Katana") and not table.find(weapon, "Soul Guitar") and beli >= 2500000 and frag >= getgenv().fraglimit and string.find(CheckRace(), "V3") then
                return "GOD MM Have V3"
            elseif not table.find(weapon, "Cursed Dual Katana") and not table.find(weapon, "Soul Guitar") and beli >= 2500000 and frag >= getgenv().fraglimit and not string.find(CheckRace(), "V3") then
                return "GOD MM Don't Have V3"
            elseif not table.find(weapon, "Cursed Dual Katana") and not table.find(weapon, "Soul Guitar") and string.find(CheckRace(), "V3") then
                return "No Conditions For Change Acc"
            end
        else
            return "No Conditions For Change Acc"
        end
    end
    if not getgenv().checkv3 then
        if table.find(weapon, "Valkyrie Helm") and table.find(weapon, "Mirror Fractal") and havegod and (beli >= 2500000 and frag >= getgenv().fraglimit) then
            if table.find(weapon, "Cursed Dual Katana") and table.find(weapon, "Soul Guitar") and beli >= 2500000 and frag >= getgenv().fraglimit then
                return "GOD CDK SGT MM"
            elseif table.find(weapon, "Cursed Dual Katana") and not table.find(weapon, "Soul Guitar") and beli >= 2500000 and frag >= getgenv().fraglimit then
                return "GOD CDK MM"
            elseif not table.find(weapon, "Cursed Dual Katana") and table.find(weapon, "Soul Guitar") and beli >= 2500000 and frag >= getgenv().fraglimit then
                return "GOD SGT MM"
            elseif not table.find(weapon, "Cursed Dual Katana") and not table.find(weapon, "Soul Guitar") and beli >= 2500000 and frag >= getgenv().fraglimit then
                return "GOD MM"
            elseif not table.find(weapon, "Cursed Dual Katana") and not table.find(weapon, "Soul Guitar") then
                return "No Conditions For Change Acc"
            end
        else
            return "No Conditions For Change Acc"
        end
    end
end

function writefileyummy()
    writefile(game.Players.LocalPlayer.Name .. ".txt", "Completed-" .. tostring(getypeaccc()))
end

function getPlayerStats()
    local playerData = game.Players.LocalPlayer
    local stats = playerData:FindFirstChild("Data") and playerData.Data:FindFirstChild("Stats")
    
    if not stats then
        warn("Stats not found for player: " .. playerData.Name)
        return nil, nil, nil, nil, nil
    end
    
    local level = stats:FindFirstChild("Level") and stats.Level.Value or 0
    local exp = stats:FindFirstChild("Exp") and stats.Exp.Value or 0
    local beli = stats:FindFirstChild("Beli") and stats.Beli.Value or 0
    local fragments = stats:FindFirstChild("Fragments") and stats.Fragments.Value or 0
    local devilFruit = stats:FindFirstChild("DevilFruit") and stats.DevilFruit.Value or "None"
    
    return level, exp, beli, fragments, devilFruit
end


function getPlayerRace()
    local playerData = game.Players.LocalPlayer
    local race = playerData:WaitForChild("Data"):WaitForChild("Race").Value
    return race
end

function getWeapons()
    local weapons = {}
    local backpack = game.Players.LocalPlayer:WaitForChild("Backpack")
    
    for _, weapon in ipairs(backpack:GetChildren()) do
        table.insert(weapons, weapon.Name)
    end
    
    return table.concat(weapons, ", ")
end

function sendWebhook()
    local level, exp, beli, fragments, devilFruit = getPlayerStats()
    local race = getPlayerRace()
    local weapons = getWeapons()
    local accountType = getypeaccc()
    
    local Message = {
        ["embeds"] = {
            {
                ["title"] = "JG Checker BF",
                ["type"] = "rich",
                ["color"] = tonumber(0x58b9ff),
                ["fields"] = {
                    {
                        ["name"] = "Players Stats:",
                        ["value"] = string.format("• Username:|| %s ||\n• Level: %d\n• Exp: %d\n• Beli: %d\n• Fragments: %d\n• Devil Fruit: %s", 
                                                 game.Players.LocalPlayer.Name, level, exp, beli, fragments, devilFruit),
                        ["inline"] = false
                    },
                    {
                        ["name"] = "Player:",
                        ["value"] = string.format("• Race: %s\n• Weapon: %s", race, weapons),
                        ["inline"] = false
                    },
                    {
                        ["name"] = "Type Acc:",
                        ["value"] = string.format("• %s", accountType),
                        ["inline"] = false
                    }
                },
                ["footer"] = {
                    ["text"] = "JG Checker BF"
                },
                ["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%SZ"),
                ["thumbnail"] = {
                    ["url"] = ""
                }
            }
        }
    }

    local DataCallBack = request({
        Url = getgenv().Webhook,
        Method = 'POST',
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = game:GetService("HttpService"):JSONEncode(Message)
    })
end

local ScreenGui = Instance.new("ScreenGui");
local DropShadowHolder = Instance.new("Frame");
local DropShadow = Instance.new("ImageLabel");
local Main = Instance.new("Frame");
local UICorner = Instance.new("UICorner");
local UIStroke = Instance.new("UIStroke");
local UIGradient = Instance.new("UIGradient");
local Top = Instance.new("TextLabel");
local UIGradient1 = Instance.new("UIGradient");
local Under = Instance.new("TextLabel");
local UIGradient2 = Instance.new("UIGradient");

for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui:GetChildren()) do
    if v.Name == 'CoinCard' then
        v:Destroy()
    end
end

ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = game:GetService("Players").LocalPlayer.PlayerGui
ScreenGui.Name = 'CoinCard'


local DiscordUrlTextLabel = Instance.new("TextLabel", ScreenGui);
DiscordUrlTextLabel["BorderSizePixel"] = 0;
DiscordUrlTextLabel["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
DiscordUrlTextLabel["TextSize"] = 16;
DiscordUrlTextLabel["FontFace"] = Font.new([[rbxasset://fonts/families/RobotoMono.json]], Enum.FontWeight.Bold,
    Enum.FontStyle.Normal);
DiscordUrlTextLabel["TextColor3"] = Color3.fromRGB(0, 0, 0);
DiscordUrlTextLabel["BackgroundTransparency"] = 1;
DiscordUrlTextLabel["AnchorPoint"] = Vector2.new(0.5, 0.5);
DiscordUrlTextLabel["Size"] = UDim2.new(0, 200, 0, 50);
DiscordUrlTextLabel["BorderColor3"] = Color3.fromRGB(255, 255, 255);
DiscordUrlTextLabel["Text"] = [[JG Auto Change Account BF]];
DiscordUrlTextLabel["Position"] = UDim2.new(0.5, 0, -0.025, 0);

local DiscordUrlUiStroke = Instance.new("UIStroke", DiscordUrlTextLabel);
DiscordUrlUiStroke["Color"] = Color3.fromRGB(255, 255, 255);

local DiscordUrlUiGradient = Instance.new("UIGradient", DiscordUrlUiStroke);
GDiscordUrlUiGradient = ColorSequence.new {
    ColorSequenceKeypoint.new(0, Color3.fromRGB(225, 164, 194)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(142, 66, 133))
};



DropShadowHolder.AnchorPoint = Vector2.new(0.5, 0.5)
DropShadowHolder.BackgroundTransparency = 1
DropShadowHolder.BorderSizePixel = 0
DropShadowHolder.Position = UDim2.new(0.5, 0, 0.1, 0)
DropShadowHolder.Size = UDim2.new(0, 500, 0, 68)
DropShadowHolder.ZIndex = 0
DropShadowHolder.Name = "DropShadowHolder"
DropShadowHolder.Parent = ScreenGui

DropShadow.Image = "rbxassetid://6015897843"
DropShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
DropShadow.ImageTransparency = 0.5
DropShadow.ScaleType = Enum.ScaleType.Slice
DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)
DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
DropShadow.BackgroundTransparency = 1
DropShadow.BorderSizePixel = 0
DropShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
DropShadow.Size = UDim2.new(1, 47, 1, 47)
DropShadow.ZIndex = 0
DropShadow.Name = "DropShadow"
DropShadow.Parent = DropShadowHolder

Main.AnchorPoint = Vector2.new(0.5, 0.5)
Main.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Main.BackgroundTransparency = 0.5
Main.BorderColor3 = Color3.fromRGB(255, 255, 255)
Main.BorderSizePixel = 1
Main.Position = UDim2.new(0.5, 0, 0.5, 0)
Main.Size = UDim2.new(1, -47, 1, -47)
Main.Name = "Main"
Main.Parent = DropShadow

UIGradient.Color = ColorSequence.new {
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
}
UIGradient.Parent = UIStroke

Top.Font = Enum.Font.GothamBold
Top.Text = "Let the music play"
Top.TextColor3 = Color3.fromRGB(255, 255, 255)
Top.TextSize = 16.5
Top.TextYAlignment = Enum.TextYAlignment.Bottom
Top.AnchorPoint = Vector2.new(0.5, 0)
Top.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Top.BackgroundTransparency = 0.9990000128746033
Top.BorderColor3 = Color3.fromRGB(255, 255, 255)
Top.BorderSizePixel = 1
Top.Position = UDim2.new(0.5, 0, 0, 15)
Top.Size = UDim2.new(0, 500, 0, 18)
Top.Name = "Top"
Top.Parent = Main

UIGradient1.Color = ColorSequence.new {
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
}
UIGradient1.Parent = Top

Under.Font = Enum.Font.GothamBold
Under.Text = "Script started!"
Under.TextColor3 = Color3.fromRGB(255, 255, 255)
Under.TextSize = 18
Under.TextYAlignment = Enum.TextYAlignment.Bottom
Under.AnchorPoint = Vector2.new(0.5, 0)
Under.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Under.BackgroundTransparency = 0.9990000128746033
Under.BorderColor3 = Color3.fromRGB(255, 255, 255)
Under.BorderSizePixel = 1
Under.Position = UDim2.new(0.5, 0, 0, 35)
Under.Size = UDim2.new(0, 500, 0, 18)
Under.Name = "Under"
Under.Parent = Main

UIGradient2.Color = ColorSequence.new {
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
}
UIGradient2.Parent = Under
Top.Size = UDim2.new(0, Top.TextBounds.X, 0, 18)
Under.Size = UDim2.new(0, Under.TextBounds.X, 0, 18)
if Top.Size.X.Offset > Under.Size.X.Offset then
    DropShadowHolder.Size = UDim2.new(0, Top.TextBounds.X + 50, 0, 68)
else
    DropShadowHolder.Size = UDim2.new(0, Under.TextBounds.X + 50, 0, 68)
end
Top:GetPropertyChangedSignal("Text"):Connect(function()
    Top.Size = UDim2.new(0, Top.TextBounds.X, 0, 18)
    if Top.Size.X.Offset > Under.Size.X.Offset then
        DropShadowHolder.Size = UDim2.new(0, Top.TextBounds.X + 50, 0, 68)
    else
        DropShadowHolder.Size = UDim2.new(0, Under.TextBounds.X + 50, 0, 68)
    end
end)
Under:GetPropertyChangedSignal("Text"):Connect(function()
    Under.Size = UDim2.new(0, Under.TextBounds.X, 0, 18)
    if Top.Size.X.Offset > Under.Size.X.Offset then
        DropShadowHolder.Size = UDim2.new(0, Top.TextBounds.X + 50, 0, 68)
    else
        DropShadowHolder.Size = UDim2.new(0, Under.TextBounds.X + 50, 0, 68)
    end
end)

Top.Text = "Username: "
Under.Text = "Type Account: "
function ContentSet(Content1, Content2)
    if not Content1 then Content1 = 'None (Not Found)' end
    if not Content2 or Content2 == '' then Content2 = 'None' end
    Top.Text = "Username: " .. Content1
    Under.Text = "Type Account: " .. Content2
end

ContentSet(game.Players.LocalPlayer.Name, getypeaccc())
writefileyummy()
print(getypeaccc(), readfile(game.Players.LocalPlayer.Name .. ".txt"))
sendWebhook()