function physicsInit()
  love.physics.setMeter(90) --the height of a meter our worlds will be 90px
  world = love.physics.newWorld(0, 20*90, false)
end
