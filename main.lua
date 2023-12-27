
function lerp(a,b,t)
  return a * (1-t) + b * t
end

local function inverseLerp(a, b, x)
  return (x-a)/(b-a)
end

function love.load()
  printx = 0
  printy = 0
  printdx = 0
  printdy = 0

  mouseval = 0
  bellimg = love.graphics.newImage("christmas-bell.png")
  bellwidth  = bellimg:getWidth()
  bellheight = bellimg:getHeight()
end

function love.update()
  mouseval = string.format("%.2f", inverseLerp(0, 800, printx))
  rotate = lerp(-0.5, 0.5, mouseval)
end

function love.draw()
  -- love.graphics.print('Hello World!', 400, 300)
  love.graphics.rectangle( 'fill', 0, 0, printx, 15 )
  love.graphics.print('mouseval: '.. mouseval .. ' rot: ' .. rotate , 0, 25)

  love.graphics.draw(bellimg, 100, 100, rotate, 0.10)
end


function love.mousemoved( x, y, dx, dy, istouch )
  printx = x
  printy = y
  printdx = dx
  printdy = dy
end
