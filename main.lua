WINDOW_WIDTH = 1920
WINDOW_HEIGHT = 1080

Class = require "class"

require "models/Character"

PADDLE_SPEED = 200

function love.load()
    grass = love.graphics.newImage("assets/test.png")

    grid_x = 300
    grid_y = 300

    block_width = grass:getWidth()
    block_height = grass:getHeight()
    block_depth = block_height / 2

    grid_size = 20
    grid = {}
    for x = 1, grid_size do
        grid[x] = {}
        for y = 1, grid_size do
            grid[x][y] = 1
        end
    end

    love.window.setTitle("Game")

    char = Character(50, 50)
end

function love.draw()
    for x = 1, grid_size do
        for y = 1, grid_size do
            love.graphics.draw(
                grass,
                grid_x + ((y - x) * (block_width / 2)),
                grid_y + ((x + y) * (block_depth / 2)) - (block_depth * (grid_size / 2))
            )
        end
    end

    char:render()
end

function love.update(dt)
    if love.keyboard.isDown("w") then
        char.dy = -PADDLE_SPEED
    elseif love.keyboard.isDown("s") then
        char.dy = PADDLE_SPEED
    elseif love.keyboard.isDown("a") then
        char.dx = -PADDLE_SPEED
    elseif love.keyboard.isDown("d") then
        char.dx = PADDLE_SPEED
    else
        char.dy = 0
        char.dx = 0
    end
    

    char:update(dt)
end
