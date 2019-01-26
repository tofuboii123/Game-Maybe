function windowSet(width, height)
  function love.conf(t)
    t.window.title = "PLACEHOLDER"
    t.window.icon = "Images/sheep.png"
  end
  love.window.setMode(width, height)
end