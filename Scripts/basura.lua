local Actor = Actor or require "Scripts/actor"
local Data = Data or require "data"
Basura = Actor:extend()

function Basura:new() 
  posXRnd = math.random(MIN_X, MAX_X)
  Basura.super.new(self,"Textures/basura.png",posXRnd,MAX_Y,-100,0,1) 
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
  sx = 1
  sy = 1
  rr = self.rot 
  love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0) 
end 
 
 
 
return Basura
