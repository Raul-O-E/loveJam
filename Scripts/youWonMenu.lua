local Actor = Actor or require "Scripts/actor"
local Data = Data or require "data"
local youWonMenu = Actor:extend()


function youWonMenu:new()
  fontYouWon = love.graphics.newFont("aAtmospheric.ttf", 48)
end

function youWonMenu:update(dt)
end

function youWonMenu:draw()
  love.graphics.setColor(0, 0, 0)
  love.graphics.setFont(fontYouWon)
  love.graphics.print("YOU WON",SCREEN_WIDTH/4,SCREEN_HEIGHT/3)
  love.graphics.setColor(1, 0, 0)
  if math.floor(love.timer.getTime()) % 2 == 0 then
  love.graphics.print("Space to play", SCREEN_WIDTH/7, SCREEN_HEIGHT/2)
  love.graphics.print("ESC to quit", SCREEN_WIDTH/4-20, SCREEN_HEIGHT/1.5)
  end
  love.graphics.reset()
end

function youWonMenu:timeLeft(dt)
end

function youWonMenu:addScore(dt)
end

function youWonMenu:keyIsDown(key)
  if (key == "space") then
    love.load()
  elseif (key == "escape") then
    os.exit()
  end
end

return youWonMenu