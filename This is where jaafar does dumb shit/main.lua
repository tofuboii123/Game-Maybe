function love.load()
background = love.graphics.newImage("test.png")
forefront = love.graphics.newImage("anime.png")
end
function love.draw()
    love.graphics.draw(forefront)
    love.graphics.print("Nothing personal kid", 220, 250)
end

