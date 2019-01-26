Object = require "classic"
--
require "conf"
Fruit = Object:extend()

function Fruit:new()
  self.x = math.random(20, WINDOW_WIDTH - 20)
  self.y = math.random(20, WINDOW_HEIGHT -20)
  self.width = 20
  self.height = 20
end

--------------------------
--------------------------
function Fruit:draw()
  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

