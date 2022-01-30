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
end

function Spaceship:update(dt)
    self.dx = love.keyboard.isDown("left") and -SPACESHIP_SPEED
            or love.keyboard.isDown("right") and SPACESHIP_SPEED
            or 0

    self.x = self.x + self.dx * dt
end

function Spaceship:render()
    draw(self.image, self.x, self.y, self.width, self.height)
end