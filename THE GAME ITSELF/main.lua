--  Authors: William Xie, Jaafar Kaoussarani, Marianick Benoit, Jason Ma  --
--  File: main.lua                            --
--  Description: Executes the program         --

require "font"
require "camera"
require "physics"
require "config"
require "player"
require "map"
require "menu"

function love.load()
  windowSet(1280,720) --1280*720
  loadFont()
  menu = Menu()
  physicsInit()
  map = Map()
  player = Player()
end

function love.update(dt)
  if menu then
    menu:update(dt)
  else
    world:update(dt)
    camera:setPosition(player.body:getX() - 1280/2, -720/2)
    player:update(dt)
  end
end


function love.draw()
  if menu then
    menu:draw()
  else
    camera:set()
    player:draw()
    map:draw()
    camera:unset()
  end
end
