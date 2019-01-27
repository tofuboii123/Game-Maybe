require "font"
Object = require "classic"
Menu = Object:extend()
menuDisplay = true
menuTimer = 5

function Menu:new()
  self.menuState = 0
  self.logo = WOW
end

function Menu:update(dt)
  if love.keyboard.isDown("return") and self.menuState == 0 and menuTimer == 5 then
    menu = false
  end
  if love.keyboard.isDown("down") and menuTimer == 5 then
    if self.menuState < 3 then
      self.menuState = self.menuState + 1
    end
  end
  if love.keyboard.isDown("up") and menuTimer == 5 then
    if self.menuState > 0 then
      self.menuState = self.menuState - 1
    end
  end
  
  menuTimer = menuTimer - 1
  if menuTimer == 0 then
    menuTimer = 5
  end
end

function Menu:draw()
  if self.menuState == 0 then
    love.graphics.setColor(0,1,0)
    love.graphics.rectangle("fill", (1280/2 - 150/2), (720/2 - 50/2), 150, 50)
    love.graphics.print("Start Game", (1280/2 - 150/4), (720/2 - 50/4))
        
    love.graphics.setColor(1,0,0)
    love.graphics.rectangle("fill", (1280/2 - 150/2), 75 + (720/2 - 50/2), 150, 50)
    love.graphics.print("How To Play", (1280/2 - 150/4), 75 + (720/2 - 50/4))
    love.graphics.rectangle("fill", (1280/2 - 150/2), 150 + (720/2 - 50/2), 150, 50)
    love.graphics.print("Options", (1280/2 - 150/4), 150 + (720/2 - 50/4))
    love.graphics.rectangle("fill", (1280/2 - 150/2), 225 + (720/2 - 50/2), 150, 50)
    love.graphics.print("Exit", (1280/2 - 150/4), 225+ (720/2 - 50/4))
    
  elseif self.menuState == 1 then
    love.graphics.setColor(1,0,0)
    love.graphics.rectangle("fill", (1280/2 - 150/2), (720/2 - 50/2), 150, 50)
    love.graphics.print("Start Game", (1280/2 - 150/4), (720/2 - 50/4))
        
    love.graphics.setColor(0,1,0)
    love.graphics.rectangle("fill", (1280/2 - 150/2), 75 + (720/2 - 50/2), 150, 50)
    love.graphics.print("How To Play", (1280/2 - 150/4), 75 + (720/2 - 50/4))
    
    love.graphics.setColor(1,0,0)
    love.graphics.rectangle("fill", (1280/2 - 150/2), 150 + (720/2 - 50/2), 150, 50)
    love.graphics.print("Options", (1280/2 - 150/4), 150 + (720/2 - 50/4))
    love.graphics.rectangle("fill", (1280/2 - 150/2), 225 + (720/2 - 50/2), 150, 50)
    love.graphics.print("Exit", (1280/2 - 150/4), 225+ (720/2 - 50/4))
    
  elseif self.menuState == 2 then
    love.graphics.setColor(1,0,0)
    love.graphics.rectangle("fill", (1280/2 - 150/2), (720/2 - 50/2), 150, 50)
    love.graphics.print("Start Game", (1280/2 - 150/4), (720/2 - 50/4))
    love.graphics.rectangle("fill", (1280/2 - 150/2), 75 + (720/2 - 50/2), 150, 50)
    love.graphics.print("How To Play", (1280/2 - 150/4), 75 + (720/2 - 50/4))
    
    love.graphics.setColor(0,1,0)
    love.graphics.rectangle("fill", (1280/2 - 150/2), 150 + (720/2 - 50/2), 150, 50)
    love.graphics.print("Options", (1280/2 - 150/4), 150 + (720/2 - 50/4))
    
    love.graphics.setColor(1,0,0)
    love.graphics.rectangle("fill", (1280/2 - 150/2), 225 + (720/2 - 50/2), 150, 50)
    love.graphics.print("Exit", (1280/2 - 150/4), 225+ (720/2 - 50/4))
    
  elseif self.menuState == 3 then
    love.graphics.setColor(1,0,0)
    love.graphics.rectangle("fill", (1280/2 - 150/2), (720/2 - 50/2), 150, 50)
    love.graphics.print("Start Game", (1280/2 - 150/4), (720/2 - 50/4))
    love.graphics.rectangle("fill", (1280/2 - 150/2), 75 + (720/2 - 50/2), 150, 50)
    love.graphics.print("How To Play", (1280/2 - 150/4), 75 + (720/2 - 50/4))
    love.graphics.rectangle("fill", (1280/2 - 150/2), 150 + (720/2 - 50/2), 150, 50)
    love.graphics.print("Options", (1280/2 - 150/4), 150 + (720/2 - 50/4))
    
    love.graphics.setColor(0,1,0)
    love.graphics.rectangle("fill", (1280/2 - 150/2), 225 + (720/2 - 50/2), 150, 50)
    love.graphics.print("Exit", (1280/2 - 150/4), 225+ (720/2 - 50/4))
    
  end
  
end