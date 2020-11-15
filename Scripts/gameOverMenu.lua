local Actor = Actor or require "Scripts/actor"
local Data = Data or require "data"
local gameOverMenu = Actor:extend()


function gameOverMenu:new()
  fontGameOver = love.graphics.newFont("aAtmospheric.ttf", 48)
end

function gameOverMenu:update(dt)
end
function gameOverMenu:draw()
  love.graphics.setColor(0, 0, 0)
  love.graphics.setFont(fontGameOver)
  love.graphics.print("GAME OVER",SCREEN_WIDTH/4-10,SCREEN_HEIGHT/3)
  love.graphics.setColor(1, 0, 0)
  if math.floor(love.timer.getTime()) % 2 == 0 then
    love.graphics.print("Space to play", SCREEN_WIDTH/7+10, SCREEN_HEIGHT/2)
    love.graphics.print("ESC to quit", SCREEN_WIDTH/4-20, SCREEN_HEIGHT/1.5)
  end
  love.graphics.reset()
end

function gameOverMenu:timeLeft(dt)
end

function gameOverMenu:addScore(dt)
end

function gameOverMenu:keyIsDown(key)
  if (key == "space") then
    
  elseif (key == "esc") then
    os.exit()
  end
end
return gameOverMenu