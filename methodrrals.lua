
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local username = player.Name
local HttpService = game:GetService("HttpService")
local requestt = http_request or request or syn.request
local FileSys = loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Main/main/Library/File_System.lua"))()
do
  FileSys:GetFolder("JG")
  FileSys:GetFolder("JG/ALS")
  FileSys:GetFile("JG/ALS" .. username .. "_playerstats.json")
end
local headers = {
    ["Content-Type"] = "application/json"
}

function GetRewards()
    local rewardsPath = game:GetService("Players").LocalPlayer:FindFirstChild("PlayerGui"):FindFirstChild("EndGameUI"):FindFirstChild("BG"):FindFirstChild("Container"):FindFirstChild("Rewards"):FindFirstChild("Holder")
    local rewardList = {}

    if rewardsPath then
        for _, item in pairs(rewardsPath:GetChildren()) do
            if not item.Name:match("^UI") then 
                local amount = "Unknown"
                local amountInstance = item:FindFirstChild("Amount")
                if amountInstance then
                    if amountInstance:IsA("TextLabel") or amountInstance:IsA("TextButton") then
                        amount = amountInstance.Text 
                    elseif amountInstance:IsA("IntValue") or amountInstance:IsA("NumberValue") then
                        amount = amountInstance.Value 
                    end
                end
                table.insert(rewardList, item.Name .. " " .. amount)
            end
        end
    end

    return rewardList
end

function GetMapInfo()
    local map = game:GetService("Workspace"):FindFirstChild("Map")
    local mapName = ""
    local mapDifficulty = ""

    if map then
        local mapNameInstance = map:FindFirstChild("MapName")
        local mapDifficultyInstance = map:FindFirstChild("MapDifficulty")

        if mapNameInstance and mapNameInstance:IsA("StringValue") then
            mapName = mapNameInstance.Value 
        end

        if mapDifficultyInstance and mapDifficultyInstance:IsA("StringValue") then
            mapDifficulty = mapDifficultyInstance.Value
        end
    end

    return mapName, mapDifficulty
end

function GetStats()
    local statsPath = game:GetService("Players").LocalPlayer:FindFirstChild("PlayerGui"):FindFirstChild("EndGameUI"):FindFirstChild("BG"):FindFirstChild("Container"):FindFirstChild("Stats")
    local endWave = "Unknown"
    local elapsedTime = "Unknown"

    if statsPath then
        local endWaveInstance = statsPath:FindFirstChild("EndWave")
        local elapsedTimeInstance = statsPath:FindFirstChild("ElapsedTime")

        if endWaveInstance and endWaveInstance:IsA("TextLabel") then
            endWave = endWaveInstance.Text
        end

        if elapsedTimeInstance and elapsedTimeInstance:IsA("TextLabel") then
            elapsedTime = elapsedTimeInstance.Text 
        end
    end

    return endWave, elapsedTime
end

function LoadPlayerStats()
    local stats = {}
    if isfile(fileName) then
        local fileContent = readfile(fileName)
        stats = HttpService:JSONDecode(fileContent)
    else
        warn("Player stats file not found: " .. fileName)
    end

    return stats
end

function Webhook()
    local rewards = GetRewards()
    local mapName, mapDifficulty = GetMapInfo() 
    local endWave, elapsedTime = GetStats()
    local playerStats = LoadPlayerStats()

    local rewardField = {
        ["name"] = 'Reward',
        ["value"] = '',
        ["inline"] = false
    }

    if #rewards > 0 then
        rewardField["value"] = "+ " .. table.concat(rewards, "\n+ ")
    else
        rewardField["value"] = "No rewards found."
    end

    local statsField = {
        ["name"] = 'Stats',
        ["value"] = "• Map Name: " .. mapName .. "\n" ..
                    "• Difficulty: " .. mapDifficulty .. "\n" ..
                    "• " .. endWave .. "\n" ..
                    "• " .. elapsedTime,
        ["inline"] = false
    }

    local playerStatsField = {
        ["name"] = 'Player Stats',
        ["value"] = "• EXP: " .. (playerStats.EXP or "Not Found") .. "\n" ..
                    "• Gold: " .. (playerStats.Gold or "Not Found") .. "\n" ..
                    "• Emeralds: " .. (playerStats.Emeralds or "Not Found") .. "\n" ..
                    "• Jewels: " .. (playerStats.Jewels or "Not Found") .. "\n" ..
                    "• Halloween Currency: " .. (playerStats.Halloween_currency or "Not Found") .. "\n" ..
                    "• Rerolls: " .. (playerStats.Rerolls or "Not Found"),
        ["inline"] = false
    }

    local data = {
        ["embeds"] = {
            {
                ["title"] = "JG ALS",
                ["type"] = "rich",
                ["color"] = tonumber(0x58b9ff),
                ["fields"] = {
                    {
                        ["name"] = 'Name',
                        ["value"] = "||"..game:GetService("Players").LocalPlayer.Name.."||",
                        ["inline"] = false
                    },
                    playerStatsField,
                    statsField,
                    rewardField
                    
                }
            }
        }
    }

    local newdata = HttpService:JSONEncode(data)
    requestt({Url = getgenv().Webhook, Body = newdata, Method = "POST", Headers = headers})
end

