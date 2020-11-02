actorList = {}  --Lista de elementos de juego
local Asteroid = Asteroid or require "Scripts/Asteroid"
local Ship = Ship or require "Scripts/Ship"


function love.load()
  local s = Ship:extend()
  s:new()
  table.insert(actorList,s)
  local a = Asteroid:extend()
  a:new()
  table.insert(actorList,a)
end

function love.update(dt)
  for _,v in ipairs(actorList) do
    v:update(dt)
  end
end

function love.draw()
  for _,v in ipairs(actorList) do
    v:draw()
  end
end

function love.keypressed(key)
  for _,v in ipairs(actorList) do
    if v:is(Ship) then
      v:keyPressed(key)
    end
  end
  if key == "a" then
    x = Asteroid:extend()
    x:new()
    table.insert(actorList,x)
  end 
end
