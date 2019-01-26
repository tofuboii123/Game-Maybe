require "camera"
Object = require "classic"
Player = Object:extend()
local flipped = 1
local timer = 4



function Player:new()
  self.image = love.graphics.newImage("Images/Tofu/yas.png")
  self.body = love.physics.newBody(world, 1280/2, 720/2, "dynamic")
  self.shape = love.physics.newRectangleShape(32,64)
  self.fixture = love.physics.newFixture(self.body, self.shape)
end

function Player:update(dt)
  Player.controls(self)
end

function Player:draw()
  love.graphics.draw(self.image, self.body:getX() - (flipped)*16, self.body:getY() - 32, 0, flipped, 1)
end

function Player.controls(self)
  
  -- When the key is pressed
  if love.keyboard.isDown("right") and timer == 4 then
   local x,y =  self.body:getLinearVelocity()
    self.body:setLinearVelocity(200, y)
    flipped = 1
  end
  if love.keyboard.isDown("left") and timer == 4 then
    local x,y =  self.body:getLinearVelocity()
    self.body:setLinearVelocity(-200, y)
    flipped = -1
  end
  if love.keyboard.isDown("z") and timer == 4 then
    local x,y =  self.body:getLinearVelocity()
    if y < 0.05 and y > -0.05 then
      self.body:setLinearVelocity(x,-500)
    end
  end
  if not love.keyboard.isDown("right") and not love.keyboard.isDown("left") and timer == 4 then 
    local x,y =  self.body:getLinearVelocity()
    self.body:setLinearVelocity(0, y)
  end
  
  timer = timer - 1
  if timer == 0 then
    timer = 4
  end
end