--
-- Created by IntelliJ IDEA.
-- User: huangkun
-- Date: 16/12/29
-- Time: 上午10:12
-- To change this template use File | Settings | File Templates.

local id2sprite = {}
local protos = require("demo.gen.sprite")

local function create_sprite(id)
    local proto = id2sprite.id2proto(id)
    local sprite = CREATE_SPRITE(proto.file)
    sprite:setPosition(proto.pos)
    sprite:setScale(proto.scale)
    return sprite
end

gk.create_sprite = create_sprite

function id2sprite.default()
    return {
        file = "?",
        pos = gk.display.scaleXY(gk.display.width / 2, gk.display.height / 2),
        scale = gk.display.minScale,
    }
end

function id2sprite.id2proto(id)
    local proto = protos[id]
    if not proto then
        proto = {}
        local default = {
            __index = function(_, key)
                local defaultProto = id2sprite.default()
                local var = defaultProto[key]
                if var then
                    return var
                end
                error(string.format("try get undefine property %s", key))
            end
        }
        setmetatable(proto, default)
    end
    return proto
end

return id2sprite