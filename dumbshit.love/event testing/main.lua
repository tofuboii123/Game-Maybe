function love.load()
 entity = {}
 entity.x = 640/2
 entity.y = 480/2
 entity.health = 100
end

function love.handlers.wasHit()
  love.event.clear() -- cant quit while this event is playing
  entity.health = entity.health - 1
  love.graphics.print("RIP", 640/2, 480/2)
end

function love.update()
  if love.keyboard.isDown("space") then
    love.event.push('wasHit')
  end
  if love.keyboard.isDown("r") then
    love.event.clear('wasHit') --Cant damage while r is held down
  end
  if love.keyboard.isDown("escape") then
    love.event.quit()
  end
end

function love.draw()
  love.graphics.print(entity.health, 640/2, 480/2)
  if entity.health <= 0 then
    love.graphics.clear()
    love.graphics.print("RIP", 640/2, 480/2)
  end
end