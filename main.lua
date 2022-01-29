-- virtual resolution handling library
Class = require 'libs/class'

require 'src/models/Spaceship'
require 'src/utils/imageUtils'

-- physical screen dimensions
WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

-- virtual resolution dimensions
-- VIRTUAL_WIDTH = 1280
-- VIRTUAL_HEIGHT = 720


local background = love.graphics.newImage('assets/images/background.png')

function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')

    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
        vsync = true,
        fullscreen = false,
        resizable = true
    })

    player = Spaceship()
end


function love.draw()    
    -- draw the background starting at top left (0, 0)
    love.graphics.draw(background, 0, 0)
    player:render()
end