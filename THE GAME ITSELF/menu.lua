require "font"
Object = require "classic"
Menu = Object:extend()
menuDisplay = true
menuTimer = 5

function Menu:new()
  self.menuState = 0
  self.music = love.audio.newSource("Music/spooky-ambience.wav","static")
  self.logo = WOW
end

function Menu:update(dt)
  love.audio.play(self.music)
  
  function love.keypressed(key)
    if key == "return" and self.menuState == 0 then
      love.audio.stop(self.music)
      menu = false
    elseif (key == "return") and self.menuState == 3 then
      love.event.quit()
    elseif (key == "down") then
      if self.menuState < 3 then
        self.menuState = self.menuState + 1
      end
    elseif (key == "up") then
      if self.menuState > 0 then
        self.menuState = self.menuState - 1
      end
    end
  end
  
  menuTimer = menuTimer - 1
  if menuTimer == 0 then
    menuTimer = 5
  end
end

function Menu:draw()
  love.graphics.setColor(1,1,1)
  love.graphics.setBackgroundColor(0.8, 0.8, 0.8)
  love.graphics.circle("fill", WINDOW_WIDTH/2 , 200, 100)
  love.graphics.setColor(0.52, 0.46, 0.39)
  love.graphics.polygon("fill", 0, 720, 320, 650, 640, 720, 0+960, 650, 320 + 960, 650, 640 +960, 720)
  if self.menuState == 0 then
    love.graphics.setColor(0,1,0)
    love.graphics.rectangle("fill", (WINDOW_WIDTH/2 - 150/2), (WINDOW_HEIGHT/2 - 50/2), 150, 50)
    love.graphics.print("Start Game", (WINDOW_WIDTH/2 - 150/4), (WINDOW_HEIGHT/2 - 50/4))
        
    love.graphics.setColor(1,0,0)
    love.graphics.rectangle("fill", (WINDOW_WIDTH/2 - 150/2), 75 + (WINDOW_HEIGHT/2 - 50/2), 150, 50)
    love.graphics.print("How To Play", (WINDOW_WIDTH/2 - 150/4), 75 + (WINDOW_HEIGHT/2 - 50/4))
    love.graphics.rectangle("fill", (WINDOW_WIDTH/2 - 150/2), 150 + (WINDOW_HEIGHT/2 - 50/2), 150, 50)
    love.graphics.print("Options", (WINDOW_WIDTH/2 - 150/4), 150 + (WINDOW_HEIGHT/2 - 50/4))
    love.graphics.rectangle("fill", (WINDOW_WIDTH/2 - 150/2), 225 + (WINDOW_HEIGHT/2 - 50/2), 150, 50)
    love.graphics.print("Exit", (WINDOW_WIDTH/2 - 150/4), 225+ (WINDOW_HEIGHT/2 - 50/4))
    
  elseif self.menuState == 1 then
    love.graphics.setColor(1,0,0)
    love.graphics.rectangle("fill", (WINDOW_WIDTH/2 - 150/2), (WINDOW_HEIGHT/2 - 50/2), 150, 50)
    love.graphics.print("Start Game", (WINDOW_WIDTH/2 - 150/4), (WINDOW_HEIGHT/2 - 50/4))
        
    love.graphics.setColor(0,1,0)
    love.graphics.rectangle("fill", (WINDOW_WIDTH/2 - 150/2), 75 + (WINDOW_HEIGHT/2 - 50/2), 150, 50)
    love.graphics.print("How To Play", (WINDOW_WIDTH/2 - 150/4), 75 + (WINDOW_HEIGHT/2 - 50/4))
    
    love.graphics.setColor(1,0,0)
    love.graphics.rectangle("fill", (WINDOW_WIDTH/2 - 150/2), 150 + (WINDOW_HEIGHT/2 - 50/2), 150, 50)
    love.graphics.print("Options", (WINDOW_WIDTH/2 - 150/4), 150 + (WINDOW_HEIGHT/2 - 50/4))
    love.graphics.rectangle("fill", (WINDOW_WIDTH/2 - 150/2), 225 + (WINDOW_HEIGHT/2 - 50/2), 150, 50)
    love.graphics.print("Exit", (WINDOW_WIDTH/2 - 150/4), 225+ (WINDOW_HEIGHT/2 - 50/4))
    
  elseif self.menuState == 2 then
    love.graphics.setColor(1,0,0)
    love.graphics.rectangle("fill", (WINDOW_WIDTH/2 - 150/2), (WINDOW_HEIGHT/2 - 50/2), 150, 50)
    love.graphics.print("Start Game", (WINDOW_WIDTH/2 - 150/4), (WINDOW_HEIGHT/2 - 50/4))
    love.graphics.rectangle("fill", (WINDOW_WIDTH/2 - 150/2), 75 + (WINDOW_HEIGHT/2 - 50/2), 150, 50)
    love.graphics.print("How To Play", (WINDOW_WIDTH/2 - 150/4), 75 + (WINDOW_HEIGHT/2 - 50/4))
    
    love.graphics.setColor(0,1,0)
    love.graphics.rectangle("fill", (WINDOW_WIDTH/2 - 150/2), 150 + (WINDOW_HEIGHT/2 - 50/2), 150, 50)
    love.graphics.print("Options", (WINDOW_WIDTH/2 - 150/4), 150 + (WINDOW_HEIGHT/2 - 50/4))
    
    love.graphics.setColor(1,0,0)
    love.graphics.rectangle("fill", (WINDOW_WIDTH/2 - 150/2), 225 + (WINDOW_HEIGHT/2 - 50/2), 150, 50)
    love.graphics.print("Exit", (WINDOW_WIDTH/2 - 150/4), 225+ (WINDOW_HEIGHT/2 - 50/4))
    
  elseif self.menuState == 3 then
    love.graphics.setColor(1,0,0)
    love.graphics.rectangle("fill", (WINDOW_WIDTH/2 - 150/2), (WINDOW_HEIGHT/2 - 50/2), 150, 50)
    love.graphics.print("Start Game", (WINDOW_WIDTH/2 - 150/4), (WINDOW_HEIGHT/2 - 50/4))
    love.graphics.rectangle("fill", (WINDOW_WIDTH/2 - 150/2), 75 + (WINDOW_HEIGHT/2 - 50/2), 150, 50)
    love.graphics.print("How To Play", (WINDOW_WIDTH/2 - 150/4), 75 + (WINDOW_HEIGHT/2 - 50/4))
    love.graphics.rectangle("fill", (WINDOW_WIDTH/2 - 150/2), 150 + (WINDOW_HEIGHT/2 - 50/2), 150, 50)
    love.graphics.print("Options", (WINDOW_WIDTH/2 - 150/4), 150 + (WINDOW_HEIGHT/2 - 50/4))
    
    love.graphics.setColor(0,1,0)
    love.graphics.rectangle("fill", (WINDOW_WIDTH/2 - 150/2), 225 + (WINDOW_HEIGHT/2 - 50/2), 150, 50)
    love.graphics.print("Exit", (WINDOW_WIDTH/2 - 150/4), 225 + (WINDOW_HEIGHT/2 - 50/4))
    
  end
  
end