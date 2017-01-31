-- this is just here to document the actual Space Shooter Redux assets I
-- actually use; in the end I will try to delete the unnecessary ones.
function asset(asset)
  return asset
end

function love.load()
  gunsound = love.audio.newSource(asset("Bonus/sfx_laser1.ogg"), "static")

  player = {
    sprite = love.graphics.newImage(asset("PNG/playerShip1_blue.png")),
    x = 250,
    y = 500,
    orientation = 0
  }
end

function love.update(dt)
  require("lurker").update()
  require("lovebird").update()
  
  if love.keyboard.isDown("space") then
    gunsound:play()
  elseif love.keyboard.isDown("left") then
    player.x = player.x - 1000 * dt
  elseif love.keyboard.isDown("right") then
    player.x = player.x + 1000 * dt
  end
end

function love.draw()
  love.graphics.draw(player.sprite, player.x, player.y)
end
