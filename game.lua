local Game = {}

function Game.create(player)
  return setmetatable({entities = {}, player = player}, {__index = Game})
end

function Game:insertEntity(entity)
  table.insert(self.entities, entity)
end

function Game:removeEntity(idx)
  table.remove(self.entities, idx)
end

function Game:update(dt)
  -- update the entities that exist
  for i, entity in ipairs(self.entities) do
    entity:update(self, dt, i)
  end
  self.player:update(self, dt)
end

function Game:draw()
  for _, entity in ipairs(self.entities) do
    if entity.draw then entity:draw() end
  end
  self.player:draw()
end

return Game
