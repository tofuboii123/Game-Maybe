Object = require "classic"
require "snake"

function love.load()
 love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT)
 snake = Snake()
end


function love.update(dt)
  snake:update(dt)
end

function love.draw()
  snake:draw()
end
