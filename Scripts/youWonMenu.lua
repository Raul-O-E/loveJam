local Actor = Actor or require "Scripts/actor"
local Data = Data or require "data"
local youWonMenu = Actor:extend()


function youWonMenu:new()
  fontYouWon = love.graphics.newFont("aAtmospheric.ttf", 48)
end

function youWonMenu:update(dt)
end

function youWonMenu:draw()
  love.graphics.setColor(0, 1, 0)
  love.graphics.setFont(fontYouWon)
  love.graphics.print("YOU WON",SCREEN_WIDTH/4,SCREEN_HEIGHT/3)
  love.graphics.print("Space to play", SCREEN_WIDTH/7, SCREEN_HEIGHT/2)
  love.graphics.print("Press ESC to exit",SCREEN_WIDTH/7-20,SCREEN_HEIGHT/1.5)
  love.graphics.reset()
end

function youWonMenu:timeLeft(dt)
end

function youWonMenu:addScore(dt)
end

function youWonMenu:keyIsDown(key)
  if (key == "space") then
    gameOver = false
  elseif (key == "escape") then
    os.exit()
  end
end

return youWonMenu