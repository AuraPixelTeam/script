
function play()
    local playArgs = {
        [1] = {
            ["\3"] = {
                [1] = {
                    [1] = "Skip",
                    ["n"] = 1
                }
            }
        },
        [2] = {}
    }
    game:GetService("ReplicatedStorage").ReliableRedEvent:FireServer(unpack(playArgs))
end

if game.PlaceId == 16347800591 then
    wait(2)
    
    if getgenv().EventHlw.Join_Hlw then
        local teleportPosition = CFrame.new(90.8879166, 290.062073, -122.492111, 0.972313702, 0, 0.233679399, 0, 1, 0, -0.233679399, 0, 0.972313702)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = teleportPosition

        wait(1)

        local playhlw = {
            [1] = {
                ["\8"] = {
                    [1] = {
                        [1] = "Haunted Circus",
                        [2] = "Hard",
                        [3] = getgenv().Setting.Allow_Friends,
                        ["n"] = 3
                    }
                }
            },
            [2] = {}
        }

        game:GetService("ReplicatedStorage").ReliableRedEvent:FireServer(unpack(playhlw))
        wait(1)
        play()
    end
    
    if getgenv().AutoAbility.Gojo then
        spawn(function()
            while getgenv().AutoAbility.Gojo do
                local autoability = {
                    [1] = "UseAbility",
                    [2] = workspace.Units.GojoEvo
                }

                game:GetService("ReplicatedStorage").EventsAndFunctions.RemoteFunctions.InteractUnit:InvokeServer(unpack(autoability))

                wait(3) 
            end
        end)
    end

    if getgenv().AutoAbility.Sukuna then
        spawn(function()
            while getgenv().AutoAbility.Sukuna do
                local args = {
                    [1] = "UseAbility",
                    [2] = workspace.Units.SukunaEvo
                }

                game:GetService("ReplicatedStorage").EventsAndFunctions.RemoteFunctions.InteractUnit:InvokeServer(unpack(args))

                wait(3) 
            end
        end)
    end

    if getgenv().JoinRaid.Green_Planet_Destroyed then
        local args = {
            [1] = {
                ["\7"] = {
                    [1] = {
                        [1] = "Green Planet Destroyed",
                        [2] = "Hard",
                        [3] = getgenv().Setting.Allow_Friends,
                        ["n"] = 3
                    }
                }
            },
            [2] = {}
        }
        game:GetService("ReplicatedStorage").ReliableRedEvent:FireServer(unpack(args))
        wait(1)
        play()
    end

    if getgenv().JoinRaid.Hollow_Desert then
        local args = {
            [1] = {
                ["\7"] = {
                    [1] = {
                        [1] = "Hollow Desert",
                        [2] = "Hard",
                        [3] = getgenv().Setting.Allow_Friends,
                        ["n"] = 3
                    }
                }
            },
            [2] = {}
        }
        game:GetService("ReplicatedStorage").ReliableRedEvent:FireServer(unpack(args))
        wait(1)
        play()
    end

    if getgenv().JoinRaid.Red_Palace then
        local args = {
            [1] = {
                ["\7"] = {
                    [1] = {
                        [1] = "Red Palace",
                        [2] = "Hard",
                        [3] = getgenv().Setting.Allow_Friends,
                        ["n"] = 3
                    }
                }
            },
            [2] = {}
        }
        game:GetService("ReplicatedStorage").ReliableRedEvent:FireServer(unpack(args))
        wait(1)
        play()
    end

    if getgenv().JoinRaid.Sorcery_Academy then
        local args = {
            [1] = {
                ["\7"] = {
                    [1] = {
                        [1] = "Sorcery Academy",
                        [2] = "Hard",
                        [3] = getgenv().Setting.Allow_Friends,
                        ["n"] = 3
                    }
                }
            },
            [2] = {}
        }
        game:GetService("ReplicatedStorage").ReliableRedEvent:FireServer(unpack(args))
        wait(1)
        play()
    end

else
    for i = 1, getgenv().Setting.Speed do
        game:GetService("ReplicatedStorage").EventsAndFunctions.RemoteFunctions.ChangeGameSpeed:InvokeServer()
    end
end
