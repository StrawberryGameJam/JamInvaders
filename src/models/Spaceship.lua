Spaceship = Class{}

SPACESHIP_WIDTH = 70
SPACESHIP_HEIGHT = 70
SPACESHIP_SPEED = 300

BOTTOM_SPACING = 50

function Spaceship:init()
    self.image = love.graphics.newImage('assets/images/spaceship.png')
    self.x = WINDOW_WIDTH / 2 - SPACESHIP_WIDTH / 2
    self.y = WINDOW_HEIGHT - (SPACESHIP_HEIGHT + BOTTOM_SPACING)
    self.width = SPACESHIP_WIDTH
    self.height = SPACESHIP_HEIGHT
    self.dx = 0

    self.lasers = {}
end

function Spaceship:update(dt)
    self.dx = love.keyboard.isDown("left") and -SPACESHIP_SPEED
            or love.keyboard.isDown("right") and SPACESHIP_SPEED
            or 0

    self.x = self.x + self.dx * dt

    if love.keyboard.wasPressed("space") then
        table.insert(self.lasers, Laser(self.x + self.width/2, self.y))
    end

    for k, laser in pairs(self.lasers) do
        laser:update(dt)
    end
end

function Spaceship:render()
    draw(self.image, self.x, self.y, self.width, self.height)
    for k, laser in pairs(self.lasers) do
        laser:render()
    end
end