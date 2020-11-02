local Actor = Actor or require "Scripts/actor"
Ship = Actor:extend()
rotationangle = 0

function Ship:new(x,y)
  Ship.super.new(self,"Textures/playerShip1_blue.png",400,300,50,1,0)
end

function Ship:update(dt)
  Ship.super.update(self,dt)
  self.rot = self.rot + math.rad(rotationangle)
    self.forward:rotate(math.rad(rotationangle))
end

function Ship:draw()
  xx = self.position.x
  ox = self.origin.x
  yy = self.position.y
  oy = self.origin.y
  sx = self.scale.x
  sy = self.scale.y
  rr = self.rot
  love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)
end

function Ship:keyPressed(key)
  if key == "right" then
    rotationangle = rotationangle + 0.2
  elseif key == "left" then
    rotationangle = rotationangle - 0.2
  elseif key == "up" then
    self.speed = self.speed + 10
  elseif key == "down" then
    self.speed = self.speed - 10
  end
end

return Ship