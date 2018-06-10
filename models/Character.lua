Character = Class{}

function Character:init(x, y)
    self.x = x
    self.y = y

    -- these variables are for keeping track of our velocity on both the
    -- X and Y axis, since the Character can move in two dimensions
    self.dy = 0
    self.dx = 0

    self.sprite = love.graphics.newImage("assets/char.png")
end

function Character:update(dt)
    self.x = self.x + self.dx * dt
    self.y = self.y + self.dy * dt
end

function Character:render()
    love.graphics.draw(self.sprite, self.x, self.y)
end