actorList = {}  --Lista de elementos de juego
math.randomseed(os.time())

function love.load()
  actorList = {} 
  backgroundImage = love.graphics.newImage("Textures/background.png")
  backgroundImage2 = love.graphics.newImage("Textures/background.png")
  backgroundImage1Y = 0
  backgroundImage2Y = 1024
  
end

function love.update(dt)
  for _,v in ipairs(actorList) do
    v:update(dt)
  end
  backgroundImage1Y = backgroundImage1Y - 3 * dt
  backgroundImage2Y = backgroundImage2Y - 3 * dt
end

function love.draw()
  love.graphics.draw(backgroundImage,0,backgroundImage1Y)
  love.graphics.draw(backgroundImage2,0, backgroundImage2Y)
end

function love.keypressed(key)
  
end
