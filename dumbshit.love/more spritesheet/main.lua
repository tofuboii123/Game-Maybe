local imageFile
local frames = {}
local activeFrame
local currentFrame = 1

local framesLeft = {}
local currentFrameLeft = 1
function love.load()
    imageFile = love.graphics.newImage("scottpilgrim_multiple.png")
    frames[1] = love.graphics.newQuad(1,0,109,130,imageFile:getDimensions())
    frames[2] = love.graphics.newQuad(109,0,109,130,imageFile:getDimensions())
    frames[3] = love.graphics.newQuad(216,0,109,130,imageFile:getDimensions())
    frames[4] = love.graphics.newQuad(323,0,109,130,imageFile:getDimensions())
    frames[5] = love.graphics.newQuad(430, 0, 109,130, imageFile:getDimensions())
    frames[6] = love.graphics.newQuad(537, 0, 109,130, imageFile:getDimensions())
    frames[7] = love.graphics.newQuad(644, 0, 109,130, imageFile:getDimensions())
    frames[8] = love.graphics.newQuad(751, 0, 109,130, imageFile:getDimensions())
    activeFrame = frames[currentFrame]
    
    framesLeft[1] = love.graphics.newQuad(1,140,109,130,imageFile:getDimensions())
    framesLeft[2] = love.graphics.newQuad(109,140,109,130,imageFile:getDimensions())
    framesLeft[3] = love.graphics.newQuad(216,140,109,130,imageFile:getDimensions())
    framesLeft[4] = love.graphics.newQuad(323,140,109,130,imageFile:getDimensions())
    framesLeft[5] = love.graphics.newQuad(430, 140, 109,130, imageFile:getDimensions())
    framesLeft[6] = love.graphics.newQuad(537, 140, 109,130, imageFile:getDimensions())
    framesLeft[7] = love.graphics.newQuad(644, 140, 109,130, imageFile:getDimensions())
    framesLeft[8] = love.graphics.newQuad(751, 140, 109,130, imageFile:getDimensions())
    print(select(4,activeFrame:getViewport())/2)
end

function love.draw()
  love.graphics.setBackgroundColor(215,215,215)
  love.graphics.draw(imageFile,activeFrame,love.graphics.getWidth()/2 - ({activeFrame:getViewport()})[3]/2 ,  love.graphics.getHeight()/2 - ({activeFrame:getViewport()})[4]/2)
end

local elapsedTime = 0
function love.update(dt)
  if love.keyboard.isDown("right") then
    elapsedTime = elapsedTime + dt

    if(elapsedTime > 0.08) then
        if(currentFrame < 8) then
            currentFrame = currentFrame + 1
        else
        currentFrame = 1
        end
        activeFrame = frames[currentFrame]
        elapsedTime = 0
      end
    end
    if love.keyboard.isDown("left") then
    elapsedTime = elapsedTime + dt

    if(elapsedTime > 0.08) then
        if(currentFrameLeft < 8) then
            currentFrameLeft = currentFrameLeft + 1
        else
        currentFrameLeft = 1
        end
        activeFrame = framesLeft[currentFrameLeft]
        elapsedTime = 0
      end
    end
  end