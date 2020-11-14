local Actor = Actor or require "Scripts/actor"
local Player = Actor:extend()
local positionX=360
local positionY=200
local motoScale=0.3
local motoAnguloCorrecto=45.55
function Player:new(x,y)
  Player.super.new(self,"Textures/moto.png",positionX,positionY,50,1,0)
end

function Player:update(dt)
  Player.super.update(self,dt)  
  if love.keyboard.isDown("down")then  
    
      positionY=positionY+1
  end
  if love.keyboard.isDown("up")then  
    
      positionY=positionY-1
  end
  if love.keyboard.isDown("left")then  
    
      positionX=positionX-1
  end
  if love.keyboard.isDown("right")then  
    
      positionX=positionX+1
  end
   
end

function Player:draw() 
  xx = self.position.x
  ox = self.origin.x
  yy = self.position.y
  oy = self.origin.y
  sx = self.scale.x
  sy = self.scale.y
  rr = self.rot  
  love.graphics.draw(self.image,positionX,positionY,rr-motoAnguloCorrecto,sx*motoScale,sy*motoScale,ox,oy) 
end

return Player