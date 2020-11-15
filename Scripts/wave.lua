local Actor = Actor or require "Scripts/actor"
local Data = Data or require "data"
Wave = Actor:extend()

timerWaveMov = 0
timerWaveMovTotal = 0.5

function Wave:new(x,y)
  dirY = true
  Wave.super.new(self,"Textures/ola.png",400,30,0,0)
end

function Wave:update(dt)
  timerWaveMov = timerWaveMov + dt
  if timerWaveMov >= timerWaveMovTotal then
    timerWaveMov = 0
    dirY = not dirY
  end
  
  if dirY then
    self.position.y = self.position.y + WAVE_SPD * dt
  else
    self.position.y = self.position.y - WAVE_SPD * dt
  end
  
  Wave.super.update(self,dt) 
end

function Wave:draw()
  xx = self.position.x
  ox = self.origin.x
  yy = self.position.y
  oy = self.origin.y
  sx = self.scale.x
  sy = self.scale.y
  rr = self.rot
  love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)
  end
return Wave