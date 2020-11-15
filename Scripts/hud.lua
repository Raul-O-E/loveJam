local Actor = Actor or require "Scripts/actor"
local Hud = Actor:extend()
local Data = Data or require "Scripts/actor"

function Hud:new()

 font = love.graphics.newFont("aAtmospheric.ttf", 18)
 playerScore = 0
 

 
 soundRnd=math.random(3)
 if soundRnd == 1 then
    playSound(DejaVu)
  elseif soundRnd == 2 then     
    playSound(GasGasGas)       
  elseif soundRnd == 3 then
    playSound(RunningInThe90)    
  end
 
end
function Hud:update(dt)
  
  Hud.super.update(self,dt)
  Hud:addScore(dt)
  Hud:timeLeft(dt)  
  
end
function Hud:draw()
  love.graphics.setColor(0, 0, 0)
  love.graphics.setFont(font)
  love.graphics.print("SCORE: "..math.floor(playerScore),570,50)
  love.graphics.setFont(font)
  love.graphics.print("TIME LEFT: "..math.floor(timeLeft),5,50)
  love.graphics.reset()
end
function Hud:timeLeft(dt)
  timeLeft = timeLeft - dt
  end
function Hud:addScore(dt)
  playerScore = playerScore + dt * 10
end
function playSound( source )
	local clone = source:clone()
	clone:play()
end
return Hud