local Missile = {}


function Missile.fireFrom(game, startX, startY)
  local gunsound = love.audio.newSource("Bonus/sfx_laser1.ogg", "static")
  gunsound:play()
  game:insertEntity(Missile.create(startX, startY))
end

function Missile.create(startX, startY)
  local inst = {}

  inst.position = {x = startX, y = startY}
  inst.sprite = love.graphics.newImage("PNG/Lasers/laserBlue01.png")

  return setmetatable(inst, { __index = Missile})
end

function Missile:update(game, dt, i)
  self.position.y = self.position.y - (1000 * dt)

  if self.position.y < 0 then
    game:removeEntity(i)
  end
end

function Missile:draw()
  love.graphics.draw(self.sprite, self.position.x, self.position.y)
end

return Missile
