--
local Level = {
	--
	transform = newObjTransform (
									0, 0,
									0, 0,
									0,
									1, 1
								),
	-- Dimension d'une tuile
	w      = 32,   h      = 32,
	-- Nombre de colonnes et de lignes Ecran initial
	cols   = 25,   rows   = 18,
	-- Nombre de colonnes et de lignes Ecran resize
	nbRows =  0,   nbCols = 0,
	--
	dbg = {}
	--
}
--
function Level:load()		
	--
	self:init()
	--
	self:Scale()
	--	
end

function Level:init()
	--
	self.level = require("levels.level"..Game.level)
	--
	self.minutes    = self.level.minutes
    self.secondes   = self.level.secondes
	-- 
	self.stoptime   = true						-- Flag de démarrage ou d'arrêt du chrono 
	self.addScore   = false						-- Flag de lancement du décompte de 10 points par secondes du chrono
	-- Explode Atome 
	self.numAtome   = 1							-- Numéro du premier Atome pour explosion
	self.nbAtomes   = #self.level.explode		-- Nombre d'atomes du level
	--
	self.resolue_x  = false						-- flag de résolutions en x du puzzle
	self.resolue_y  = false						-- flag de résolutions en y du puzzle
	--
	self.exptimer   = 3							-- Timer entre chaque explosion
	--
end
--
function Level:next()		
	--		
	if self.secondes > 0 then return end	
	--
	Game.level = Game.level + 1
	--
	if Game.level == Game.levelmax then
		--		
		Game.sceneManager:switch("EndGame")
						
		return
		
	end	
	--
	self:init()
	--
	Game.assetManager:getObject("atome"):init()
	--
end
--
function Level:update(dt)
	-- Chronométre
	self:chronometre(dt)
	-- 
	self:resolve(dt)
	--
end
--
function Level:draw()
	--
	for y = 1, self.level.y do -- self.rows
		--
		for x = 1, self.level.x do --self.cols
			--
			if self.level.data[y][x] ~= 0 then		
				--
				LG.draw(	
							Game.assetManager:getImage("tuiles"),
							Game.assetManager:getImageQuad("tuiles", self.level.data[y][x], self.w), 
							(self.w ) * (self.level.ofx + x - 1) * self.transform.scale.x,
							(self.h ) * (self.level.ofy + y - 1) * self.transform.scale.y,
							0,
							self.transform.scale.x,	self.transform.scale.y
						)
			--
			end
		end
	end
	--
	local font = (( Game.win.fullscreen) and
					Game.assetManager:getFont("font70") or
					Game.assetManager:getFont("font42") )
	
	-- HighScore
	LG.printf(	tostring(Game.score.highscore),
				font,
				0  * self.transform.scale.x,
				30 * self.transform.scale.y, 590 * self.transform.scale.x, "right")
	
	-- Score
	LG.printf(	tostring(Game.score.points),
				font,
				0  * self.transform.scale.x, 
				30 * self.transform.scale.y, 270 * self.transform.scale.x, "right")
				
	-- Level
	LG.printf(	"LEVEL",
				font,
				0   * self.transform.scale.x,
				140 * self.transform.scale.y, 230 * self.transform.scale.x, "center")
	
	-- Num Level
	LG.printf(	tostring(Game.level),
				font,
				0   * self.transform.scale.x,
				180 * self.transform.scale.y, 230 * self.transform.scale.x, "center")

	-- Time
	LG.printf(	"TIME", 
				font, 
				0   * self.transform.scale.x, 
				220 * self.transform.scale.y, 230 * self.transform.scale.x, "center")	

	-- Chrono
	local s = math.abs(math.ceil(self.secondes))
	local secondes =  ( ( s >= 0 and s < 10) and tostring("0"..s) or tostring(s) )
	-- 			 
	LG.printf(	tostring(math.ceil(self.minutes)).." : "..secondes,
				font,
				0 * self.transform.scale.x,
				270 * self.transform.scale.y, 230 * self.transform.scale.x, "center")
	--
