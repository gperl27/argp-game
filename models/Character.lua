Character = Class {}

function Character:init(x, y)
    self.x = x
    self.y = y
    -- these variables are for keeping track of our velocity on both the
    -- X and Y axis, since the Character can move in two dimensions
    self.dy = 0
    self.dx = 0

    self.directionX = null
    self.directionY = null
    self.dominantDirection = null

    self.sprite = love.graphics.newImage("assets/char.png")
    self.down = love.graphics.newImage("assets/down.png")
    self.right = love.graphics.newImage("assets/right.png")
    self.left = love.graphics.newImage("assets/left.png")
    self.up = love.graphics.newImage("assets/up.png")

    self.xOffset = self.sprite:getWidth() / 2
    self.yOffset = self.sprite:getHeight() / 2
end

function Character:update(dt)
    self.x = self.x + self.dx * dt
    self.y = self.y + self.dy * dt
end

function Character:render()
    print("direction", self.directionX, self.directionY)
    if (self.dominantDirection ~= null) then
        if (self.dominantDirection == "x") then
            if (self.directionX == "right") then
                love.graphics.draw(self.right, self.x, self.y)
            else
                love.graphics.draw(self.left, self.x, self.y)
            end
        else
            if (self.directionY == "up") then
                love.graphics.draw(self.up, self.x, self.y)
            else
                love.graphics.draw(self.down, self.x, self.y)
            end
        end
    else
        love.graphics.draw(self.sprite, self.x, self.y)
    end
end
