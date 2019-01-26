local imageFile
love.graphics.setDefaultFilter("nearest", "nearest") 

function love.load()
  love.window.setMode(640,480)
  imageFile = love.graphics.newImage("tree.png")
end

function love.draw()
  love.graphics.draw(imageFile, 1040/2 - imageFile:getHeight()/2, 480/2 - imageFile:getWidth()/2, 0 , 2, 2)
  love.graphics.draw(imageFile, 840/2 - imageFile:getHeight()/2, 480/2 - imageFile:getWidth()/2, 0 , 2, 2)
  love.graphics.draw(imageFile, 640/2 - imageFile:getHeight()/2, 480/2 - imageFile:getWidth()/2, 0 , 2, 2)
  love.graphics.draw(imageFile, 440/2 - imageFile:getHeight()/2, 480/2 - imageFile:getWidth()/2, 0 , 2, 2)
  love.graphics.draw(imageFile, 240/2 - imageFile:getHeight()/2, 480/2 - imageFile:getWidth()/2, 0, 2, 2)
  love.graphics.setColor(0.25, 0.73, 0.34)
  love.graphics.rectangle("fill", 240/2 - imageFile:getHeight(), 480/2 + imageFile:getWidth(), 800, 200)
  love.graphics.setColor(1,1,0.53)
  love.graphics.circle("fill", 50, 100, 20)
  love.graphics.reset()
  love.graphics.setBackgroundColor(0.41, 0.53, 0.97)
end

function love.update(dt)
  
  end