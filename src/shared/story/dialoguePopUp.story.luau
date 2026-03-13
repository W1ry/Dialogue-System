local ReplicatedFirst = game:GetService("ReplicatedFirst")
local Fusion = require(game.ReplicatedStorage.Packages.fusion)

local UserInputService = game:GetService("UserInputService")

local Children = Fusion.Children

local UI = ReplicatedFirst.Client.UI

local ActionKey = require(UI.Components.ActionKey)

local controls = {
    PopUp = true,
    Pressed = false
}


local story = { 
   fusion = Fusion,
   controls = controls,
   story = function(props)
      local scope = props.scope
      local control = props.controls

      local component = scope:New "Frame" {
         Parent = props.target,
         Size = UDim2.fromOffset(150, 150),
         BackgroundTransparency = 0.5,

         [Children] = {
            ActionKey(scope, {
                PopUp = control.PopUp,
                Pressed = control.Pressed
            })
         }
      }
   end,
}

return story