actorList = {}  --Lista de elementos de juego
math.randomseed(os.time())

function love.load()
  actorList = {} 
  backgroundImage = love.graphics.newImage("Textures/background.png")
  backgroundImage2 = love.graphics.newImage("Textures/background.png")
  backgroundImage1Y = 0
  backgroundImage2Y = 1275
  
end

function love.update(dt)
  for _,v in ipairs(actorList) do
    v:update(dt)
  end
  backgroundImage1Y = backgroundImage1Y - 100 * dt
  backgroundImage2Y = backgroundImage2Y - 100 * dt
  if backgroundImage1Y <= 0 and backgroundImage1Y > backgroundImage2Y then
    backgroundImage2Y = 1275
  end
  if backgroundImage2Y <= 0 and backgroundImage2Y > backgroundImage1Y then
    backgroundImage1Y = 1275
  end
end

function love.draw()
  love.graphics.draw(backgroundImage,0,backgroundImage1Y)
  love.graphics.draw(backgroundImage2,0, backgroundImage2Y)
end

function love.keypressed(key)
  
end
