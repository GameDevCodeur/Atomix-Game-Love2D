--
Game = {

	-- Managers
	assetManager = require("lib.assetManager"),	
	sceneManager = require("lib.sceneManager"),
	--
	level        = 1,
	levelmax	 = 7,
	
	-- Paramétres de la fénêtre
	win          = {						
						w          = 800, 
						h          = 640,
						minwidth   = 800,
						minheight  = 640, 
						resizable  = false,
						vsync      = false,
						fullscreen = false
				   },
	
	--
	score        = { 	
						points 	   = 0,
						highscore  = 0,
				   },
	--
	debug        = true
	--
}
--
function Game:load()		
	--
	LG.setDefaultFilter("linear", "linear", 8)
	--
	LW.setMode(self.win.w, self.win.h, {
										 resizable  = self.win.resizable, 
										 vsync      = self.win.vsync, 
										 minwidth   = self.win.minwidth, 
										 minheight  = self.win.minheight,
										 fullscreen = self.win.fullscreen
										})
	--
	Mouse:load()
	--
	self.sceneManager:load("scn", {"Intro", "Menu", "PlayGame", "GameOver", "HighScore", "EndGame"} )
	--
	self.sceneManager:switch("PlayGame")
	--
end
--
function Game:update(dt)
	--
	if dt > 0.1 then dt = 0.1 end
	--
	self.sceneManager:update(dt)
	--
	Mouse:update(dt)
	--
end
--
function Game:draw()
	--
	self.sceneManager:draw()		
	--
	Mouse:draw()
	--
end
--
function Game:resize(w, h)
	--
	Game.win.w, Game.win.h = w, h
	-- 
	self.sceneManager:resize(w, h)
	--
end
--
function Game:keypressed(key, scancode, isrepeat)
	--
	self.sceneManager:keypressed(key, scancode, isrepeat)
	--
end
--
function Game:reset()
	--
	self.level  	   = 1
	self.score.points  = 0
	--
end
--
function Game:winReset()
	--
	self.win.fullscreen = false
	LW.setFullscreen( false )	
	--
	self:resize(self.win.minwidth, self.win.minheight)
	--
end
