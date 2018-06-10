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
    if love.mouse.isDown(1) then
        local x, y = love.mouse.getPosition() -- get the position of the mouse

        -- right
        if x > char.x + char.xOffset then
            char.directionX = "right"
            char.dx = PADDLE_SPEED
        end

        -- left
        if x < char.x + char.xOffset then
            char.directionX = "left"
            char.dx = -PADDLE_SPEED
        end

        -- down
        if y > char.y + char.yOffset then
            char.directionY = "runningDown"
            char.dy = PADDLE_SPEED
        end

        -- up
        if y < char.y + char.yOffset then
            char.directionY = "up"
            char.dy = -PADDLE_SPEED
        end

        -- if the difference in x is greater than y
        -- show horizontal sprite
        -- else use vertical
        -- let render method handle delegation
        if (math.abs(x - char.x) > math.abs(y - char.y)) then
            print(x, math.abs(x - char.x) > math.abs(y - char.y))
            char.dominantDirection = "x"
        else
            char.dominantDirection = "y"
        end
    else
        char.dominantDirection = null
        char.directionX = null
        char.directionY = null

        char.dy = 0
        char.dx = 0
    end

    char:update(dt)
end
