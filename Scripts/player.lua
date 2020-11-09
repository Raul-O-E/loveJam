local Actor = Actor or require "Scripts/actor"
Player = Actor:extend()

function Player:new(x,y)
  Player.super.new(self,"Textures/moto.png",400,300,50,1,0)
end

function Player:uptade(dt)
  Player.super.update(self,dt)  
end

function Player:draw()
  xx = self.position.x
  ox = self.origin.x
  yy = self.position.y
  oy = self.origin.y
  sx = self.sx
  sx = direction
  rr = self.rot
end

function Player:keyPressed(key)
  if key == "up" then
    
  elseif key == "down" then
    
  elseif key == "left" then
      
  elseif key == "right" then
      
  end
end

return Player