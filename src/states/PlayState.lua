PlayState = Class{__includes = BaseState}

function PlayState:init()
    self.player = Spaceship()
    self.lasers = {}
end

function PlayState:enter()
end

function PlayState:update(dt)
    self.player:update(dt)

    if love.keyboard.wasPressed("space") then
        table.insert(self.lasers, Laser(self.player.x + self.player.width/2, self.player.y))
    end

    for k, laser in pairs(self.lasers) do
        laser:update(dt)
    end
end

function PlayState:render()
    self.player:render()
    for k, laser in pairs(self.lasers) do
        laser:render()
    end
end

function PlayState:exit()
end