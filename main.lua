local Game = require "game"
local Player = require "player"
local Enemy = require "enemy"
local Background = require "background"

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
  local background = Background.create("Backgrounds/darkPurple.png")
  game:insertEntity(background)

  -- handle the space key
  addKeypressHandler(function(key)
    if key == 'space' then player:fireMissile(game) end
  end)

  Enemy.populate(game, 1)
end

love.update = function(dt)
  require("lib.lurker").update()
  require("lib.lovebird").update()
  game:update(dt)
end

love.draw = function()
  game:draw(dt)
end
