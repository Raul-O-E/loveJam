actorList = {}  --Lista de elementos de juego
local Player = Player or require "Scripts/player"
local Data = Data or require "data"
local Box = Box or require "Scripts/box"
local Wave = Wave or require "Scripts/wave"
local Hud = Hud or require "Scripts/Hud"
local Basura = Basura or require "Scripts/basura"
local GameOverMenu = GameOverMenu or require "Scripts/gameOverMenu"
local YouWonMenu = YouWonMenu or require "Scripts/youWonMenu"
local StartMenu = StartMenu or require "Scripts/startMenu"
local Car = Car or require "Scripts/car"
math.randomseed(os.time())

timerSpawn = 0

function love.load()
  gameover = 0
  
  local s = StartMenu()  
  table.insert(actorList,s)
end

function loadGame()
  gameover = 1
  actorList = {}
  timeLeft = INITIAL_TIME_LEFT
  love.audio.stop()

  soundRnd=math.random(2)
  if soundRnd == 1 then
    DejaVu:play()
  elseif soundRnd == 2 then     
    GasGasGas:play()       
  end

  backgroundImage = love.graphics.newImage("Textures/background.png")
  backgroundImage2 = love.graphics.newImage("Textures/background.png")
  backgroundImage1Y = 0
  backgroundImage2Y = 1275

  local w = Wave()
  table.insert(actorList,w)

  local p = Player()  
  table.insert(actorList,p)
  local h = Hud() 
  table.insert(actorList,h)
  local gom = GameOverMenu() 
  table.insert(actorList,gom)  
  local yw = YouWonMenu()
  table.insert(actorList,yw)
end

function love.update(dt)
  if gameover==0 then
    --update startScreen
  elseif gameover == 1 then
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
          if obstacle:is(Basura) or obstacle:is(Car) or obstacle:is(Box) or obstacle:is(Wave) then
            if player.intersect(obstacle, player) then
              player:hit()
              playerCrash:play()
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
    
    if timeLeft<=0 then
      gameover = 3
    end
  elseif gameover == 2 then
    --update gameOverScreen
  end
end

function love.draw()
  if gameover == 1 then
    love.graphics.draw(backgroundImage,0,backgroundImage1Y)
    love.graphics.draw(backgroundImage2,0, backgroundImage2Y)
    for _,v in ipairs(actorList) do
      if not v:is(GameOverMenu) and not v:is(YouWonMenu) then
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
  elseif gameover == 2 then
    love.graphics.draw(backgroundImage,0,0)
    for _,v in ipairs(actorList) do
      if v:is(GameOverMenu) then
        v:draw()
      end
    end    
  elseif gameover == 0 then
    backgroundImage = love.graphics.newImage("Textures/background.png")
    love.graphics.draw(backgroundImage,0,0)
    for _,v in ipairs(actorList) do
      if v:is(StartMenu) then
        v:draw()
      end
    end 
  elseif gameover == 3 then 
    love.graphics.draw(backgroundImage,0,0)
    for _,v in ipairs(actorList) do
      if v:is(YouWonMenu) then
        v:draw()
      end
    end
  end
end

function love.keypressed(key) 
  if key==("space") and gameover == 0 then
    loadGame()
  elseif key==("escape") and gameover == 0 then
    os.exit()
  elseif key==("space") and (gameover == 2 or gameover == 3) then
    YouWonMenu:keyIsDown("space")
  elseif key==("escape") and (gameover == 2 or gameover == 3) then
    YouWonMenu:keyIsDown("escape")
  end
end