end
--
function Level:chronometre(dt)
	--
	if self.stoptime and self.addScore then
		--
		if self.secondes > 0 then
			--
			self.secondes = self.secondes - 1
			Game.score.points = Game.score.points + 10
			--
		elseif self.minutes > 0 then
			--
			self.secondes = 59
			self.minutes = self.minutes - 1
			--
		end
		--
	elseif self.stoptime == false then 
		--
		if self.secondes > 0 then
			--
			self.secondes = self.secondes - dt
			--
		elseif self.minutes > 0 then
			--
			self.secondes = 59
			self.minutes = self.minutes -1
			--
		else
			--
			Game.sceneManager:switch("GameOver")			
			--
		end
		--
	end
	--
end
--
function Level:getTile(x,y)
	--
	return self.level.data[ y - self.level.ofy + 1][ x - self.level.ofx + 1]
	--
end
--
function Level:Scale()
	--
	self.nbRows  = Game.win.h / self.h 	
	self.nbCols  = Game.win.w / self.w
	--
	self.transform.scale.x = ( (self.nbCols > self.cols) and
	                           (self.nbCols / self.cols ) or (self.cols / self.nbCols) )
	--
	self.transform.scale.y = ( (self.nbRows > self.rows) and
	                           (self.nbRows / self.rows ) or (self.rows / self.nbRows) )
	--
end
--
function Level:SetScale(x, y)
	--
	self.transform.scale.x = x
	--
	self.transform.scale.y = y
	--
end
--
local function resolve_x(at1,at2,val)
	--
	return (Game.assetManager:getObject("atome").atomes[at1].transform.translate.x + val ==
			Game.assetManager:getObject("atome").atomes[at2].transform.translate.x)
	--
end
--
local function resolve_y(at1,at2,val)
	--
	return (Game.assetManager:getObject("atome").atomes[at1].transform.translate.y + val ==
			Game.assetManager:getObject("atome").atomes[at2].transform.translate.y)
	--
end
--
function Level:resolves_x()
	--
	for i=1,#self.level.resolve.x do
		--
		self.resolue_x = true
		--
		for k,v in ipairs(self.level.resolve.x[i]) do
			--
			if not resolve_x(v[1], v[3], v[2]) then
				--
				self.resolue_x = false
				--
				break
				--
			end
			--
		end
		--
		if self.resolue_x == true then break end
		--
	end
	--
end
--
function Level:resolves_y()
	--
	for i=1,#self.level.resolve.y do	
		--
		self.resolue_y = true
		--
		for k,v in ipairs(self.level.resolve.y[i]) do
			--
			if not resolve_y(v[1], v[3], v[2]) then
				--
				self.resolue_y = false
				--
				break
				--
			end
			--
		end
		--
		if self.resolue_y == true then break end
		--
	end
	--
end
--
function Level:resolve(dt)
	--
	self:resolves_x()
	--
	self:resolves_y()
	--	
	if self.resolue_x and self.resolue_y  then
		--
		self.stoptime = true
		--
		self:ExplodeAtomes(dt)
		--
	end
	--
end
--
function Level:ExplodeAtomes(dt)
	--
	self.exptimer = self.exptimer - (1 * dt)
	-- Next Level
	if  (self.exptimer < 1 and self.addScore == true) then
		--
		self.exptimer = 3
		--
		self:next()
		--
		self.addScore = false
			
		-- Ajoute 10 points par seconde du chrono 	
	elseif self.exptimer < 1 and self.addScore == false then
		--
		self.addScore = true
		--
		self.exptimer = 3
		--
	end
	
	-- Explosion des atomes
	if self.numAtome <= self.nbAtomes  then
		-- 
		local at = self.level.explode[self.numAtome]		
		-- flag life = 0 atome plus visible
		if Game.assetManager:getObject("atome").atomes[at].life == 1 and self.exptimer < 1.7 then	
			--
			Game.assetManager:getObject("atome").atomes[at].life = 0
			--			
			Game.assetManager:getSound("exploded"):stop()
			Game.assetManager:getSound("exploded"):play()			
			--
			Game.score.points = Game.score.points + Game.assetManager:getObject("atome").atomes[at].points
			--
			self.numAtome = self.numAtome + 1
			--
			self.exptimer = 2
			--
		end	
		--	
	end
	--
end
--
function Level:debug()
	--
	if Game.debug then
		--
		LG.print("resolue_x:"..tostring(self.resolue_x),10,30)
		LG.print("resolue_y:"..tostring(self.resolue_y),10,40)		
		
	end
	--
end

return Level