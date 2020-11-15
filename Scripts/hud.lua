local Actor = Actor or require "Scripts/actor"
local Hud = Actor:extend()


function Hud:new()
 timeLeft = 90
 font = love.graphics.newFont("aAtmospheric.ttf", 18)
 playerScore = 0
 

 GasGasGas=love.audio.newSource("SoundEffects/Manuel - Gas Gas Gas.mp3","static")
 RunningInThe90=love.audio.newSource("SoundEffects/Running in the 90's.mp3","static")
 DejaVu=love.audio.newSource("SoundEffects/Initial D - Deja Vu.mp3","static")
 GasGasGas:setVolume(0.2)
 RunningInThe90:setVolume(0.2)
 DejaVu:setVolume(0.2)
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