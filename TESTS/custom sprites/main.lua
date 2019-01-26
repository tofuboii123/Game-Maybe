local imageFile
local frames = {}
local activeFrame
local currentFrame = 1
local framesLeft = {}
local currentFramesLeft = 1

function love.load()
  frames[1] = love.graphics.newImage("Animashun/sprite20000.png")
  frames[2] = love.graphics.newImage("Animashun/sprite20001.png")
  frames[3] = love.graphics.newImage("Animashun/sprite20002.png")
  frames[4] = love.graphics.newImage("Animashun/sprite20003.png")
  frames[5] = love.graphics.newImage("Animashun/sprite20004.png")
  frames[6] = love.graphics.newImage("Animashun/sprite20005.png")
  activeFrame = frames[currentFrame]
end

local elapsedTime = 0
function love.update(dt)
  if(love.keyboard.isDown("right")) then
    elapsedTime = elapsedTime + dt
      
    if(elapsedTime > 0.10) then
      if(currentFrame < 6) then
        currentFrame = currentFrame + 1
      else
        currentFrame = 3
      end
      
      activeFrame = frames[currentFrame]
      elapsedTime = 0
    end
  end
end

function love.draw()
  love.graphics.draw(activeFrame, love.graphics.getWidth()/2, love.graphics.getHeight()/2)
end