local Actor = Actor or require "Scripts/actor"
Wave = Actor:extend()

function Wave:new(x,y)
  Wave.super.new(self,"Textures/ola.png",400,-250,0,0,1)
end

function Wave:uptade(dt)
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