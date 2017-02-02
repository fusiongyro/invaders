local lume = require "lib.lume"

local Enemy = {}

function Enemy.populate(game, level)
  -- add an enemy for fun
  for i=1,2 do
    for j=80,love.graphics.getWidth()-160,100 do
      game:insertEntity(Enemy.create({x=j, y=100*i}, "Red", 1))
    end
  end
end

function Enemy.create(position, color, style)
  local inst = {}

  inst.origin   = {x = position.x, y = position.y}
  inst.position = position
  inst.speed    = 40
  inst.dir      = 1
  inst.sprite   = love.graphics.newImage("PNG/Enemies/enemy" .. color .. style ..".png")

  return setmetatable(inst, { __index = Enemy })
end

function Enemy:update(game, dt, i)
  local newX = self.position.x + (self.speed * dt * self.dir)
  self.position.x = lume.clamp(newX, self.origin.x - 40, self.origin.x + 40)

  -- maybe switch directions after moving down a bit
  if self.position.x == self.origin.x + 40 or self.position.x == self.origin.x - 40 then
    self.position.y = self.position.y + 10
    self.dir = -self.dir
  end
end

function Enemy:draw()
  love.graphics.draw(self.sprite, self.position.x, self.position.y)
end

return Enemy
