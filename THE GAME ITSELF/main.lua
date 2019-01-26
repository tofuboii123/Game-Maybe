--  Authors: William Xie, Jaafar Kaoussarani, Marianick Benoit, Jason Ma  --
--  File: main.lua                            --
--  Description: Executes the program         --

require "font"
require "camera"
require "physics"
require "config"

function love.load()
  windowSet(1280,720) --1280*720
  loadFont()
  physicsInit()
end

function love.update()
  
end


function love.draw()
camera:set()
love.graphics.print("hey baybee",0,0,0,2,2)
love.graphics.print("this is a testo", 30, 30, 0, 2, 2)
camera:unset()
end
