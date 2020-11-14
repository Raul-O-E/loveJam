local Actor = Actor or require "Scripts/actor"
Basura = Actor:extend()

function Basura:new(x,y) 
  Basura.super.new(self,"Textures/basura.png",400,700,-100,0,1) 
end 
 
function Basura:update(dt) 
  self.position.y=self.position.y-100*dt
  Box.super.update(self,dt) 
end 
 
function Basura:draw() 
  xx = self.position.x 
  ox = self.origin.x 
  yy = self.position.y 
  oy = self.origin.y 
  sx = 0.15
  sy = 0.15 
  rr = self.rot 
  love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0) 
end 
 
 
 
return Basura
