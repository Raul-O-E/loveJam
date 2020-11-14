actorList = {}  --Lista de elementos de juego
local Player = Player or require "Scripts/player"
local Data = Data or require "data"
local Box = Box or require "Scripts/box"
local Wave = Wave or require "Scripts/wave"
local Basura = Basura or require "Scripts/basura"
local Car = Car or require "Scripts/car"
math.randomseed(os.time())

timerSpawn = 0

function love.load()
  actorList = {}
  backgroundImage = love.graphics.newImage("Textures/background.png")
  backgroundImage2 = love.graphics.newImage("Textures/background.png")
  backgroundImage1Y = 0
  backgroundImage2Y = 1275
<<<<<<< Updated upstream
=======
  local c = Car()
  table.insert(actorList,c)
>>>>>>> Stashed changes
  local p = Player()  
  table.insert(actorList,p)
end

function love.update(dt)
  timerSpawn = timerSpawn + dt
  if timerSpawn >= SPAWN_RATE then
    timerSpawn = 0
    obstacleRnd = math.random(3)
    if obstacleRnd == 1 then
      x = Box:extend()
    elseif obstacleRnd == 2 then
      x = Basura:extend()
    elseif obstacleRnd == 3 then
      x = Basura:extend()
    end
    x:new()
    table.insert(actorList,x)
  end
  
  for _,v in ipairs(actorList) do
    v:update(dt)
  end
  backgroundImage1Y = backgroundImage1Y - 100 * dt
  backgroundImage2Y = backgroundImage2Y - 100 * dt

  if backgroundImage1Y <= 0 and backgroundImage1Y > backgroundImage2Y then
    backgroundImage2Y = 1275
  end
  if backgroundImage2Y <= 0 and backgroundImage2Y > backgroundImage1Y then
    backgroundImage1Y = 1275
  end
end

function love.draw()

  love.graphics.draw(backgroundImage,0,backgroundImage1Y)
  love.graphics.draw(backgroundImage2,0, backgroundImage2Y)
  for _,v in ipairs(actorList) do
    v:draw()
  end
end
function love.keypressed(key)
  
  
end
    