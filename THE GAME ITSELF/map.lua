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
  drawIntro()
end