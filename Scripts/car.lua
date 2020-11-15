local Actor = Actor or require "Scripts/actor"
local Data = Data or require "data"
Car = Actor:extend()

function Car:new() 
  imageRnd = math.random(2)
  posXRnd = math.random(MIN_X, MAX_X)
  if imageRnd==1 then
    Car.super.new(self,"Textures/carTop.png",posXRnd,MAX_Y,-100,0,1) 
  else
    Car.super.new(self,"Textures/carSide.png",posXRnd,MAX_Y,-100,0,1) 
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
  sx = 1
  sy = 1
  rr = self.rot 
  love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0) 
end 
 
 
 
return Car
