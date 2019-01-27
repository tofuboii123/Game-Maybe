-- COLLECTION OF MAP OBJECTS -- 
require "physics"
--GENERAL--
function loadGeneral()
  general = {} -- Table to hold all our general objects
end

function drawGeneral()
  
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

-- HUB (+1000) --

function loadHub()
  hub = {} -- Table to hold all our intro level objects

  hub.ground = {}
  hub.ground.body = love.physics.newBody(world, 1280/2, 1000 + 720/2)
  hub.ground.shape = love.physics.newRectangleShape(1000, 50)
  hub.ground.fixture = love.physics.newFixture(hub.ground.body, hub.ground.shape, 0)
  hub.ground.image = "hey"
end

function drawHub()
  love.graphics.polygon("fill", hub.ground.body:getWorldPoints(hub.ground.shape:getPoints()))
end

-- LEVEL 1 (+2000) --
function loadLevel1()
  level1 = {} -- Table to hold all our intro level objects

  level1.ground = {}
  level1.ground.body = love.physics.newBody(world, 1280/2, 2000 + 720/2)
  level1.ground.shape = love.physics.newRectangleShape(1000, 50)
  level1.ground.fixture = love.physics.newFixture(level1.ground.body, level1.ground.shape, 0)
  level1.ground.image = "hey"
end


function drawLevel1()
  love.graphics.polygon("fill", level1.ground.body:getWorldPoints(level1.ground.shape:getPoints()))
end

-- LEVEL 2 (+3000) --
function loadLevel2()
  level2 = {} -- Table to hold all our intro level objects

  level2.ground = {}
  level2.ground.body = love.physics.newBody(world, 1280/2, 3000+720/2)
  level2.ground.shape = love.physics.newRectangleShape(1000, 50)
  level2.ground.fixture = love.physics.newFixture(level2.ground.body, level2.ground.shape, 0)
  level2.ground.image = "hey"
end

function drawLevel2()
  love.graphics.polygon("fill", level2.ground.body:getWorldPoints(level2.ground.shape:getPoints()))
end

-- LEVEL 3 (+4000) --
function loadLevel3()
  level3 = {} -- Table to hold all our intro level objects

  level3.ground = {}
  level3.ground.body = love.physics.newBody(world, 1280/2, 4000+720/2)
  level3.ground.shape = love.physics.newRectangleShape(1000, 50)
  level3.ground.fixture = love.physics.newFixture(level3.ground.body, level3.ground.shape, 0)
  level3.ground.image = "hey"
end

function drawLevel3()
  love.graphics.polygon("fill", level3.ground.body:getWorldPoints(level3.ground.shape:getPoints()))
end