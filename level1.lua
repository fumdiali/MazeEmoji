local composer = require( "composer" )
 
local scene = composer.newScene()
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
 
 
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
 
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
    --space black background image
    bg = display.newImageRect("image/spaceblack.png", 420, 640)
    bg.x = display.contentCenterX
    bg.y = display.contentCenterY

    --score display
    scoreDisplay = display.newText( "score:25", 250, 10, native.systemFont, 26 )
    scoreDisplay:setFillColor(1,1,1)

    --game controls
    up = display.newRect(160,420, 50, 20)
    up:setFillColor(0,1,0)
    up:setStrokeColor( red, green, blue, alpha )
    up.strokeWidth = 5
    right = display.newRect(230,440, 50, 20)
    right:setFillColor(0,1,0)
    right:setStrokeColor( red, green, blue, alpha )
    right.strokeWidth = 5
    down = display.newRect(160,460, 50, 20)
    down:setFillColor(0,1,0)
    down:setStrokeColor( red, green, blue, alpha )
    down.strokeWidth = 5
    left = display.newRect(90,440, 50, 20)
    left:setFillColor(0,1,0)
    left:setStrokeColor( red, green, blue, alpha )
    left.strokeWidth = 5

    --game board
    midRect = display.newRect(160,140, 5,100)
    midRect:setFillColor(0,0,1)

    leftAngle = display.newRect(40,135, 5,210)
    leftAngle:setFillColor(0,0,1)

    leftAngleTop = display.newRect(40,30, 170,5)
    leftAngleTop:setFillColor(0,0,1)

    leftBottomAngle = display.newRect(40,330, 310,5)
    leftBottomAngle:setFillColor(0,0,1)

    rightAngle = display.newRect(280,135, 5,210)
    rightAngle:setFillColor(0,0,1)

    rightAngleTop = display.newRect(270,30, 140,5)
    rightAngleTop:setFillColor(0,0,1)

    rightBottomAngle = display.newRect(300,360, 120,5)
    rightBottomAngle:setFillColor(0,0,1)

    rightBottomVertAngle = display.newRect(240,315, 5,90)
    rightBottomVertAngle:setFillColor(0,0,1)

    --prize tokens
    crown = display.newImageRect("image/crown.png",40,40)
    crown.x = 300
    crown.y = 330

    goldStar = display.newImageRect("image/gold_star.png",45,45)
    goldStar.x = 40
    goldStar.y = 307

    --player
    player = display.newImageRect("image/smile1.png", 25,25)
    player.x = 160
    player.y = 240

    --enemies
    redStar1 = display.newImageRect("image/star_red.png",45,45)
    redStar1.x = 160
    redStar1.y = 10

    redStar2 = display.newImageRect("image/star_red.png",45,45)
    redStar2.x = 210
    redStar2.y = 290

    redStar3 = display.newImageRect("image/star_red.png",45,45)
    redStar3.x = 80
    redStar3.y = 80

    bomb = display.newImageRect("image/bomb.png",45,45)
    bomb.x = 60
    bomb.y = 6
 
end--end of create scene
 -----------------------------
  function moveUp()
    transition.moveBy( player, { y=-15, time=100 } )
  end

  function moveRight()
    transition.moveBy( player, { x=15, time=100 } )
  end

  function moveDown()
    transition.moveBy( player, { y=15, time=100 } )
  end

  function moveLeft()
    transition.moveBy( player, { x=-15, time=100 } )
  end

 -------------------------------
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen

         --import physics engine and activate it
         physics = require( "physics" )
         physics.start()

         
         

         up:addEventListener("tap", moveUp)
         right:addEventListener("tap", moveRight)
         down:addEventListener("tap", moveDown)
         left:addEventListener("tap", moveLeft)
 
    end
end--end of show scene
 
 
-- hide()
function scene:hide( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
 
    end
end
 
 
-- destroy()
function scene:destroy( event )
 
    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view
 
end
 
 
-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------
 
return scene