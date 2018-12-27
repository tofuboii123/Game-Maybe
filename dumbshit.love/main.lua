love.graphics.setDefaultFilter("nearest", "nearest")
ennemie = {}
e_controller = {}
e_controller.AllEnnemies = {}
e_controller.image = love.graphics.newImage("e.png")

function love.load()
  
  ------------------------player-------------------------
  
  player = {} 
  player.x = 0
  player.bullet = {}
  player.cooldown = 10
  player.fire = function()
    if player.cooldown <= 0 then
      player.cooldown = 10
      bullet = {}
      bullet.x = player.x + 60
      bullet.y = 520
      table.insert(player.bullet, bullet)
    end
  end
  
  ----------------------ennemies----------------------
  e_controller:spawn(0,0)
  e_controller:spawn(100,0)
  e_controller:spawn(200,0)
  e_controller:spawn(300,0)
  e_controller:spawn(400,0)
 
end

function e_controller:spawn(x,y)
    ennemie = {}
    ennemie.x = x
    ennemie.y = y
    ennemie.bullet = {}
    ennemie.cooldown = 10
    table.insert(self.AllEnnemies, ennemie)
  end
  
function ennemie:fire()
    if self.cooldown <= 0 then
      self.cooldown = 10
      Ebullet = {}
      Ebullet.x = self.x + 60
      Ebullet.y = self.y
      Ebullet.y = 520
      table.insert(ennemie.bullet, Ebullet)
    end
end
-------------------------- OOOOOOFFFFF -----------------------------

function love.update(dt)
  player.cooldown = player.cooldown - 1
  if love.keyboard.isDown("right") then --Move right
    player.x = player.x + 10
  end
  if love.keyboard.isDown("left") then --Move left
    player.x = player.x - 10
  end
  if love.keyboard.isDown("space") then -- Fire bullet
    player.fire()
  end
  for i,v in ipairs(player.bullet) do --Remove bullet after going offscreen
    if v.y < -10 then 
      table.remove(player.bullet, i)
    end
    v.y = v.y - 10
  end
  for i,e in pairs(e_controller.AllEnnemies) do  --Make ennemies go downwards
    e.y = e.y + 1
  end
  for i,e in pairs(e_controller.AllEnnemies) do -- Contact with alien
    for j,v in ipairs(player.bullet) do 
      if player.bullet.x == e.y then
        table.remove(player.bullet, j)
        table.remove(e_controller.AllEnnemies, i)
      end
    end
  end
end

function love.draw()
  --player
    love.graphics.setColor(255, 0, 0)
    love.graphics.rectangle("fill", player.x , 520, 130, 40)
    love.graphics.rectangle("fill", player.x + 55 , 500, 20, 40)
    love.graphics.setColor(255, 255, 255)
    
  --ennemies
    for _,e in  pairs(e_controller.AllEnnemies) do
      love.graphics.draw(e_controller.image, e.x, e.y, 0, 0.3)
    end
    
    --bullets
     love.graphics.setColor(1, 0.10, 0.45)
    for _,v in pairs(player.bullet) do
      love.graphics.rectangle("fill", v.x, v.y, 10, 10)
    end
    
    
end
