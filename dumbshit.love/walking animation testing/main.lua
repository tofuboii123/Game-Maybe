require "camera"
local imageFile
local frames = {}
local activeFrame
local currentFrame = 1
local framesLeft = {}
local currentFrameLeft = 1
function love.load()
  imageFile = love.graphics.newImage("scott.png")
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
  
  love.physics.setMeter(90)
  world = love.physics.newWorld(0, 10*90, true) 
  love.window.setMode(650, 650)
  
  objects = {} 
  objects.ground = {}
  objects.ground.body = love.physics.newBody(world, 650/2, 650-50/2) 
  objects.ground.shape = love.physics.newRectangleShape(100000, 50) 
  objects.ground.fixture = love.physics.newFixture(objects.ground.body, objects.ground.shape);
  
  objects.player = {}
  objects.player.body = love.physics.newBody(world, 650/2, 650/2, "dynamic") 
  objects.player.shape = love.physics.newRectangleShape(109,130)
  objects.player.fixture = love.physics.newFixture(objects.player.body, objects.player.shape, 1)
  objects.player.fixture:setRestitution(0)
end

---------------------------------
elapsedTime = 0
function love.update(dt)
  world:update(dt) --this puts the world into motion
  --here we are going to create some keyboard events
  camera:setPosition(objects.player.body:getX() - 650/2, 0)
  if love.keyboard.isDown("right") then --press the right arrow key to push the player to the right
    local x,y =  objects.player.body:getLinearVelocity()
    objects.player.body:setLinearVelocity(200, y)
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
  
  if love.keyboard.isDown("right") and love.keyboard.isDown("lshift") then --fast right
    local x,y =  objects.player.body:getLinearVelocity()
    objects.player.body:setLinearVelocity(400, y)
  end
    
  if love.keyboard.isDown("left") then --press the left arrow key to push the player to the left
    local x,y =  objects.player.body:getLinearVelocity()
    objects.player.body:setLinearVelocity(-200, y)
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
  
  if love.keyboard.isDown("left") and love.keyboard.isDown("lshift") then --fast left
    local x,y =  objects.player.body:getLinearVelocity()
    objects.player.body:setLinearVelocity(-400, y)
    
  end
  
  if not love.keyboard.isDown("right") and not love.keyboard.isDown("left") then 
    local x,y =  objects.player.body:getLinearVelocity()
    objects.player.body:setLinearVelocity(0, y)
  end
  
  if love.keyboard.isDown("up") then --press the up arrow key to set the player in the air
    local x,y =  objects.player.body:getLinearVelocity()
    if y == 0 then
      objects.player.body:setLinearVelocity(x,-500)
    end
  end
end

function love.draw()
  camera:set()
  love.graphics.circle("fill",200,200,20)
  love.graphics.draw(imageFile,activeFrame, objects.player.body:getX(), objects.player.body:getY())
  love.graphics.setBackgroundColor(0.41, 0.53, 0.97)
  camera:unset()
end