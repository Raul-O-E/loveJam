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
  love.graphics.print("YOU WON",SCREEN_WIDTH/2,SCREEN_HEIGHT/2)
  love.graphics.reset()
end

function youWonMenu:timeLeft(dt)
end

function youWonMenu:addScore(dt)
end

return youWonMenu