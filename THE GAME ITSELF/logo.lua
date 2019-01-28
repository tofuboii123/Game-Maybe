require "menu"
Object = require "classic"
Logo = Object:extend()
logoImage = love.graphics.newImage("Images/logo.png")
logoDisplay = true
opacity = 0
logoTimer = 5

function Logo:create()
end

function Logo:update(dt)
  if opacity < 1 then
    if logoTimer == 5 then
      opacity = opacity + 0.03
      logoTimer = 0
    end
    logoTimer = logoTimer + 1
  else
    menuDisplay = true
    logoDisplay = false
  end
end

function Logo:draw()
  love.graphics.setBackgroundColor(0,0,0,opacity)
  love.graphics.setColor(1,1,1,opacity)
  love.graphics.draw(logoImage, WINDOW_WIDTH/2 - logoImage:getWidth()/2, WINDOW_HEIGHT/2 - logoImage:getHeight()/2)
end