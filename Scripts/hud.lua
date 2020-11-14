local Actor = Actor or require "Scripts/actor"
local Hud = Actor:extend()


function Hud:new()
 
 font = love.graphics.newFont("aAtmospheric.ttf", 18)
 playerScore = 0
 timeLeft = 90
 
end
function Hud:update(dt)
  
  Hud.super.update(self,dt)
  Hud:addScore(dt)
  Hud:timeLeft(dt)  
  
end
function Hud:draw()
  love.graphics.setColor(0, 1, 1)
  love.graphics.setFont(font)
  love.graphics.print("SCORE: "..math.floor(playerScore),570,100)
  love.graphics.setFont(font)
  love.graphics.print("TIME LEFT: "..math.floor(timeLeft),5,100)
  love.graphics.reset()
end
function Hud:timeLeft(dt)
  timeLeft = timeLeft - dt
  end
function Hud:addScore(dt)
  playerScore = playerScore + dt * 10
end
return Hud