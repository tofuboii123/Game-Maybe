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

function Map:update(dt,player)
  updateIntro(player)
  updateHub(player)
end

function Map:draw(player)
  drawIntro(player)
  drawHub(player)
  drawLevel1()
  drawLevel2()
  drawLevel3()
end