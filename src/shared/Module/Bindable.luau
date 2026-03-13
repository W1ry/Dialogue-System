local CollectionService = game:GetService("CollectionService")

local Bindable = {}
Bindable.__index = Bindable

type BasicCallback = (Instance) -> ()

function Bindable.new(tagName : string, callback : BasicCallback)
    local self = setmetatable({
        Tag = tagName
    }, Bindable)

    local tagged = CollectionService:GetTagged(self.Tag)

    for _, instance in next, tagged do
        callback(instance)
    end

    CollectionService:GetInstanceAddedSignal(self.Tag):Connect(callback)

    return self
end

function Bindable.Destroy(self, callback : BasicCallback)    
    CollectionService:GetInstanceRemovedSignal(self.Tag):Connect(callback)
end

return Bindable