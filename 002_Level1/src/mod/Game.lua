
Game = {
	-- Managers
	assetManager = require("lib/assetManager"),	
	stateManager = require("lib/stateManager"),
	--
	level        = 1,
	lives        = 3,
	-- Paramétres de la fénêtre
	win          = {						
						w          = 1280, 
						h          = 832,
						minwidth   = 1280,
						minheight  = 832, 
						resizable  = false,
						vsync      = false,
						fullscreen = false
				   },
	
	--
	score        = { 	
						points = 0, 
						timepoints = 10000, 
						counter = 0 
				   },
	--
	debug        = true
		
}
--
function Game:load()
	--
	-- math.randomseed(os.time())
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
	self.stateManager:changeState("Play")
	
end

function Game:loadScene()
	--
	if     self.stateManager.Intro 	   then intro:load() 	
	elseif self.stateManager.Menu  	   then menu:load()  
	elseif self.stateManager.Play  	   then play:load()  
	elseif self.stateManager.HighScore then highScore:load() end
	
end

function Game:update(dt)
	--
	if dt > 0.1 then dt = 0.1 end	
	--
	if 		self.stateManager.Intro 	then intro:update		(dt)
	elseif 	self.stateManager.Menu	    then menu:update		(dt)		
	elseif 	self.stateManager.Play	    then play:update		(dt)			
	elseif 	self.stateManager.HighScore then highScore:update(dt) end
		
end

function Game:draw()
	--
	if     self.stateManager.Intro 	   then intro:draw() 	
	elseif self.stateManager.Menu  	   then menu:draw()  
	elseif self.stateManager.Play  	   then play:draw()  
	elseif self.stateManager.HighScore then highScore:draw() end
	
end
--
function Game:resize(w, h)
	--
	Game.win.w, Game.win.h = w, h
	--
	for i, v in ipairs(Game.assetManager:getObjects()) do v:Scale() end
	
end
--
function Game:keypressed(key, scancode, isrepeat)
	--
	if     self.stateManager.Intro     then intro:keypressed	 (key, scancode, isrepeat) 
	elseif self.stateManager.Menu      then menu:keypressed 	 (key, scancode, isrepeat) 
	elseif self.stateManager.Play      then play:keypressed 	 (key, scancode, isrepeat)	
	elseif self.stateManager.HighScore then highScore:keypressed (key, scancode, isrepeat) end
	
end
--
function Game:reset()
	--
	self.level  = 1
	self.lives  = 3	
	self.score.points  = 0
	self.score.counter = 0
		
end
--
function Game:winReset()
	--
	self.win.fullscreen = false
	LW.setFullscreen( false )	
	--
	self:resize(self.win.minwidth, self.win.minheight)
	
end
--
function Game:addScore(points)
	--
	-- self.score.points  = self.score.points + points
	
	-- Incrémente une vie chaque 10000 points
	-- self:addLive(points)
	
end
--
function Game:decLive()
	-- Décrémente une vie	
	-- self.lives = self.lives - 1	
	-- 
	-- if tonumber(self.lives) <= 0 then			
		--GameOver
		-- self.stateManager:changeState("Menu")
	
		--addHighScore		
		-- table.foreach(HighScore.scores, 
			-- function (k,v)
				
				-- if tonumber(self.score.points) > tonumber(v.sc) then
					
					-- self.stateManager:changeState("HighScore")
			
				-- end
				
			-- end
		-- )
		
	-- end
	
end
--
function Game:addLive(pts)
	--
	-- self.score.counter = self.score.counter + pts
	
			
	-- if tonumber(self.score.counter) >=  tonumber(self.score.timepoints) then
		
		-- self.assetManager:getSound("newLive"):play()
		
		-- self.lives = self.lives + 1
		-- self.score.counter = 0
		
	-- end
			
end
--
function Game:drawScore()
	--
	-- LG.printf((	tonumber(self.score.points) == 0 and "00" or 
				-- tostring(self.score.points)),
				-- self.assetManager:getFont("font30"),
				-- 0, 8, 210, "center")
	
	-- LG.printf((	tonumber(HighScore.highScore) == 0 and "00" or 
				-- tostring(HighScore.highScore)),
				-- self.assetManager:getFont("font24"),
				-- self.win.w / 2, 10, 400, "left")
	
end
--
function Game:drawLives()
	--
	-- for i = 1,( (tonumber(self.lives) < 6) and 
				 -- tonumber(self.lives) or 5 ) do
		
		-- LG.draw( self.assetManager:getImage("plane"), 
				 -- (i - 1) * 32 + 5,
				 -- 40, 0, 
				 -- 0.5, 0.5 					
				-- )
			
	-- end
	
	-- if tonumber(self.lives) > 5 then
		
		-- LG.printf(  "(+"..tostring(self.lives - 5)..")", 
					-- self.assetManager:getFont("font24"), 
					-- 5 * 32 + 5, 
					-- 40, 100, "center"
				 -- )
					
	-- end	

end
--
function Game:nextLevel()
	-- newLevel
	-- if #self.assetManager:getObject("asteroid").astres == 0 then
		
		-- self.level = self.level + 1 								-- Incrémente level		
		-- self.assetManager:getObject("bullet").weapon.bullets = {}	-- Reset Bullets		
		-- self.assetManager:getObject("asteroid"):newAsteroidLevel()	-- Création Astéroides
		
	-- end
	
end
