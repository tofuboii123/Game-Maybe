Object = require "classic"
Player = Object:extend

function Player:new()
  self.x = DO
  self.y = DO
  self.image = PNG
  self.body = love.physics.newBody(world, self.x, self.y)
  self.shape = love.physics.newRectangleShape(32,64)
  self.fixture = love.physics.newFixture(self.body, self.shape)
end

function Player:update(dt)
  Player.controls()
end

function Player:draw()
  
end
 ----------------------------------------
function love.keyboard.wasReleased(key)
    if (love.keyboard.keysReleased[key]) then
        return true
    else
        return false
    end
end

-- called whenever a key is pressed
function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end

    love.keyboard.keysPressed[key] = true
end
----------------------------------------

function Player:controls()
  
  -- When the key is pressed
  if love.keyboard.wasPressed(right) then
    --Apply force to body
  end
  if love.keyboard.wasPressed(left) then
    --Apply force to body
  end
  if love.keyboard.wasPressed(up) then
    --jump
  end
  if love.keyboard.wasPressed(z)

  -- When key is released
  if love.keyboard.wasReleased(right) then 
    --Remove force from body
  end
  if love.keyboard.wasReleased(left) then 
    --Remove force from body
  end
  if love.keyboard.wasPressed(z) then
    --Probably nothing but lets make sure later
  end
end