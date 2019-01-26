require "mapObjects"
Object = require "classic"
Map = Object:extend()

function Map:new()
  loadGeneral()
  loadIntro()
end

function Map:update(dt)
  
end

function Map:draw()
  love.graphics.polygon("fill", intro.ground.body:getWorldPoints(intro.ground.shape:getPoints()))
end