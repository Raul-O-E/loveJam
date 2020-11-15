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
      self.position.y = self.position.y + playerSpeed * dt
  end
  if love.keyboard.isDown("up")then  
      self.position.y = self.position.y - playerSpeed * dt
  end
  if love.keyboard.isDown("left")then  
    if self.position.x > MIN_X then  
      self.position.x = self.position.x - playerSpeed * dt
    end
  end
  if love.keyboard.isDown("right")then  
    if self.position.x < MAX_X - self.width then  
      self.position.x = self.position.x + playerSpeed * dt
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
  love.graphics.draw(self.image,xx,yy,rr-motoAnguloCorrecto,sx*motoScale,sy*motoScale,ox,oy) 
end

function Player:hit() 
  gameover = 2
end

return Player