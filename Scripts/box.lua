
local Actor = Actor or require "Scripts/actor"
Box = Actor:extend()


function Box:new(x,y) 
  Box.super.new(self,"Textures/box.png",400,700,-100,0,1) 
end 
 
function Box:update(dt) 
  self.position.y=self.position.y-100*dt
  Box.super.update(self,dt) 
end 

function Box:draw() 
  xx = self.position.x 
  ox = self.origin.x 
  yy = self.position.y 
  oy = self.origin.y 
  sx = 1
  sy = 1 
  rr = self.rot 
  love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0) 
end 
return Box

