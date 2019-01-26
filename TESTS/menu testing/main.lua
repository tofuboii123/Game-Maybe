menu = true
menuSelect = 0

function love.update(dt)
  if menu == true then
    if love.keyboard.isDown("return") then
      menu = false
    end
  end
  if love.keyboard.isDown("down") then
    if menuSelect == 0 then
      menuSelect = menuSelect + 1
    end
  end
  if love.keyboard.isDown("up") then
    if menuSelect == 1 then
      menuSelect = menuSelect - 1
    end
  end
end
function love.draw()
  if menu then
    if menuSelect == 0 then
      love.graphics.print("Press Enter",30,0)
      love.graphics.print("Options", 0, 30)
    end
    if menuSelect == 1 then 
      love.graphics.print("Press Enter", 0, 0)
      love.graphics.print("Options", 30, 30)
    end
  else
  end
end