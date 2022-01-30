Note = Class{}

function Note:init(y, width, length)
    self.y = y
    self.dy = 200
    self.width = width
    self.length = length 
end

function Note:render()
    love.graphics.rectangle('fill', 0, self.y, self.width, self.length)
end

function Note:update_position(dt, window_height)
    if self.y <= window_height then
        self.y = self.y + self.dy * dt
    end
end