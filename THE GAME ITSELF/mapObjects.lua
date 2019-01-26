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
  intro.ground.body = love.physics.newBody(world, DIMENSIONS)
  intro.ground.shape = love.physics.newRectangleShape(DIMENSIONS)
  intro.ground.fixture = love.physics.newFixture(intro.ground.body, intro.ground.shape)
  intro.ground.image = SPRITE
end