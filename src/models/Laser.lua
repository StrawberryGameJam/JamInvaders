Laser = Class{}

LASER_WIDTH = 5
LASER_HEIGHT = 15
LASER_SPEED = 500

function Laser:init(x, y)
    self.x = x - LASER_WIDTH/2
    self.y = y - LASER_HEIGHT
    self.width = LASER_WIDTH
    self.height = LASER_HEIGHT
    self.dy = -LASER_SPEED
end

function Laser:update(dt)
    self.y = self.y + self.dy * dt
end

function Laser:render()
    love.graphics.setColor(62/255, 219/255, 250/255, 1)
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
    love.graphics.setColor(1, 1, 1, 1)
end