local Actor = Actor or require "Scripts/actor"
local Data = Data or require "data"
local Player = Actor:extend()

local positionX=360
local positionY=200
local motoScale=1
local playerSpeed=170
local motoAnguloCorrecto=0
function Player:new(x,y)
  Player.super.new(self,"Textures/moto.png",positionX,positionY,50,0,0)
end

function Player:update(dt)
  Player.super.update(self,dt)  
  if love.keyboard.isDown("down")then  
    
      positionY=positionY + playerSpeed * dt
  end
  if love.keyboard.isDown("up")then  
    
      positionY=positionY - playerSpeed * dt
  end
  if love.keyboard.isDown("left")then  
    if positionX > 200 then  
      positionX=positionX - playerSpeed * dt
    end
  end
  if love.keyboard.isDown("right")then  
    if positionX < 520 then  
      positionX=positionX + playerSpeed * dt
    end
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