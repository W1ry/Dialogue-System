local RunService = game:GetService("RunService")
local CollectionService = game:GetService("CollectionService")
local ReplicatedFirst = game:GetService("ReplicatedFirst")

local Fusion = require(game.ReplicatedStorage:WaitForChild("Packages").fusion)
local Peek = Fusion.peek
local Children = Fusion.Children

local UI = ReplicatedFirst.Client.UI

local ActionKey = require(UI.Components.ActionKey)

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Mouse = Player:GetMouse()

local Tag = "DialogueInteraction"

local Radius = 10

local Camera = game.Workspace.CurrentCamera

local DialogueInteraction = {}

DialogueInteraction.scope = Fusion:scoped({
    KeyPopUp = ActionKey
})

function GetNearestModel(character: Model)
    local parts = workspace:GetPartBoundsInRadius(character.PrimaryPart.Position, Radius)
    for _, v in next, parts do
        local parent = v.Parent
        if parent:IsA("Model") and CollectionService:HasTag(parent, Tag) then
            return parent
        end
    end
end

function PopUp(model)
    if model then
        DialogueInteraction.Model:set(model)
        DialogueInteraction.ShowPopUp:set(true) 
    else
        DialogueInteraction.ShowPopUp:set(false)
    end
end

function DialogueInteraction.Init(self)
    local scope = DialogueInteraction.scope 
    DialogueInteraction.Model = scope:Value(nil)
    DialogueInteraction.ShowPopUp = scope:Value(false)
    DialogueInteraction.Pressed = scope:Value(false)
    local Adornee = scope:Computed(function(use, _)
        local model = use(DialogueInteraction.Model)
        return model and model.Head
    end)
    scope:New("BillboardGui") {
        LightInfluence = 1,
        SizeOffset = Vector2.new(0, 0.9),
        ClipsDescendants = true,
        Active = true,
        ResetOnSpawn = false,
        AlwaysOnTop = true,
        Size = UDim2.fromScale(1.5, 1.5),
        Adornee = Adornee,
        Parent = Player.PlayerGui,
        [Children] = {
            scope:KeyPopUp({PopUp = DialogueInteraction.ShowPopUp, Pressed = DialogueInteraction.Pressed})
        }
    }
end

function DialogueInteraction.Start(self)
    if self.Thread ~= nil then return warn("Already been started") end
    self.Thread = task.defer(function()
        while true do
            task.wait()
            local character = Player.Character
            if not character then continue end
            local interactableModel = GetNearestModel(character)
            PopUp(interactableModel)
        end
    end)
end

return DialogueInteraction