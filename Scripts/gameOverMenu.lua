local Actor = Actor or require "Scripts/actor"
local Data = Data or require "data"
local gameOverMenu = Actor:extend()


function gameOverMenu:new()
end

function gameOverMenu:update(dt)
end

function gameOverMenu:draw()
  love.graphics.setColor(0, 0, 0)
  love.graphics.setFont(font)
  love.graphics.print("GAME OVER",SCREEN_WIDTH/2,SCREEN_HEIGHT/2)
  love.graphics.reset()
end

function gameOverMenu:timeLeft(dt)
end

function gameOverMenu:addScore(dt)
end

return gameOverMenu