Object = require "classic"
--
TEST = 1
require "snake"
require "fruit"
require "conf"
math.randomseed(os.time())

function love.load()
 love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT)
 snake = Snake()
 fruit = Fruit()
 sprite = love.graphics.newImage("sheep.png")
end
--
function love.update(dt)
  snake:update(dt)
end
--
function love.draw()
  love.graphics.draw(sprite, WINDOW_WIDTH/2 - sprite:getWidth()/2 , WINDOW_HEIGHT/2 - sprite:getHeight()/2)
  fruit:draw()
  snake:draw()
end
