require "camera"
player = {}
player.x = 640/2
player.y = 480/2
player.width = 100
player.height = 100

function love.update()
  if love.keyboard.isDown("right") then
    player.x = player.x + 1
    camera:move(1,0)
  end
  if love.keyboard.isDown("left") then
    player.x = player.x - 1
    camera:move(-1,0)
  end
  if love.keyboard.isDown("up") then
    player.y = player.y -1
    camera:move(0,-1)
  end
  if love.keyboard.isDown("down") then
    player.y = player.y + 1
    camera:move(0,1)
  end
end
function love.draw()
  camera:set()
  love.graphics.rectangle("fill",player.x,player.y,player.width,player.height)
  love.graphics.rectangle("fill", 500, 500, 100, 100)
  camera:unset()
end