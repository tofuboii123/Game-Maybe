Object = require "classic"
--
require "conf"
Snake = Object:extend()

function Snake:new()
  self.x = WINDOW_WIDTH/2  - 20/2
  self.y = WINDOW_HEIGHT/2 + 20/2
  self.width = 20
  self.height = 20
  self.speed = 0
  self.number = 1
  self.dead = false
  self.ateFruit = false
end

function Snake:checkWall()
  if self.x + 21 > WINDOW_WIDTH or self.x - 1 < 0 or self.y + 21 > WINDOW_HEIGHT or self.y - 1 < 0 then
    self.speed = 0
    self.dead = true
  end
  if self.dead and love.keyboard.isDown("space") then
   os.exit(true)
  end
end

horizontal = false
vertical = false

function Snake:movement()
  if not self.dead then
    if love.keyboard.isDown("right") then
      horizontal = true
      vertical = false
      self.speed = 4
    elseif love.keyboard.isDown("left") then
      horizontal = true
      vertical = false
      self.speed = -4
    elseif love.keyboard.isDown("up") then
      horizontal = false
      vertical = true
      self.speed = -4
    elseif love.keyboard.isDown("down") then
      horizontal = false
      vertical = true
      self.speed = 4
    end
  
    if horizontal then
      self.x = self.x + self.speed
    end
    if vertical then
      self.y = self.y + self.speed
    end
  end
end

-------------------------------------------------------
function Snake:update(dt)
  self:movement()
  self:checkWall()
end
------------------------------------------------------
function Snake:draw()
  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
  if self.dead then
    love.graphics.print( "RIP", WINDOW_WIDTH/2, WINDOW_HEIGHT/2)
  end
end
