require "mapObjects"
Object = require "classic"
Map = Object:extend()

function Map:new()
  loadGeneral()
  loadIntro()
  loadHub()
  loadLevel1()
  loadLevel2()
  loadLevel3()
end

function Map:update(dt)
  
end

function Map:draw()
  drawIntro()
  drawHub()
  drawLevel1()
  drawLevel2()
  drawLevel3()
end