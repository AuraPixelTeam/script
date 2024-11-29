

local playerName = game.Players.LocalPlayer.Name

local gameStates = {
    [1] = "Replay",
    [2] = "PlayNext",
    [3] = "ReturnToLobby"
}
local FileSys = loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Main/main/Library/File_System.lua"))()
    local filePath = "JG Hub/Anime Genesis/unitname.json"
    
    do
        FileSys:GetFolder("JG Hub")
        FileSys:GetFolder("JG Hub/Anime Genesis")
    end
    
    local locationFile = FileSys:GetFile(filePath)


if game.PlaceId == 18318589583 then
    for _, player in ipairs(game.Players:GetPlayers()) do
        local playerFolder = game.Workspace:FindFirstChild("UnitWalkFolder") and game.Workspace.UnitWalkFolder:FindFirstChild(playerName)
        
        if playerFolder then
            local jsonData = {}
            for index, child in ipairs(playerFolder:GetChildren()) do
                jsonData["unit" .. index] = child.Name
            end
            FileSys:WriteFile(filePath, game:GetService("HttpService"):JSONEncode(jsonData))
            print("Dữ liệu của người chơi " .. playerName .. " đã được ghi vào file JSON.")
        else
            print("Không tìm thấy thư mục của người chơi: " .. playerName)
        end
    end
else
    print("PlaceId không phải là 163628. Tiến hành thực thi mã cho các nơi khác.")
    
    local jsonData = FileSys:ReadFile(filePath)
    if not jsonData then
        error("Không tìm thấy file JSON hoặc file rỗng!")
    end
    
    local unitData = game:GetService("HttpService"):JSONDecode(jsonData)
    
    local function getUnitName(rawName)
        return string.match(rawName, "^[^%d%.]+") or rawName
    end

    local pathFolder = game.Workspace:FindFirstChild("Path")

    if pathFolder then
        local targetPart = pathFolder:FindFirstChild(tostring(getgenv().Path))
        if targetPart and targetPart:IsA("Part") then
            local targetCFrame = targetPart.CFrame
            while true do
                for key, value in pairs(unitData) do
                    local unitName = getUnitName(value)
                    local rawName = value
                    local place = {
                        [1] = unitName,
                        [2] = targetCFrame,
                        [3] = Vector3.new(0, 0, 0),
                        [4] = rawName
                    }
                    game:GetService("ReplicatedStorage").Remotes.CreateUnits:FireServer(unpack(place))

                    local success, err = pcall(function()
                        local unit = workspace.Unit[playerName][unitName] 
                        if unit then
                            local args = {
                                [1] = unit  
                            }
                            game:GetService("ReplicatedStorage").Remotes.Upgrades:FireServer(unpack(args))
                        else
                            error("Không tìm thấy unit: " .. unitName)
                        end
                    end)

                    if not success then
                        warn("Lỗi khi nâng cấp: " .. err)
                    end
                end
                task.wait(getgenv().Place)
            end
        end
    else
        error("Không tìm thấy thư mục Path trong Workspace")
    end
end

while true do
    if gameStates[getgenv().Game] then
        game:GetService("ReplicatedStorage").Remotes[gameStates[getgenv().Game]]:FireServer()
    else
        warn("Trạng thái game không hợp lệ!")
        break
    end
    task.wait(1)
end
