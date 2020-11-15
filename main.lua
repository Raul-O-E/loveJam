actorList = {}  --Lista de elementos de juego
local Player = Player or require "Scripts/player"
local Data = Data or require "data"
local Box = Box or require "Scripts/box"
local Wave = Wave or require "Scripts/wave"
local Hud = Hud or require "Scripts/Hud"
local Basura = Basura or require "Scripts/basura"
local GameOverMenu = GameOverMenu or require "Scripts/gameOverMenu"
local Car = Car or require "Scripts/car"
math.randomseed(os.time())

timerSpawn = 0
timeLeft = 90
gameover = false

function love.load()

  backgroundImage = love.graphics.newImage("Textures/background.png")
  backgroundImage2 = love.graphics.newImage("Textures/background.png")
  backgroundImage1Y = 0
  backgroundImage2Y = 1275
  love.audio.setVolume(0.2)

  local w = Wave()
  table.insert(actorList,w)

  local p = Player()  
  table.insert(actorList,p)
  local h = Hud() 
  table.insert(actorList,h)
  local gom = GameOverMenu() 
  table.insert(actorList,gom)
end

function love.update(dt)
  if timeLeft > TIME_SPAWN_UP then
    spawner = SPAWN_RATE
  else
    spawner = SPAWN_RATE_2
  end
  
  timerSpawn = timerSpawn + dt
  if timerSpawn >= spawner then
    timerSpawn = 0
    obstacleRnd = math.random(3)
    if obstacleRnd == 1 then
      x = Box:extend()
    elseif obstacleRnd == 2 then
      x = Basura:extend()
    elseif obstacleRnd == 3 then
      x = Car:extend()
    end
    x:new()
    table.insert(actorList,x)
  end
  
  for _,v in ipairs(actorList) do
    v:update(dt)
  end
  
  for _,player in ipairs(actorList) do
    if player:is(Player) then
      for _,obstacle in ipairs(actorList) do
        if obstacle:is(Basura) or obstacle:is(Car) or obstacle:is(Box) then
          if player.intersect(obstacle, player) then
            player:hit()
          end
        end
      end
    end
  end
  
  
  backgroundImage1Y = backgroundImage1Y - 100 * dt
  backgroundImage2Y = backgroundImage2Y - 100 * dt

  if backgroundImage1Y <= 0 and backgroundImage1Y > backgroundImage2Y then
    backgroundImage2Y = MAX_Y
  end
  if backgroundImage2Y <= 0 and backgroundImage2Y > backgroundImage1Y then
    backgroundImage1Y = MAX_Y
  end
end

function love.draw()
  if not gameover then
    love.graphics.draw(backgroundImage,0,backgroundImage1Y)
    love.graphics.draw(backgroundImage2,0, backgroundImage2Y)
    for _,v in ipairs(actorList) do
      if not v:is(GameOverMenu) then
        v:draw()
      end
    end
    for _,v in ipairs(actorList) do
      if v:is(Wave) then
        v:draw()
      end
    end
    for _,v in ipairs(actorList) do
      if v:is(Hud) then
        v:draw()
      end
    end
    for _,v in ipairs(actorList) do
      if v:is(Player) then
        v:draw()
      end
    end
  else
    love.graphics.draw(backgroundImage,0,0)
    for _,v in ipairs(actorList) do
      if v:is(GameOverMenu) then
        v:draw()
      end
    end
  end
end

function love.keypressed(key)
  
  
end