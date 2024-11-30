
local focusItems = {
    "Hydra's Tail",
    "Sea King Fin",
    "Sea King Blood",
    "Sea's Wraith",
    "Crustacean Armor"
}

repeat wait() until game:IsLoaded() and game.Players.LocalPlayer:FindFirstChild("DataLoaded")

local HttpService = game:GetService("HttpService")
local requestt = http_request or request or syn.request
local player = game.Players.LocalPlayer
local headers = {
    ["Content-Type"] = "application/json"
}

local function formatNumber(number)
    return string.format("%0.0f", number):reverse():gsub("(%d%d%d)", "%1,"):reverse():gsub("^,", "")
end

local function checkFocusItems(folder)
    local focusResult = {}
    for _, item in pairs(folder:GetChildren()) do
        if not string.match(item.Name, "^UI") then
            local itemName = item.Name

            for _, focusItem in ipairs(focusItems) do
                if string.find(itemName, focusItem, 1, true) then
                    table.insert(focusResult, "• " .. itemName)
                end
            end
        end
    end
    return #focusResult > 0 and table.concat(focusResult, "\n") or "Đéo có"
end

local function scanItems(folder, includeAmount)
    local result = {}
    for _, item in pairs(folder:GetChildren()) do
        if not string.match(item.Name, "^UI") then
            local itemName = item.Name
            if includeAmount then
                local amountValue = item:FindFirstChild("Amount")
                local itemAmount = amountValue and amountValue.Text or "1"
                table.insert(result, "• " .. itemName .. ": " .. itemAmount)
            else
                table.insert(result, "• " .. itemName)
            end
        end
    end
    return #result > 0 and table.concat(result, "\n") or "Đéo có"
end

local function Webhook()
    local playerStatsFolder = player.PlayerStats
    local inventoryFolder = player.PlayerGui.MainGui.StarterFrame.Inventory_Frame

    local level = playerStatsFolder.lvl.Value
    local beli = formatNumber(playerStatsFolder.beli.Value)
    local gem = formatNumber(playerStatsFolder.Gem.Value)
    local materials = scanItems(inventoryFolder.ScrollingFrameMaterial, true) 
    local fruits = scanItems(inventoryFolder.ScrollingFrameFruits, true)
    local collectibles = scanItems(inventoryFolder.ScrollingFrameCollectible, false)
    local accessories = scanItems(inventoryFolder.ScrollingFrameAccessories, false)

    local focus = checkFocusItems(inventoryFolder.ScrollingFrameMaterial)
    local data = {
        ["embeds"] = {
            {
                ["title"] = "JG - KL Check",
                ["type"] = "rich",
                ["color"] = tonumber(0x58b9ff),
                ["fields"] = {
                    {
                        ["name"] = "Player Stats",
                        ["value"] = "☭ Player Name: " .. player.Name .. "\n" ..
                                    "☭ Level: " .. level .. "\n" ..
                                    "☭ Beli: " .. beli .. "\n" ..
                                    "☭ Gem: " .. gem,
                        ["inline"] = false
                    },
                    {
                        ["name"] = "Items",
                        ["value"] = "☭ Materials:\n" .. materials .. "\n" ..
                                    "☭ Fruits:\n" .. fruits .. "\n" ..
                                    "☭ Collectibles:\n" .. collectibles .. "\n" ..
                                    "☭ Accessories:\n" .. accessories,
                        ["inline"] = false
                    },
                    {
                        ["name"] = "Focus Items",
                        ["value"] = focus,
                        ["inline"] = false
                    }
                }
            }
        }
    }

    local newdata = HttpService:JSONEncode(data)
    requestt({Url = getgenv().Webhook, Body = newdata, Method = "POST", Headers = headers})
end

while wait(getgenv().Time) do
    Webhook()
end
