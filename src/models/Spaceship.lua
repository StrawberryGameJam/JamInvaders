Spaceship = Class{}

SPACESHIP_WIDTH = 50
SPACESHIP_HEIGHT = 50

function Spaceship:init()
    self.image = love.graphics.newImage('assets/images/spaceship.png')
    self.x = WINDOW_WIDTH / 2 - SPACESHIP_WIDTH / 2
    self.y = WINDOW_HEIGHT / 2 - SPACESHIP_HEIGHT / 2
end

function Spaceship:update()
    
end

function Spaceship:render()
    draw(self.image, self.x, self.y, SPACESHIP_WIDTH, SPACESHIP_HEIGHT)
end