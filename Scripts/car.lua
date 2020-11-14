local Actor = Actor or require "Scripts/actor"
Car = Actor:extend()

function Car:new(x,y) 
  imageRnd = math.random(2)
  if imageRnd==1 then
  Car.super.new(self,"Textures/carTop.png",400,700,-100,0,1) 
else
  Car.super.new(self,"Textures/carSide.png",400,700,-100,0,1) 
end

end 
 
function Car:update(dt) 
  self.position.y=self.position.y-100*dt
  Car.super.update(self,dt) 
end 
 
function Car:draw() 
  xx = self.position.x 
  ox = self.origin.x 
  yy = self.position.y 
  oy = self.origin.y 
  sx = 2.5
  sy = 2.5
  rr = self.rot 
  love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0) 
end 
 
 
 
return Car
