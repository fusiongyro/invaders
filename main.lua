local Game = require "game"
local Player = require "player"

local game

function addKeypressHandler(handler)
  local previous = love.keyreleased
  love.keyreleased = function (key)
    handler(key)
    if previous then previous(key) end
  end
end

love.load = function()
  local player = Player.create()
  game = Game.create(player)

  -- handle the space key
  addKeypressHandler(function(key)
    if key == 'space' then player:fireMissile(game) end
  end)
end

love.update = function(dt)
  require("lib.lurker").update()
  require("lib.lovebird").update()
  game:update(dt)
end

love.draw = function()
  game:draw(dt)
end
