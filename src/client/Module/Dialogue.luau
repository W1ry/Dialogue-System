local UIS = game:GetService("UserInputService")

local GetNPCData = game.ReplicatedStorage.GetNPCData

local Dialogue = {}
Dialogue.__index = Dialogue

type DialogueClass = typeof(setmetatable(Dialogue, {} :: {}))

function Dialogue.new(InteractionPopUp)
    local self = setmetatable({
        InteractionPopUp = InteractionPopUp
    }, Dialogue)

    return self
end

function Dialogue.Start(self : DialogueClass)
    
end

function Dialogue.Cancel(self : DialogueClass)
    
end

function Dialogue.Stop(self : DialogueClass)
    
end

local DialogueController = {}

function DialogueController.Init(self)

end

function DialogueController.Start(self)
    UIS.InputBegan:Connect(function(input : InputObject, g : boolean)  
        if g then return end
        if input.KeyCode == Enum.KeyCode.E then
            
        end
    end)
end

return DialogueController