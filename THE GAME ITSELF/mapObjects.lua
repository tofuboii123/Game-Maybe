-- COLLECTION OF MAP OBJECTS -- 
require "physics"
--GENERAL--
function loadGeneral()
  general = {} -- Table to hold all our general objects
end

-- INTRO LEVEL --
function loadIntro()
  intro = {} -- Table to hold all our intro level objects

  intro.ground = {}
  intro.ground.body = love.physics.newBody(world, WINDOW_WIDTH/2, WINDOW_HEIGHT/2)
  intro.ground.shape = love.physics.newRectangleShape(1000, 50)
  intro.ground.fixture = love.physics.newFixture(intro.ground.body, intro.ground.shape, 0)
  intro.ground.image = "hey"
end

function drawIntro()
  love.graphics.polygon("fill", intro.ground.body:getWorldPoints(intro.ground.shape:getPoints()))
end

function loadHub()
  
end

function loadLevel1()
end

function loadLevel2()
end

function loadLevel3()
end