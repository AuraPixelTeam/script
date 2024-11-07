
if game.PlaceId == 16347800591 then
    wait(2)
    
    if getgenv().Autojoinhlw then
        local teleportPosition = CFrame.new(90.8879166, 290.062073, -122.492111, 0.972313702, 0, 0.233679399, 0, 1, 0, -0.233679399, 0, 0.972313702)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = teleportPosition

        wait(1)

        local playhlw = {
            [1] = {
                ["\8"] = {
                    [1] = {
                        [1] = "Haunted Circus",
                        [2] = "Hard",
                        [3] = getgenv().Allow_Friends,
                        ["n"] = 3
                    }
                }
            },
            [2] = {}
        }

        game:GetService("ReplicatedStorage").ReliableRedEvent:FireServer(unpack(playhlw))

        wait(1)

        local play = {
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

        game:GetService("ReplicatedStorage").ReliableRedEvent:FireServer(unpack(play))
    end
    
    
    if getgenv().AutoAbility_Gojo then
        spawn(function()
            while getgenv().AutoAbility_Gojo do
                local autoability = {
                    [1] = "AutoAbility",
                    [2] = workspace.Units.GojoEvo
                }

                game:GetService("ReplicatedStorage").EventsAndFunctions.RemoteFunctions.InteractUnit:InvokeServer(unpack(autoability))

                wait(3) 
            end
        end)
    end

    
    if getgenv().AutoAbility_Sukuna then
        spawn(function()
            while getgenv().AutoAbility_Sukuna do
                local args = {
                    [1] = "UseAbility",
                    [2] = workspace.Units.SukunaEvo
                }

                game:GetService("ReplicatedStorage").EventsAndFunctions.RemoteFunctions.InteractUnit:InvokeServer(unpack(args))

                wait(3) 
            end
        end)
    end
else
    for i = 1, getgenv().Speed do
        game:GetService("ReplicatedStorage").EventsAndFunctions.RemoteFunctions.ChangeGameSpeed:InvokeServer()
    end
end
