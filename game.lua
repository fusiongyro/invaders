local Game = {}

function Game.create(player)
  local inst = {entities = {}, enemies = {}, player = player}
  return setmetatable(inst, {__index = Game})
end

function Game:insertEnemy(enemy)
  self:insertEntity(enemy)
  table.insert(self.enemies, enemy)
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
    if entity.update then entity:update(self, dt, i) end
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
