local Actor = Actor or require "Scripts/actor"
Player = Actor:extend()

function Player:new(x,y)
  Player.super.new(self,"Textures/moto.png",400,300,50,1,0)
end

function Player:uptade(dt)
  
end

function Player:draw()
  
end

function Player:keyPressed(key)
  if key == "up" then
    
  end
  
  if key == "down" then
    
    
  end
  
  if key == "left" then
      
  end
  
  if key == "right" then
      
  end
end