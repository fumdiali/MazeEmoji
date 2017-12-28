local composer = require( "composer" )

local scene = composer.newScene()

local function levelOne()
   composer.gotoScene( "level1", { time=800, effect="crossFade" } )
   
end

local function aboutGame()
   composer.gotoScene( "about", { time=800, effect="crossFade" } )
end

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

   local sceneGroup = self.view
   -- Code here runs when the scene is first created but has not yet appeared on screen
   local background = display.newImageRect( sceneGroup, "image/black3.jpeg", 760, 800 )
   background.x = display.contentCenterX
   background.y = display.contentCenterY

   local gameImage = display.newImageRect( sceneGroup,"image/smile1.png",170,170)
   gameImage.x = display.contentCenterX
   gameImage.y = 150
   gameImage.rotation = 50

   local gameTitle = display.newText( sceneGroup,"Maze Emoji", 100, 200, native.systemFont, 46 )
   gameTitle:setFillColor( 1, 0, 0 )
   gameTitle.x = display.contentCenterX
   gameTitle.y = 50

   local image1 = display.newImageRect( sceneGroup,"image/gold_star.png",100,100)
   image1.x = display.contentCenterX + 25
   image1.y = 230

   local image2 = display.newImageRect( sceneGroup,"image/star_red.png",100,100)
   image2.x = display.contentCenterX - 35
   image2.y = 300


   local playButton = display.newText( sceneGroup, "Play", display.contentCenterX, 370, native.systemFont, 24 )
   playButton:setFillColor( 0.77,1.5,0.3 )

   local aboutButton = display.newText( sceneGroup, "About", display.contentCenterX, 410, native.systemFont, 24 )
   aboutButton:setFillColor( 0.77,1.5,0.3 )


   playButton:addEventListener( "tap", levelOne )
   aboutButton:addEventListener( "tap", aboutGame )

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