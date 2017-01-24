--
-- Created by IntelliJ IDEA.
-- User: Kunkka Huang
-- Date: 16/12/29
-- Time: 上午10:12
-- To change this template use File | Settings | File Templates.

local util = {}

----------------------------------------- switch function  -------------------------------------------------
-- function to simulate a switch
local function switch(t)
    t.case = function(self, x, ...)
        local f = self[x] or self.default
        if f then
            if type(f) == "function" then
                return f(...)
            else
                error("case " .. tostring(x) .. " not a function")
            end
        end
        return nil
    end

    return t
end

gk.exports.switch = switch

function string.ends(String, End)
    return End == '' or string.sub(String, -string.len(End)) == End
end

function math.shrink(f, bit)
    if bit >= 1 and bit <= 6 then
        local e = 1 / math.pow(10, bit + 1)
        local v = math.pow(10, bit)
        return math.round((f + e) * v) / v
    elseif bit == 0 then
        return math.round(f)
    else
        return f
    end
end

----------------------------------------- restart game  -------------------------------------------------
function util:registerRestartGameCallback(callback)
    util.restartGameCallback = callback
    if not util.restartLayer then
        gk.log("init:registerRestartGameCallback")
        util.restartLayer = cc.Layer:create()
        util.restartLayer:retain()

        local function onKeyReleased(keyCode, event)
            if gk.focusNode then
                return
            end
            local key = cc.KeyCodeKey[keyCode + 1]
            --            gk.log("RestartLayer: onKeypad %s", key)
            if key == "KEY_R" then
                util:restartGame(1)
            elseif key == "KEY_T" then
                util:restartGame(2)
            end
        end

        local listener = cc.EventListenerKeyboard:create()
        listener:registerScriptHandler(onKeyReleased, cc.Handler.EVENT_KEYBOARD_RELEASED)
        cc.Director:getInstance():getEventDispatcher():addEventListenerWithSceneGraphPriority(listener, util.restartLayer)
        util.restartLayer:resume()
    end
end

function util:restartGame(mode)
    gk.log("===================================================================")
    gk.log("=====================    restart game    ==========================")
    gk.log("===================================================================")
    if util.restartLayer then
        util.restartLayer:release()
        util.restartLayer = nil
    end

    local scene = cc.Scene:create()
    cc.Director:getInstance():popToRootScene()
    cc.Director:getInstance():replaceScene(scene)
    scene:runAction(cc.CallFunc:create(function()
        --        if cc.Application:getInstance():getTargetPlatform() ~= cc.PLATFORM_OS_MAC then
        gk.log("removeResBeforeRestartGame")
        cc.Director:getInstance():purgeCachedData()
        gk.log("collect: lua mem -> %.2fMB", collectgarbage("count") / 1024)
        collectgarbage("collect")
        gk.log("after collect: lua mem -> %.2fMB", collectgarbage("count") / 1024)
        --        end
        if util.restartGameCallback then
            util.restartGameCallback(mode)
        end
    end))
end

function util:clearDrawNode(node, tag)
    local tg = tag or util.tags.rectTag
    local draw = node:getChildByTag(tg)
    if draw then
        draw:clear()
        draw:stopAllActions()
    end
end

function util:drawLineOnNode(node, p1, p2, c4f, tg)
    local draw
    if tg then
        draw = node:getChildByTag(tg)
    end
    if not draw then
        draw = cc.DrawNode:create()
        node:add(draw, 999, tg)
        draw:setPosition(cc.p(0, 0))
    end
    draw:drawLine(p1, p2, c4f)
    return draw
end

function util:drawNodeRect(node, c4f, tag)
    util.tags = util.tags and util.tags or {
        rectTag = 0xFFF0,
        fontSizeTag = 0xFFF1,
    }
    local tg = tag or util.tags.rectTag
    local draw = node:getChildByTag(tg)
    if iskindof(node, "cc.ScrollView") then
        draw = node:getContainer():getChildByTag(tg)
    end
    if draw then
        draw:clear()
    else
        draw = cc.DrawNode:create()
        if iskindof(node, "cc.ScrollView") then
            node:add(draw, -1, tg)
        else
            node:add(draw, 999, tg)
        end
        draw:setPosition(cc.p(0, 0))
    end

    local size = node:getContentSize()
    -- bounds
    draw:drawRect(cc.p(0.5, 0.5),
        cc.p(0.5, size.height - 0.5),
        cc.p(size.width - 0.5, size.height - 0.5),
        cc.p(size.width - 0.5, 0.5), c4f and c4f or cc.c4f(0, 155 / 255, 1, 1))

    if not iskindof(node, "cc.Layer") then
        -- anchor point
        local p = node:getAnchorPoint()
        p.x = p.x * size.width
        p.y = p.y * size.height
        draw:drawDot(p, 4, cc.c4f(1, 0, 0, 1))
    end

    if iskindof(node, "cc.ScrollView") then
        -- bg
        local p1 = cc.p(0, 0)
        local p2 = cc.p(size.width, size.height)
        draw:drawSolidRect(p1, p2, cc.c4f(0.5, 0.5, 0.5, 0.5))
    end

    -- draw text size
    --    if tolua.type(node) == "cc.Label" then
    --        local fontSize = node:getTTFConfig().fontFilePath ~= "" and node:getTTFConfig().fontSize or 0
    --        if fontSize <= 0 then
    --            -- bmfont
    --            fontSize = node:getBMFontSize()
    --        end
    --        if fontSize > 0 then
    --            local lb = cc.Label:createWithSystemFont(string.format("%d", fontSize), "Arial", 15)
    --            lb:enableUnderline()
    --            local child = node:getChildByTag(-0x2333)
    --            if child then
    --                child:removeFromParent()
    --            end
    --            node:addChild(lb, 9999, -0x2333)
    --            lb:setPosition(size.width, size.height)
    --        end
    --    end

    -- refresh draw, only in test mode
    if DEBUG and not tag then
        draw:stopAllActions()
        draw:runAction(cc.Sequence:create(cc.DelayTime:create(1), cc.CallFunc:create(function()
            draw:clear()
            util:drawNodeRect(node, c4f)
        end)))
    end
    return draw
end

function util:getGlobalScale(node)
    local scaleX, scaleY = 1, 1
    local c = node
    while c ~= nil do
        scaleX = scaleX * c:getScaleX()
        scaleY = scaleY * c:getScaleY()
        c = c:getParent()
    end
    return scaleX, scaleY
end

function util:hitTest(node, touch)
    local location = touch:getLocation()
    local s = node:getContentSize()
    local rect = { x = 0, y = 0, width = s.width, height = s.height }
    local touchP = node:convertToNodeSpace(cc.p(location.x, location.y))
    return cc.rectContainsPoint(rect, touchP)
end

function util:stopActionByTagSafe(node, tag)
    local action = node:getActionByTag(tag)
    if action then
        node:stopAction(action)
    end
end

function util:isGlobalVisible(node)
    local c = node
    while c ~= nil do
        if not c:isVisible() then
            return false
        end
        c = c:getParent()
    end
    return true
end

function util:getRootNode(node)
    local c = node:getParent()
    local root
    while c ~= nil do
        root = c
        c = c:getParent()
    end
    return root
end

return util