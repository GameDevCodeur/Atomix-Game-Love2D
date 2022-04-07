
LA  = love.audio
LT  = love.timer
LK  = love.keyboard
LM  = love.math
LG  = love.graphics
LW  = love.window
LF  = love.filesystem
LC  = love.mouse

-- Lib Extension
require("lib.mathEx")	 -- Extension math lua

-- Load Game
require("mod.Game")		 -- Game

-- Load Modules 
require("mod.Utils")	 -- Outils
require("mod.Transform") -- Transform
require("mod.Collider")	 -- Collider
require("mod.HighScore") -- HighScore

-- Add Objects
   Game.assetManager:addObject("background", require("obj.Background")) -- Background
   Game.assetManager:addObject("mouse", 	 require("obj.Mouse")) 		-- Mouse
   Game.assetManager:addObject("level", 	 require("obj.Level")) 		-- Level
   Game.assetManager:addObject("atome", 	 require("obj.Atome")) 		-- Atome

-- Scenes du jeu
-- splashScreen = require("scn.SplashScreen")
-- intro 		= require("scn.Intro")
-- menu  		= require("scn.Menu")
   play  		= require("scn.Play")
-- highScore 	= require("scn.HighScore")

-- Add Cursors
   Game.assetManager:loadCursor("mousepointer", 	 "gfx/finger.png", 43, 51)	
   Game.assetManager:loadCursor("mousepointerclick", "gfx/fingerclick.png", 43, 51)
	
-- Load Fonts
-- Game.assetManager:loadFont("font24",  	 "font/font.ttf", 24)

-- Load Images
   Game.assetManager:loadImage("bgLevel1",   "gfx/bgLevel1.png")
   -- Tiles
   Game.assetManager:loadImage("tuile1",   	 "gfx/tile001.png")
   Game.assetManager:loadImage("tuile2",   	 "gfx/tile002.png")
   Game.assetManager:loadImage("tuile3",   	 "gfx/tile003.png")
   -- Atomes
   Game.assetManager:loadImage("oxygeneR",    "gfx/OR_64x64.png")
   Game.assetManager:loadImage("oxygeneL",    "gfx/OL_64x64.png")
   Game.assetManager:loadImage("hydrogeneH",  "gfx/HH_64x64.png")
   Game.assetManager:loadImage("atonselected","gfx/AS_64x64.png")

-- Load Sounds
-- Game.assetManager:loadSound("newLive", "sfx/newlive.ogg")

-- load Musics
-- Game.assetManager:loadMusic("music",   "sfx/music.mp3")

-- Load Videos
-- Game.assetManager:loadVideo("intro",   "video/intro.ogv")


