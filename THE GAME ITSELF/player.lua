Object = require "classic"
Player = Object:extend

function Player:new()
  self.x = 0
  self.y = 0
  --Keep adding physics body and sprite here
end

function Player:update(dt)
  Player.controls()
end

function Player:draw()
  
end

function Player:controls()
  
  -- When the key is pressed
  function love.keypressed(key)
    if key == "right" then
      --Apply force to body
    end
    if key == "left" then
      --Apply force to body
    end
  end
  
  -- When key is released
  function love.keyreleased(key)
    if key == "right" then 
      --Remove force from body
    end
    if key == "left" then 
      --Remove force from body
    end
  end
  
end