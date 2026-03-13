local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Fusion = require(ReplicatedStorage.Packages.fusion)
local Children = Fusion.Children

local Peek = Fusion.peek

type Props = {
    PopUp : boolean,
    Pressed : boolean
}

local popUpTween = TweenInfo.new(0.4, Enum.EasingStyle.Cubic)

local function ActionKey(scope: Fusion.Scope, props: Props)
    local dynamicSize = scope:Computed(function(use, _)
        return use(props.PopUp) and UDim2.new(1, 0, 1, 0) or UDim2.new(0, 0, 0, 0)
    end)

    local pressed = scope:Tween(scope:Computed(function(use, _)
        return use(props.Pressed) and UDim2.new(0.8, 0, 0.8, 0) or UDim2.new(0.9, 0, 0.9, 0)
    end), popUpTween)

    local color = scope:Tween(scope:Computed(function(use, _)
        return use(props.Pressed) and Color3.fromRGB(104, 104, 104) or Color3.fromRGB(255, 255, 255) 
    end), popUpTween)
	return scope:New("Frame")({
        Position = UDim2.fromScale(0.5, 1),
		Size = scope:Tween(dynamicSize, popUpTween),
        AnchorPoint = Vector2.new(0.5, 1),
		[Children] = {
			scope:New("ImageLabel")({
                Image = "rbxassetid://17164181436",
                Size = pressed,
                ImageColor3 = color,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.new(0.5, 0, 0.5, 0),
                BackgroundTransparency = 1
            }),
			scope:New("UICorner")({
				CornerRadius = UDim.new(0, 12),
			}),
		},
	})
end

return ActionKey
