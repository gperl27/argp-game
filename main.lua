WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

Class = require 'class'

require 'models/Character'

PADDLE_SPEED = 200

function love.load()
    love.window.setTitle('Game')

    char = Character(WINDOW_WIDTH / 2 - 2, WINDOW_HEIGHT / 2 - 2, 4, 4)
end

function love.draw()
    love.graphics.printf(
        'Hello Pong!',          -- text to render
        0,                      -- starting X (0 since we're going to center it based on width)
        WINDOW_HEIGHT / 2 - 6,  -- starting Y (halfway down the screen)
        WINDOW_WIDTH,           -- number of pixels to center within (the entire screen here)
        'center')               -- alignment mode, can be 'center', 'left', or 'right'

        char:render()
end

function love.update(dt)
    if love.keyboard.isDown('w') then
        char.dy = -PADDLE_SPEED
    elseif love.keyboard.isDown('s') then
        char.dy = PADDLE_SPEED
    else
        char.dy = 0
    end

    char:update(dt)
end