local Fusion = require(game.ReplicatedStorage.Packages.fusion)

local Children = Fusion.Children

type Props = {
    Name : string,
    Text : string,
    Children : Fusion.Child
}

local function TextLabel(scope: Fusion.Scope, props: Props)
    local templateProp = {
		Name = "TextLabel",
		TextWrapped = true,
		TextColor3 = Color3.fromHex("#000000"),
		Text = "",
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromHex("#ffffff"),
		BorderSizePixel = 0,
		TextXAlignment = Enum.TextXAlignment.Left,
		FontFace = props or Font.new("rbxasset://fonts/families/HighwayGothic.json"),
		BorderColor3 = Color3.fromHex("#000000"),
		TextSize = 32,
		Size = UDim2.new(0, 200, 0, 50),
	}

    for property, value in next, props do
        templateProp[property] = value
    end

	return scope:New("TextLabel")(templateProp)
end

return TextLabel
