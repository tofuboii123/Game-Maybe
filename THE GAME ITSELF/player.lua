require "camera"
Object = require "classic"
Player = Object:extend()
state = "idle"
local flipped = 1
local timer = 4
local state = "idle"
local idleImage = love.graphics.newImage("Images/Tofu/Animashun/sprite20000.png")
local activeFrame = idleImage
local frames = {}
local elapsedTime = 0
local currentFrame = 1
local numberOfFrames

function Player:new()
  self.image = idleImage
  self.body = love.physics.newBody(world, WINDOW_WIDTH/2, WINDOW_HEIGHT/2, "dynamic")
  self.shape = love.physics.newRectangleShape(32,64)
  self.fixture = love.physics.newFixture(self.body, self.shape)
end

function Player:update(dt)
  Player.controls(self, dt)
end

function Player:draw()
  love.graphics.setColor(255, 255, 255)
  love.graphics.draw(activeFrame, self.body:getX() - (flipped)*16, self.body:getY() - 32, 0, flipped, 1)
end

function Player.controls(self, dt)
  
  -- When the key is pressed
  if love.keyboard.isDown("right") and timer == 4 then -- timer is for correcting weird physics glitches.
   local x,y =  self.body:getLinearVelocity()
    self.body:setLinearVelocity(200, y)
    flipped = 1
    state = "running"
    Player:animation()
    Player:elapsedTime(dt)
  end
  if love.keyboard.isDown("left") and timer == 4 then
    local x,y =  self.body:getLinearVelocity()
    self.body:setLinearVelocity(-200, y)
    flipped = -1
    state = "running"
    Player:animation()
    Player:elapsedTime(dt)
  end
  if (not love.keyboard.isDown("z") and not love.keyboard.isDown("left") and not love.keyboard.isDown("right") and timer == 4) then
    state = "idle"
    Player:animation()
    activeFrame = idleImage
  end
  if not love.keyboard.isDown("right") and not love.keyboard.isDown("left") and timer == 4 then 
    local x,y =  self.body:getLinearVelocity()
    self.body:setLinearVelocity(0, y)
  end
  
  -- Exits game from gameplay
  function love.keypressed(key)
    if key == "escape" then
      love.event.quit()
    elseif key == "z" then
      local x,y =  self.body:getLinearVelocity()
      if y < 0.01 and y > -0.01 then
        self.body:setLinearVelocity(x,-550)
      end
    end
  end
  
  timer = timer - 1
  if timer == 0 then
    timer = 4
  end
end

function Player:animation()
  if(state == "idle") then -- Load the frame table with the idle sprite.
    frames[1] = love.graphics.newImage("Images/Tofu/Animashun/sprite20001.png")
    frames[2] = idleImage
    numberOfFrames = 2
  elseif (state == "running") then -- Load the table with the running sprites.
    frames[1] = love.graphics.newImage("Images/Tofu/Animashun/sprite20001.png")
    frames[2] = love.graphics.newImage("Images/Tofu/Animashun/sprite20002.png")
    frames[3] = love.graphics.newImage("Images/Tofu/Animashun/sprite20003.png")
    frames[4] = love.graphics.newImage("Images/Tofu/Animashun/sprite20004.png")
    frames[5] = love.graphics.newImage("Images/Tofu/Animashun/sprite20005.png")
    numberOfFrames = 4
  end
end

function Player:elapsedTime(dt)
  elapsedTime = elapsedTime + dt
    if(elapsedTime > dt) then
      if(currentFrame < numberOfFrames) then
        currentFrame = currentFrame + 1
      else
        currentFrame = 2
      end
        activeFrame = frames[currentFrame]
        elapsedTime = 0
    end
end