-- Modules
   LA  = love.audio
   LT  = love.timer
   LK  = love.keyboard
   LM  = love.math
   LG  = love.graphics
   LW  = love.window
   LF  = love.filesystem
   LC  = love.mouse

-- Load Game
   require("mod.Game")		-- Game

-- Load Modules 
   require("mod.Transform") -- Transform 
   require("mod.Mouse") 	-- Mouse

-- Add Objects
   Game.assetManager:addObject("background", require("obj.Background")) -- Background
   Game.assetManager:addObject("level", 	 require("obj.Level")) 		-- Level
   Game.assetManager:addObject("atome", 	 require("obj.Atome")) 		-- Atome

-- Add Cursors
   Game.assetManager:loadCursor("mousepointer",	"gfx/finger.png", 43, 51)
   Game.assetManager:loadCursor("mouseclick", 	"gfx/fingerclick.png", 43, 51)
	
-- Load Fonts
   Game.assetManager:loadFont("font36",  	  	"font/font.ttf", 36)
   Game.assetManager:loadFont("font42",  	  	"font/font.ttf", 42)
   Game.assetManager:loadFont("font70",  	  	"font/font.ttf", 70)

-- Load Images
   Game.assetManager:loadImage("bghighscore",   "gfx/32/bghighscore.png")
-- Load Stages
   Game.assetManager:loadImage("bgStage1",    	"gfx/32/stg1.jpg")
   Game.assetManager:loadImage("bgStage2",    	"gfx/32/stg2.jpg")
   Game.assetManager:loadImage("bgStage3",    	"gfx/32/stg3.jpg")
   Game.assetManager:loadImage("stages",    	"gfx/32/stages.jpg")

   --   
   Game.assetManager:loadImage("endgame",	  	"gfx/32/endgame.png")
   Game.assetManager:loadImage("gameover",	  	"gfx/32/gameover.jpg")   
   --
   Game.assetManager:loadImage("selected",		"gfx/32/AS.png")   
-- Explosions
   Game.assetManager:loadImage("oexplode",	  	"gfx/32/oexplode.png")     
-- Tiles
   Game.assetManager:loadImage("tuiles",    	"gfx/32/tuiles.jpg")
   Game.assetManager:loadImage("atomes",    	"gfx/32/atomes.png") 
-- Load Sounds
   Game.assetManager:loadSound("click", 	  	"sfx/click.mp3")
   Game.assetManager:loadSound("moved", 	  	"sfx/moved.mp3")
   Game.assetManager:loadSound("exploded", 	  	"sfx/exploded.mp3")

-- load Musics
-- Game.assetManager:loadMusic("music",   		"sfx/music.mp3")

-- Load Videos
   Game.assetManager:loadVideo("intro",   		"video/intro.ogv")
   Game.assetManager:loadVideo("menu",   		"video/menu.ogv")


