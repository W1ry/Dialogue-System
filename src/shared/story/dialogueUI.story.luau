local ReplicatedFirst = game:GetService("ReplicatedFirst")
local Fusion = require(game.ReplicatedStorage.Packages.fusion)

local Children = Fusion.Children

local UI = ReplicatedFirst.Client.UI

local Dialogue = require(UI.Components.Dialogue)

local useTypeWriter = require(UI.Hooks.useTypeWriter)

local DummyText = [[Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis congue neque vitae mi vehicula semper. Nulla facilisi. Nulla tempus luctus quam, quis semper dolor vestibulum in. Nunc nec semper ligula, at iaculis eros. Nunc facilisis viverra risus, non dictum diam volutpat nec. Nam velit augue, laoreet in erat eget, viverra sagittis augue. Donec aliquet scelerisque tortor. Nunc sed tristique purus, ut ullamcorper arcu. Nam euismod, libero eget egestas iaculis, arcu est hendrerit ipsum, sit amet varius ante lacus eu sapien. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi sed risus a urna ultrices maximus. Nunc ac hendrerit libero, eu fringilla ex. Pellentesque porta vitae lorem ut ornare.]]

local controls = {}

local story = { 
   fusion = Fusion,
   controls = controls,
   story = function(props)
      local scope = props.scope
      local speakerName = scope:Value("W1ry")
      local textContainer = scope:Value("")

      local typeWriter = useTypeWriter(scope, {
         TextValue = textContainer,
         FullText = DummyText,
         Interval = 0.5
      })

      local component = scope:New "Frame" {
         Parent = props.target,
         Size = UDim2.fromOffset(1980, 1080),
         BackgroundTransparency = 0.5,

         [Children] = Dialogue(scope, {
            SpeakerName = speakerName,
            TextContainer = textContainer
         })
      }
   end,
}

return story