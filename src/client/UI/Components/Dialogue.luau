local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Fusion = require(ReplicatedStorage.Packages.fusion)
local Children = Fusion.Children

type Props = {
	Parent: Instance?,
	SpeakerName: Fusion.Value<string>,
	TextContainer: Fusion.Value<string>
}

local function Dialogue(scope: Fusion.Scope, props: Props)
	local speakerNameComp = scope:Computed(function(use, scope)
		return use(props.SpeakerName)
	end)

	local textContainerComp = scope:Computed(function(use, scope)
		return use(props.TextContainer)
	end)

	return scope:New("Frame")({
		Name = "Frame",
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundTransparency = 0.6,
		Position = UDim2.new(0.5, 0, 0.8, 0),
		BorderColor3 = Color3.fromHex("#000000"),
		BackgroundColor3 = Color3.fromHex("#646464"),
		BorderSizePixel = 0,
		Size = UDim2.new(0.8, 0, 0.3, 0),

		Parent = props.Parent,

		[Children] = {
			scope:New("TextLabel")({
				Name = "SpeakerName",
				TextWrapped = true,
				TextColor3 = Color3.fromHex("#000000"),
				Text = speakerNameComp,
				AnchorPoint = Vector2.new(0.1, 0.4),
				BackgroundColor3 = Color3.fromHex("#ffffff"),
				BorderSizePixel = 0,
				TextXAlignment = Enum.TextXAlignment.Left,
				FontFace = Font.new("rbxasset://fonts/families/HighwayGothic.json"),
				BorderColor3 = Color3.fromHex("#000000"),
				TextSize = 32,
				Size = UDim2.new(0, 200, 0, 50),

				[Children] = {
					scope:New("UICorner")({
						Name = "UICorner",
					}),
				},
			}),

			scope:New("TextLabel")({
				Name = "TextContainer",
				Text = textContainerComp,
				TextWrapped = true,
				TextColor3 = Color3.fromHex("#000000"),
				BackgroundColor3 = Color3.fromHex("#ffffff"),
				BorderSizePixel = 0,
				BorderColor3 = Color3.fromHex("#000000"),
				RichText = true,
				Position = UDim2.new(0.0398, 0, 0.15, 0),
				BackgroundTransparency = 1,
				TextXAlignment = Enum.TextXAlignment.Left,
				FontFace = Font.new("rbxasset://fonts/families/HighwayGothic.json"),
				TextYAlignment = Enum.TextYAlignment.Top,
				TextSize = 34,
				Size = UDim2.new(0.96, 0, 0.85, 0),
			}),
		},
	})
end

return Dialogue
