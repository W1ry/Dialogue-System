local Fusion = require(game.ReplicatedStorage.Packages.fusion)

local Peek = Fusion.peek

type Props = {
    TextValue: Fusion.Value<string>,
    FullText: string,
    Interval: number
}

local function getChar(text: string, i: number)
    return string.sub(text, i, i)
end
--  TODO: Add richtext support
local function useTypeWriter(scope: Fusion.Scope, props: Props): thread
    local typeWrittenText = props.TextValue

    return task.defer(function()
        for x = 1, #props.FullText do
            task.wait(props.Interval or 0.1)
            local character = getChar(props.FullText, x)
            local writtenText = Peek(typeWrittenText)
            typeWrittenText:set(writtenText..character)
        end
    end)
end

return useTypeWriter 