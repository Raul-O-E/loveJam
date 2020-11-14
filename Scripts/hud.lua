local Actor = Actor or require "Scripts/actor"
local Hud = Actor:extend()


function Hud:new()
 
 
 font = love.graphics.newFont("aAtmospheric.ttf", 18)
 playerScore = 0
 timeLeft = 90
 soundRnd=math.random(4)
 if soundRnd == 1 then
        playSound(love.audio.newSource("SoundEffects/DJ Kantik - Teriyaki boyz - Sean Paul Temperature (Club Mix).mp3","static"))
      elseif soundRnd == 2 then     
        playSound(love.audio.newSource("SoundEffects/Manuel - Gas Gas Gas.mp3","static"))       
       elseif soundRnd == 3 then
          playSound(love.audio.newSource("SoundEffects/Running in the 90's.mp3","static"))    
         elseif soundRnd == 4 then
          playSound(love.audio.newSource("SoundEffects/Initial D - Deja Vu.mp3","static"))    
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
  love.graphics.print("SCORE: "..math.floor(playerScore),570,70)
  love.graphics.setFont(font)
  love.graphics.print("TIME LEFT: "..math.floor(timeLeft),5,70)
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