-- virtual resolution handling library
Class = require 'libs/class'

require 'src/models/Spaceship'
require 'src/models/Laser'
require 'src/utils/imageUtils'

-- physical screen dimensions
WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

-- virtual resolution dimensions
-- VIRTUAL_WIDTH = 1280
-- VIRTUAL_HEIGHT = 720


local background = love.graphics.newImage('assets/images/background.png')

function love.load()
    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
        vsync = true,
        fullscreen = false,
        resizable = true
    })

    player = Spaceship()

    love.keyboard.keysPressed = {}
end

function love.keypressed(key)
    -- add to our table of keys pressed this frame
    love.keyboard.keysPressed[key] = true

    if key == 'escape' then
        love.event.quit()
    end
end

function love.keyboard.wasPressed(key)
    return love.keyboard.keysPressed[key]
end

function love.update(dt)
    player:update(dt)

    love.keyboard.keysPressed = {}
end


function love.draw()    
    -- draw the background starting at top left (0, 0)
    love.graphics.draw(background, 0, 0)
    player:render()
end