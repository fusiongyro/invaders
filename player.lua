local Missile = require "missile"
local Player = {}

local lume = require("lib.lume")

function Player.create()
  local inst = setmetatable({}, { __index = Player })

  inst.sprite = love.graphics.newImage("PNG/playerShip1_blue.png")
  inst.position = {x = 250, y = 500}
  inst.orientation = 0

  return inst
end

function Player:fireMissile(game)
  Missile.fireFrom(game, self.position.x + 45, self.position.y)
end

function Player:update(game, dt)
  if love.keyboard.isDown("left") then
    self.position.x = lume.clamp(self.position.x - 1000 * dt, 0, love.graphics.getWidth()-self.sprite:getWidth())
  elseif love.keyboard.isDown("right") then
    self.position.x = lume.clamp(self.position.x + 1000 * dt, 0, love.graphics.getWidth()-self.sprite:getWidth())
  end
end

function Player:draw()
  love.graphics.draw(self.sprite, self.position.x, self.position.y)
end

return Player
