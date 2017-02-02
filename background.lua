local Background = {}

function Background.create(filename)
  -- make the background image
  local background = love.graphics.newImage(filename)
  background:setWrap("repeat", "repeat")

  -- make a quad covering the screen with the background image
  local quad = love.graphics.newQuad(0, 0,
      love.graphics.getWidth(), love.graphics.getHeight(),
         background:getWidth(),    background:getHeight())

  local inst = {background = background, quad = quad}
  return setmetatable(inst, {__index = Background})
end

function Background:draw()
  love.graphics.draw(self.background, self.quad, 0, 0)
end

return Background