function SavePlayerStats()
    local stats = {}
    local playerFolder = game:GetService("Players"):FindFirstChild(username)

    if playerFolder then
        local currencyFiles = {"EXP", "Gold", "Emeralds", "Jewels", "Halloween_currency", "Rerolls"}
        for _, currency in pairs(currencyFiles) do
            local valueInstance = playerFolder:FindFirstChild(currency)
            if valueInstance then
                stats[currency] = valueInstance:IsA("IntValue") and valueInstance.Value or "Unknown"
            else
                stats[currency] = "Not Found"
            end
        end
    end

    local path = "JG/ALS/"
    local fileName = path .. username .. "_playerstats.json"
    local success, err = pcall(function()
        FileSys:WriteFile(fileName, stats)
    end)

    if success then
        print("Player stats saved to " .. fileName)
    else
        warn("Failed to save player stats: " .. err)
    end
end

if game.PlaceId == 12886143095 then
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "BlackScreenGui"
    screenGui.Parent = playerGui

    local blackFrame = Instance.new("Frame")
    blackFrame.Size = UDim2.new(1, 0, 1, 0) 
    blackFrame.Position = UDim2.new(0, 0, 0, 0) 
    blackFrame.BackgroundColor3 = Color3.new(0, 0, 0)
    blackFrame.BackgroundTransparency = 0
    blackFrame.Parent = screenGui

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(0, 300, 0, 50)
    titleLabel.Position = UDim2.new(0.5, -150, 0.4, -25)
    titleLabel.Text = "JG ALS Farm Reroll" 
    titleLabel.TextColor3 = Color3.new(1, 1, 1) 
    titleLabel.BackgroundTransparency = 1
    titleLabel.TextScaled = true
    titleLabel.Parent = screenGui

    local authorLabel = Instance.new("TextLabel")
    authorLabel.Size = UDim2.new(0, 300, 0, 50) 
    authorLabel.Position = UDim2.new(0.5, -150, 0.5, -25)
    authorLabel.Text = "Made by: Jung Ganmyeon"
    authorLabel.TextColor3 = Color3.new(1, 1, 1)
    authorLabel.BackgroundTransparency = 1
    authorLabel.TextScaled = true
    authorLabel.Parent = screenGui
    SavePlayerStats()

    local character = player.Character or player.CharacterAdded:Wait()
    local hrp = character:WaitForChild("HumanoidRootPart")
    hrp.CFrame = CFrame.new(28.35157585144043, 3.89143967628479, -40.04119110107422)

    while true do
        local playinfcastle = {
            [1] = "Play",
            [2] = 0,
            [3] = true
        }
        game:GetService("ReplicatedStorage").Remotes.InfiniteCastleManager:FireServer(unpack(playinfcastle))

        wait(4)  
       
    end
else
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "BlackScreenGui"
    screenGui.Parent = playerGui

    local blackFrame = Instance.new("Frame")
    blackFrame.Size = UDim2.new(1, 0, 1, 0) 
    blackFrame.Position = UDim2.new(0, 0, 0, 0) 
    blackFrame.BackgroundColor3 = Color3.new(0, 0, 0)
    blackFrame.BackgroundTransparency = 0
    blackFrame.Parent = screenGui

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(0, 300, 0, 50)
    titleLabel.Position = UDim2.new(0.5, -150, 0.4, -25)
    titleLabel.Text = "JG ALS Farm Reroll" 
    titleLabel.TextColor3 = Color3.new(1, 1, 1) 
    titleLabel.BackgroundTransparency = 1
    titleLabel.TextScaled = true
    titleLabel.Parent = screenGui

    local authorLabel = Instance.new("TextLabel")
    authorLabel.Size = UDim2.new(0, 300, 0, 50) 
    authorLabel.Position = UDim2.new(0.5, -150, 0.5, -25)
    authorLabel.Text = "Made by: Jung Ganmyeon"
    authorLabel.TextColor3 = Color3.new(1, 1, 1)
    authorLabel.BackgroundTransparency = 1
    authorLabel.TextScaled = true
    authorLabel.Parent = screenGui

    while true do  
        local slot1Name = player:WaitForChild("Slots"):WaitForChild("Slot1").Value
        local argsPlace = {
            [1] = slot1Name,
            [2] = CFrame.new(-153.9479217529297, 203.8927764892578, 4.945199966430664) * CFrame.Angles(0, 0, 0)
        }
        game:GetService("ReplicatedStorage").Remotes.PlaceTower:FireServer(unpack(argsPlace))
        wait(1)
        
        local argsUpgrade = {
            [1] = workspace.Towers[slot1Name]
        }
        game:GetService("ReplicatedStorage").Remotes.Upgrade:InvokeServer(unpack(argsUpgrade))
        
        local speed = {
            [1] = true
         }

         game:GetService("ReplicatedStorage").Remotes.VoteChangeTimeScale:FireServer(unpack(speed))

        local gameEnded = game:GetService("ReplicatedStorage"):WaitForChild("GameEnded")
        if gameEnded.Value then
            Webhook()
            
            print("Game has ended. Teleporting back...")
            wait(3)
            local teleportArgs = {
                [1] = player 
            }

            game:GetService("ReplicatedStorage").Remotes.TeleportBack:FireServer(unpack(teleportArgs))
            break
        end
    end
end
