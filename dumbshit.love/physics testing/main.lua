require "camera"
local grounded = true
function love.load()
  love.physics.setMeter(90) --the height of a meter our worlds will be 90px
  world = love.physics.newWorld(0, 10*90, true) --create a world for the bodies to exist in with horizontal gravity of 0 and vertical gravity of 10 (instead of 9.81 just for gaminess sake)
 
  objects = {} -- table to hold all our physical objects
 
  --let's create the ground
  objects.ground = {}
  objects.ground.body = love.physics.newBody(world, 650/2, 650-50/2) --remember, the shape (the rectangle we create next) anchors to the body from its center, so we have to move it to (650/2, 650-50/2)
  objects.ground.shape = love.physics.newRectangleShape(550, 50) --make a rectangle with a width of 550 and a height of 50
  objects.ground.fixture = love.physics.newFixture(objects.ground.body, objects.ground.shape); --attach shape to body
 
  --let's create a ball
  objects.ball = {}
  objects.ball.body = love.physics.newBody(world, 650/2, 650/2, "dynamic") --place the body in the center of the world and make it dynamic, so it can move around
  objects.ball.shape = love.physics.newCircleShape(30) --the ball's shape has a radius of 20
  objects.ball.fixture = love.physics.newFixture(objects.ball.body, objects.ball.shape, 1) -- Attach fixture to body and give it a density of 1.
  objects.ball.fixture:setRestitution(0) --let the ball bounce (0 = nobounce)
 
  --let's create a couple blocks to play around with
  objects.block1 = {}
  objects.block1.body = love.physics.newBody(world, 200, 550, "static")
  objects.block1.shape = love.physics.newRectangleShape(0, 0, 50, 100)
  objects.block1.fixture = love.physics.newFixture(objects.block1.body, objects.block1.shape, 5) -- A higher density gives it more mass.
 
  objects.block2 = {}
  objects.block2.body = love.physics.newBody(world, 200, 400, "dynamic")
  objects.block2.shape = love.physics.newRectangleShape(0, 0, 100, 50)
  objects.block2.fixture = love.physics.newFixture(objects.block2.body, objects.block2.shape, 2)
  
  --initial graphics setup
  love.graphics.setBackgroundColor(0.41, 0.53, 0.97) --set the background color to a nice blue
  love.window.setMode(650, 650) --set the window dimensions to 650 by 650
end
 
 
function love.update(dt)
  world:update(dt) --this puts the world into motion
  camera:setPosition(objects.ball.body:getX() - 650/2, 0)
  --here we are going to create some keyboard events
  if love.keyboard.isDown("right") then --press the right arrow key to push the ball to the right
    local x,y =  objects.ball.body:getLinearVelocity()
    objects.ball.body:setLinearVelocity(200, y)
    
  end
  
  if love.keyboard.isDown("right") and love.keyboard.isDown("lshift") then --fast right
    local x,y =  objects.ball.body:getLinearVelocity()
    objects.ball.body:setLinearVelocity(400, y)
    
  end
  
  if love.keyboard.isDown("left") then --press the left arrow key to push the ball to the left
    local x,y =  objects.ball.body:getLinearVelocity()
    objects.ball.body:setLinearVelocity(-200, y)
  end
  
  if love.keyboard.isDown("left") and love.keyboard.isDown("lshift") then --fast left
    local x,y =  objects.ball.body:getLinearVelocity()
    objects.ball.body:setLinearVelocity(-400, y)
    
  end
  
  if not love.keyboard.isDown("right") and not love.keyboard.isDown("left") then 
    local x,y =  objects.ball.body:getLinearVelocity()
    objects.ball.body:setLinearVelocity(0, y)
  end
  
  if love.keyboard.isDown("up") then --press the up arrow key to set the ball in the air
    local x,y =  objects.ball.body:getLinearVelocity()
    if y == 0 then
      objects.ball.body:setLinearVelocity(x,-500)
    end
  end
  
  if love.keyboard.isDown("r") then
    objects.ball.body:setPosition(650/2, 650/2)
    objects.ball.body:setLinearVelocity(0, 0) --we must set the velocity to zero to prevent a potentially large velocity generated by the change in position
    objects.block1.body:setPosition(200,550)
    objects.block1.body:setLinearVelocity(0, 0)
    objects.block2.body:setPosition(200,400)
    objects.block2.body:setLinearVelocity(0, 0)
  end
  
  if love.keyboard.isDown("d") then
  objects.block1.fixture:setSensor(true)
  objects.block2.fixture:setSensor(true)
  grounded = false
  end
end
 
function love.draw()
  camera:set()
  love.graphics.setColor(0.28, 0.63, 0.05) -- set the drawing color to green for the ground
  love.graphics.polygon("fill", objects.ground.body:getWorldPoints(objects.ground.shape:getPoints())) -- draw a "filled in" polygon using the ground's coordinates
 
  love.graphics.setColor(0.76, 0.18, 0.05) --set the drawing color to red for the ball
  love.graphics.circle("fill", objects.ball.body:getX(), objects.ball.body:getY(), objects.ball.shape:getRadius())
 
  love.graphics.setColor(0.20, 0.20, 0.20) -- set the drawing color to grey for the blocks
  if grounded == true then
    love.graphics.polygon("fill", objects.block1.body:getWorldPoints(objects.block1.shape:getPoints()))
    love.graphics.polygon("fill", objects.block2.body:getWorldPoints(objects.block2.shape:getPoints()))
  end
  camera:unset()
end