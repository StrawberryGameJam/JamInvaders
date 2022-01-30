Class = require 'libs/class'

require 'src/models/Spaceship'
require 'src/models/Laser'
require 'src/models/NotesControl'
require 'src/utils/imageUtils'
require 'src/StateMachine'
require 'src/states/BaseState'
require 'src/states/TitleState'
require 'src/states/PlayState'

-- physical screen dimensions
WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720


-- local background = love.graphics.newImage('assets/images/background.png')

function love.load()
    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
        vsync = true,
        fullscreen = false,
        resizable = true
    })

    fonts = {
      ["medium"] = love.graphics.newFont(14),
      ["big"] = love.graphics.newFont(28)
    }

    -- gStateMachine = StateMachine {
    --     ['title'] = function() return TitleState() end,
    --     ['play'] = function() return PlayState() end,
    --     ['score'] = function() return ScoreState() end
    -- }
    -- gStateMachine:change('title')

    love.keyboard.keysPressed = {}
    notes_control = NotesControl( 20, WINDOW_HEIGHT, WINDOW_WIDTH)

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
    -- gStateMachine:update(dt)
    notes_control:update(dt)
    love.keyboard.keysPressed = {}
end


function love.draw()    
    -- love.graphics.draw(background, 0, 0)
    notes_control:render()
    -- gStateMachine:render()

end
