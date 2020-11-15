local Actor = Actor or require "Scripts/actor"
local Data = Data or require "data"
local startMenu = Actor:extend()


function startMenu:new()
  startFont = love.graphics.newFont("aAtmospheric.ttf", 36)
end

function startMenu:update(dt)


end
function startMenu:draw()
love.graphics.setColor(0, 0, 0)
  love.graphics.setFont(startFont)
  love.graphics.print("TSUNAMI RIDER",SCREEN_WIDTH/4-10,SCREEN_HEIGHT/3)
  love.graphics.setColor(1, 0, 0)
  if math.floor(love.timer.getTime()) % 2 == 0 then
    love.graphics.print("Press SPACE to play", SCREEN_WIDTH/7+10, SCREEN_HEIGHT/2)
    love.graphics.print("ESC to quit", SCREEN_WIDTH/4-20, SCREEN_HEIGHT/1.5)
  end
  love.graphics.reset()
end
function startMenu:keyPressed(key)
  print"lul"
  if key=="space" then
    for _,menu in ipairs(actorList) do
      if menu:is(startMenu) then
        table.remove(actorList,_)
        ACTUAL_MENU="none"
      end
      if key=="escape" then
        love.event.quit()
      end
    end
  end

end
return startMenu