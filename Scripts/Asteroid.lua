local Actor = Actor or require "Scripts/actor"
local Asteroid = Actor:extend()

math.randomseed(os.time())


function Asteroid:new(x,y)
  imageRnd = math.random(4)
  if imageRnd == 1 then
    image = "Textures/Meteors/meteorBrown_big1.png"
  elseif imageRnd == 2 then
    image = "Textures/Meteors/meteorBrown_big2.png"
  elseif imageRnd == 3 then
    image = "Textures/Meteors/meteorBrown_big3.png"
  elseif imageRnd == 4 then
    image = "Textures/Meteors/meteorBrown_big4.png"
  end
  Asteroid.super.new(self,image,math.random(800),math.random(600),math.random(30,100),math.random(-1,0) + math.random(),math.random(-1,0) + math.random())
  self.rSpeed = math.random(-5, 5)
end

function Asteroid:update(dt)
    Asteroid.super.update(self,dt)
    self.rot = self.rot + 1 * dt * self.rSpeed
    if self.position.x < 0 or self.position.x > 800 or self.position.y < 0 or self.position.y > 600 then
      self.position.x = math.random(800)
      self.position.y = math.random(600)
    end
end

function Asteroid:draw()
  xx = self.position.x
  ox = self.origin.x
  yy = self.position.y
  oy = self.origin.y
  sx = self.scale.x
  sy = self.scale.y
  rr = self.rot
  love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)
end

return Asteroid
