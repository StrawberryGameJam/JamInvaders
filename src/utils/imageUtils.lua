local function getScaleFactor(image, newWidth, newHeight)
    local currentWidth, currentHeight = image:getDimensions()
    return ( newWidth / currentWidth ), ( newHeight / currentHeight )
end

local function _draw(image, x, y, scaleX, scaleY)
    love.graphics.draw(image, x, y, 0, scaleX, scaleY)
end

function draw(image, x, y)
    _draw(image, x, y, 1, 1)
end

function draw(image, x, y, width, height)
    local scaleX, scaleY = getScaleFactor(image, width, height)
    _draw(image, x, y, scaleX, scaleY)
end