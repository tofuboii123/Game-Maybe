--  Authors: William Xie, Jaafar Kaoussarani, Marianick Benoit, Jason Ma  --
--  File: main.lua                            --
--  Description: Executes the program         --

require "camera"
require "physics"
require "config"

function love.load()
  windowSet(1280,720) --1280*720
  physicsInit()
end

function love.update()
  
end


function love.draw()
camera:set()

camera:unset()
end
