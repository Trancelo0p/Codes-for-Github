-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar( display.HiddenStatusBar )

local physics = require( "physics")


local circle = {}
local background
local floor
local leftWall
local rightWall
local platform1
local platform2
local tmr
local rand
local snapshot
local snapshotGroup
local overlayGroup

background = display.newImageRect("bg.png", 320, 480)
background.anchorX = 0
background.anchorY = 0
background.x = 0
background.y = 0


snapshot = display.newSnapshot(640, 980)
snapshot.anchorX = 0.5
snapshot.anchorY = 0.5
snapshot.x, snapshot.y = 0, 0

snapshotGroup = snapshot.group


overlayGroup = display.newGroup()
overlayGroup.anchorX = 0
overlayGroup.anchorY = 0
overlayGroup.x, snapshot.y = 0, 0
overlayGroup:insert( snapshot )



snapshot.fill.effect = "filter.levels"



snapshot.fill.effect.white = 0.7
--snapshot.fill.effect.black = 0.1
--snapshot.fill.effect.gamma = 0



physics.start() 
--physics.setDrawMode("hybrid")



function spawnFn()

  for i= 1, 10 do
  
rand = math.random(12,32)

circle[#circle+1] = display.newImageRect("drop.png", rand, rand )
circle[#circle].anchorX = 0.5
circle[#circle].anchorY = 0.5
circle[#circle].x = 40
circle[#circle].y = 0

snapshotGroup:insert( circle[#circle])


physics.addBody(circle[#circle], {density=0, friction = 0, bounce = 0.3, radius = rand/math.random(6,8)})

  end
  
end



floor = display.newRect(0,0, 320, 60)
floor.anchorX = 0
floor.anchorY = 0
floor.x = 0
floor.y = 480
physics.addBody(floor, "static", {density = 1, friction=0.1, bounce = 0})


leftWall = display.newRect(0,0, 60, 480)
leftWall.anchorX = 0
leftWall.anchorY = 0
leftWall.x = -60
leftWall.y = 0
physics.addBody(leftWall, "static", {density = 1, friction=0.1, bounce = 0.3})


rightWall = display.newRect(0,0, 60, 480)
rightWall.anchorX = 0
rightWall.anchorY = 0
rightWall.x = 320
rightWall.y = 0
physics.addBody(rightWall, "static", {density = 1, friction=0.1, bounce = 0.3})


platform1 = display.newRect(0,0, 200, 20)
platform1.anchorX = 0
platform1.anchorY = 0
platform1.x = 0
platform1.y = 20
platform1.rotation = 45
physics.addBody(platform1, "static", {density = 1, friction=0.1, bounce = 0.3})


platform2 = display.newRect(0,0, 200, 20)
platform2.anchorX = 0
platform2.anchorY = 0
platform2.x = 380
platform2.y = 180
platform2.rotation = 145
physics.addBody(platform2, "static", {density = 1, friction=0.1, bounce = 0.3})



tmr = timer.performWithDelay(100,spawnFn,80)

Runtime:addEventListener("enterFrame", function() snapshot:invalidate() end)










