Note = Class{}

function Note:init(y, width, height )
    self.y = y
    self.dy = 50
    self.width = width
    self.height = height 
end

function Note:render()
    love.graphics.rectangle('fill', 0, self.y, self.width, self.height)
end

function Note:update_position(dt)
    self.y = self.y + self.dy * dt
end