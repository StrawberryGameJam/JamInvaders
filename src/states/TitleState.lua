TitleState = Class{__includes = BaseState}

function TitleState:init()
end

function TitleState:enter()
end

function TitleState:update(dt)
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('play')
    end
end

function TitleState:render()
    love.graphics.setFont(fonts.big)
    love.graphics.printf('Jam Invaders', 0, 64, WINDOW_WIDTH, 'center')

    love.graphics.setFont(fonts.medium)
    love.graphics.printf('Press Enter', 0, 100, WINDOW_WIDTH, 'center')
end

function TitleState:exit()
end