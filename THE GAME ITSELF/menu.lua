require "font"
Object = require "classic"
Menu = Object:extend()
menuDisplay = false
menuTimer = 5
volumeState = 0
moon = love.graphics.newImage("Images/Art-marte/luna0000.png")
LOGO = love.graphics.newImage("Images/Art-marte/title0000.png")

function Menu:new()
  self.menuState = 0
  self.subMenu = 0
  self.music = love.audio.newSource("Music/spooky-ambience.wav","static")
end

function Menu:update(dt)
  love.audio.play(self.music)
  
  if oscilate  then
    oscilate = false
  else  
    oscilate = true
  end
 
  
  function love.keypressed(key)
    if self.subMenu == 0 then
      if key == "z" and self.menuState == 0 then
        love.audio.stop(self.music)
        menuDisplay = false
      elseif key == "z" and self.menuState == 1 then
        self.subMenu = 1
      elseif key == "z" and self.menuState == 2 then
        self.subMenu = 2
      elseif (key == "z") and self.menuState == 3 then
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
    elseif self.subMenu == 1 then
      if key == "escape" then
        self.subMenu = 0
      end
    elseif self.subMenu == 2 then
      if key == "escape" then
        self.subMenu = 0
      elseif key == "left" then
        if volumeState < 5 then
          volumeState=volumeState + 1
        end
      elseif key == "right" then
        if volumeState> 0 then
          volumeState=volumeState - 1
        end
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
  love.graphics.setBackgroundColor(0.4, 0.4, 0.4)
  love.graphics.circle("fill", 500 , 100, 100)
  love.graphics.setColor(0.7,0.7,0.7)
  love.graphics.draw(moon, 515, 50)
  love.graphics.setColor(1,1,1)
  love.graphics.draw(LOGO, 350, 100)
  love.graphics.setColor(0.52, 0.46, 0.39)
  love.graphics.polygon("fill", 0, 720, 320, 650, 640, 720, 0+960, 650, 320 + 960, 650, 640 +960, 720)
  if self.subMenu == 0 then
    if self.menuState == 0 then
      love.graphics.setColor(0,1,0)
      love.graphics.rectangle("fill", (WINDOW_WIDTH/2 - 150/2), (WINDOW_HEIGHT/2 - 50/2), 150, 50)
      love.graphics.setColor(1, 1, 1)
      love.graphics.print("Start Game", (WINDOW_WIDTH/2 - 150/4 - 5), (WINDOW_HEIGHT/2 - 50/4 + 5))
      
      love.graphics.setColor(1,0,0)
      love.graphics.rectangle("line", (WINDOW_WIDTH/2 - 150/2), 75 + (WINDOW_HEIGHT/2 - 50/2), 150, 50)
      love.graphics.setColor(1, 1, 1)
      love.graphics.print("How To Play", (WINDOW_WIDTH/2 - 150/4 - 12), 75 + (WINDOW_HEIGHT/2 - 50/4 + 5))
      love.graphics.setColor(1,0,0)
      love.graphics.rectangle("line", (WINDOW_WIDTH/2 - 150/2), 150 + (WINDOW_HEIGHT/2 - 50/2), 150, 50)
      love.graphics.setColor(1, 1, 1)
      love.graphics.print("Options", (WINDOW_WIDTH/2 - 150/4 + 5), 150 + (WINDOW_HEIGHT/2 - 50/4 + 5))
      love.graphics.setColor(1,0,0)
      love.graphics.rectangle("line", (WINDOW_WIDTH/2 - 150/2), 225 + (WINDOW_HEIGHT/2 - 50/2), 150, 50)
      love.graphics.setColor(1, 1, 1)
      love.graphics.print("Exit", (WINDOW_WIDTH/2 - 150/4 + 17), 225+ (WINDOW_HEIGHT/2 - 50/4 + 5))
      
    elseif self.menuState == 1 then
      love.graphics.setColor(1,0,0)
      love.graphics.rectangle("line", (WINDOW_WIDTH/2 - 150/2), (WINDOW_HEIGHT/2 - 50/2), 150, 50)
      love.graphics.setColor(1, 1, 1)
      love.graphics.print("Start Game", (WINDOW_WIDTH/2 - 150/4 - 5), (WINDOW_HEIGHT/2 - 50/4 + 5))
          
      love.graphics.setColor(0,1,0)
      love.graphics.rectangle("fill", (WINDOW_WIDTH/2 - 150/2), 75 + (WINDOW_HEIGHT/2 - 50/2), 150, 50)
      love.graphics.setColor(1, 1, 1)
      love.graphics.print("How To Play", (WINDOW_WIDTH/2 - 150/4 - 12), 75 + (WINDOW_HEIGHT/2 - 50/4 + 5))
      
      love.graphics.setColor(1,0,0)
      love.graphics.rectangle("line", (WINDOW_WIDTH/2 - 150/2), 150 + (WINDOW_HEIGHT/2 - 50/2), 150, 50)
      love.graphics.setColor(1, 1, 1)
      love.graphics.print("Options", (WINDOW_WIDTH/2 - 150/4 + 5), 150 + (WINDOW_HEIGHT/2 - 50/4 + 5))
      love.graphics.setColor(1,0,0)
      love.graphics.rectangle("line", (WINDOW_WIDTH/2 - 150/2), 225 + (WINDOW_HEIGHT/2 - 50/2), 150, 50)
      love.graphics.setColor(1, 1, 1)
      love.graphics.print("Exit", (WINDOW_WIDTH/2 - 150/4 + 17), 225+ (WINDOW_HEIGHT/2 - 50/4 + 5))
      
    elseif self.menuState == 2 then
      love.graphics.setColor(1,0,0)
      love.graphics.rectangle("line", (WINDOW_WIDTH/2 - 150/2), (WINDOW_HEIGHT/2 - 50/2), 150, 50)
       love.graphics.setColor(1, 1, 1)
      love.graphics.print("Start Game", (WINDOW_WIDTH/2 - 150/4 - 5), (WINDOW_HEIGHT/2 - 50/4 + 5))
      love.graphics.setColor(1,0,0)
      love.graphics.rectangle("line", (WINDOW_WIDTH/2 - 150/2), 75 + (WINDOW_HEIGHT/2 - 50/2), 150, 50)
      love.graphics.setColor(1, 1, 1)
      love.graphics.print("How To Play", (WINDOW_WIDTH/2 - 150/4 - 12), 75 + (WINDOW_HEIGHT/2 - 50/4 + 5))
      
      love.graphics.setColor(0,1,0)
      love.graphics.rectangle("fill", (WINDOW_WIDTH/2 - 150/2), 150 + (WINDOW_HEIGHT/2 - 50/2), 150, 50)
      love.graphics.setColor(1, 1, 1)
      love.graphics.print("Options", (WINDOW_WIDTH/2 - 150/4 + 5), 150 + (WINDOW_HEIGHT/2 - 50/4 + 5))
      
      love.graphics.setColor(1,0,0)
      love.graphics.rectangle("line", (WINDOW_WIDTH/2 - 150/2), 225 + (WINDOW_HEIGHT/2 - 50/2), 150, 50)
      love.graphics.setColor(1, 1, 1)
      love.graphics.print("Exit", (WINDOW_WIDTH/2 - 150/4 + 17), 225+ (WINDOW_HEIGHT/2 - 50/4 + 5))
      
    elseif self.menuState == 3 then
      love.graphics.setColor(1,0,0)
      love.graphics.rectangle("line", (WINDOW_WIDTH/2 - 150/2), (WINDOW_HEIGHT/2 - 50/2), 150, 50)
       love.graphics.setColor(1, 1, 1)
      love.graphics.print("Start Game", (WINDOW_WIDTH/2 - 150/4 - 5), (WINDOW_HEIGHT/2 - 50/4 + 5))
      love.graphics.setColor(1,0,0)
      love.graphics.rectangle("line", (WINDOW_WIDTH/2 - 150/2), 75 + (WINDOW_HEIGHT/2 - 50/2), 150, 50)
      love.graphics.setColor(1, 1, 1)
      love.graphics.print("How To Play", (WINDOW_WIDTH/2 - 150/4 - 12), 75 + (WINDOW_HEIGHT/2 - 50/4 + 5))
      love.graphics.setColor(1,0,0)
      love.graphics.rectangle("line", (WINDOW_WIDTH/2 - 150/2), 150 + (WINDOW_HEIGHT/2 - 50/2), 150, 50)
      love.graphics.setColor(1, 1, 1)
      love.graphics.print("Options", (WINDOW_WIDTH/2 - 150/4 + 5), 150 + (WINDOW_HEIGHT/2 - 50/4 + 5))
      
      love.graphics.setColor(0,1,0)
      love.graphics.rectangle("fill", (WINDOW_WIDTH/2 - 150/2), 225 + (WINDOW_HEIGHT/2 - 50/2), 150, 50)
      love.graphics.setColor(1, 1, 1)
      love.graphics.print("Exit", (WINDOW_WIDTH/2 - 150/4 + 17), 225+ (WINDOW_HEIGHT/2 - 50/4 + 5))
    end
    
  elseif self.subMenu == 1 then
    
    -- Draw Controls
    love.graphics.setColor(1, 1, 1)
    love.graphics.print("Z - Interact/Select", WINDOW_WIDTH/2 - 55, WINDOW_HEIGHT/2)
    love.graphics.print("X - Jump", WINDOW_WIDTH/2 - 55, WINDOW_HEIGHT/2 + 15)
    love.graphics.print("Arrow Keys - Move", WINDOW_WIDTH/2 - 55, WINDOW_HEIGHT/2 + 30)
    love.graphics.print("Esc - Exit Game", WINDOW_WIDTH/2 - 55, WINDOW_HEIGHT/2 + 45)
    love.graphics.print("Press Esc to go back to the menu", WINDOW_WIDTH/2 - 125, WINDOW_HEIGHT/2 + 100)
    
  elseif self.subMenu == 2 then
    
    -- Draw Options
    love.graphics.polygon("fill", WINDOW_WIDTH/2 - 55,  WINDOW_HEIGHT/2 + 55, WINDOW_WIDTH/2 - 65,  WINDOW_HEIGHT/2 + 45, WINDOW_WIDTH/2 - 55,  WINDOW_HEIGHT/2 + 35)
    love.graphics.polygon("fill", WINDOW_WIDTH/2 + 55,  WINDOW_HEIGHT/2 + 55, WINDOW_WIDTH/2 + 65,  WINDOW_HEIGHT/2 + 45, WINDOW_WIDTH/2 + 55,  WINDOW_HEIGHT/2 + 35)
    love.graphics.setColor(1,1,1)
    love.graphics.print("Press Esc to go back to the menu", WINDOW_WIDTH/2 - 145, WINDOW_HEIGHT/2 + 100)
    if volumeState == 0 then
      love.audio.setVolume(1)
      love.graphics.setColor(1, 1, 1)
      love.graphics.print("Volume is at 100%", WINDOW_WIDTH/2 - 78, WINDOW_HEIGHT/2)
      love.graphics.setColor(0, 1, 0)
      love.graphics.rectangle("fill", WINDOW_WIDTH/2 - 45, WINDOW_HEIGHT/2 + 30, 10, 30)
      love.graphics.setColor(0, 1, 0)
      love.graphics.rectangle("fill", WINDOW_WIDTH/2 - 25, WINDOW_HEIGHT/2 + 30, 10, 30)
      love.graphics.setColor(0, 1, 0)
      love.graphics.rectangle("fill", WINDOW_WIDTH/2 - 5 , WINDOW_HEIGHT/2 + 30, 10, 30)
      love.graphics.setColor(0, 1, 0)
      love.graphics.rectangle("fill", WINDOW_WIDTH/2 + 15, WINDOW_HEIGHT/2 + 30, 10, 30)
      love.graphics.setColor(0, 1, 0)
      love.graphics.rectangle("fill", WINDOW_WIDTH/2 + 35, WINDOW_HEIGHT/2 + 30, 10, 30)
    elseif volumeState == 1 then
      love.audio.setVolume(0.8)
      love.graphics.setColor(1, 1, 1)
      love.graphics.print("Volume is at 80%", WINDOW_WIDTH/2 - 75, WINDOW_HEIGHT/2)
      love.graphics.setColor(0, 1, 0)
      love.graphics.rectangle("fill", WINDOW_WIDTH/2 - 45, WINDOW_HEIGHT/2 + 30, 10, 30)
      love.graphics.setColor(0, 1, 0)
      love.graphics.rectangle("fill", WINDOW_WIDTH/2 - 25, WINDOW_HEIGHT/2 + 30, 10, 30)
      love.graphics.setColor(0, 1, 0)
      love.graphics.rectangle("fill", WINDOW_WIDTH/2 - 5 , WINDOW_HEIGHT/2 + 30, 10, 30)
      love.graphics.setColor(0, 1, 0)
      love.graphics.rectangle("fill", WINDOW_WIDTH/2 + 15, WINDOW_HEIGHT/2 + 30, 10, 30)
    elseif volumeState == 2 then
      love.audio.setVolume(0.6)
      love.graphics.setColor(1, 1, 1)
      love.graphics.print("Volume is at 60%", WINDOW_WIDTH/2 - 75, WINDOW_HEIGHT/2)
      love.graphics.setColor(0, 1, 0)
      love.graphics.rectangle("fill", WINDOW_WIDTH/2 - 45, WINDOW_HEIGHT/2 + 30, 10, 30)
      love.graphics.setColor(0, 1, 0)
      love.graphics.rectangle("fill", WINDOW_WIDTH/2 - 25, WINDOW_HEIGHT/2 + 30, 10, 30)
      love.graphics.setColor(0, 1, 0)
      love.graphics.rectangle("fill", WINDOW_WIDTH/2 - 5 , WINDOW_HEIGHT/2 + 30, 10, 30)
    elseif volumeState == 3 then
      love.audio.setVolume(0.4)
      love.graphics.setColor(1, 1, 1)
      love.graphics.print("Volume is at 40%", WINDOW_WIDTH/2 - 75, WINDOW_HEIGHT/2)
      love.graphics.setColor(0, 1, 0)
      love.graphics.rectangle("fill", WINDOW_WIDTH/2 - 45, WINDOW_HEIGHT/2 + 30, 10, 30)
      love.graphics.setColor(0, 1, 0)
      love.graphics.rectangle("fill", WINDOW_WIDTH/2 - 25, WINDOW_HEIGHT/2 + 30, 10, 30)
    elseif volumeState == 4 then
      love.audio.setVolume(0.2)
      love.graphics.setColor(1, 1, 1)
      love.graphics.print("Volume is at 20%", WINDOW_WIDTH/2 - 75, WINDOW_HEIGHT/2)
      love.graphics.setColor(0, 1, 0)
      love.graphics.rectangle("fill", WINDOW_WIDTH/2 - 45, WINDOW_HEIGHT/2 + 30, 10, 30)
    elseif volumeState == 5 then
      love.audio.setVolume(0)
      love.graphics.setColor(1, 1, 1)
      love.graphics.print("Volume is at 0%", WINDOW_WIDTH/2 - 75, WINDOW_HEIGHT/2)
    end
  end
end