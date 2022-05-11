--
-- Fonctions locales (privées)
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
local function genereResolvegx(self, l, c)
--	
	local temp = {}
--
	for i = 1, #self.level.resolveg.x[l][c] - 1 do		
	--
		table.insert( temp, {self.level.resolveg.x[l][c][i], 1, self.level.resolveg.x[l][c][i+1]} )
	--
	end	
--
	return temp
--
end
--
local function genereResolvegx_Col(self, c)
--	
	--[[La fonction genereResolvegx_Col(c)
	Génére solutions colonne c du tableau resolveg.x]]-- 
-- 
	
	-- Vider table
	self.level.resolve.x = {}	
	-- Génére solutions colonne c
	for l = 1, #self.level.resolveg.x do
	--
		self.level.resolve.x[#self.level.resolve.x+1] = genereResolvegx(self, l, c)
	--
	end	
	--	
end
--
local function genereResolvegy(self, l, c)
--	
	local temp = {}
--
	for i = 1, #self.level.resolveg.y[l][c] - 1 do		
	--
		table.insert( temp, {self.level.resolveg.y[l][c][i], 1, self.level.resolveg.y[l][c][i+1]} )
	--
	end	
--
	return temp
--
end
--
local function genereResolvegy_Col(self, c)
--
	--[[La fonction genereResolvegy_Col(c)
		Génére solutions colonne c du tableau resolveg.y]]-- 
	
-- Vider table
	self.level.resolve.y = {}
-- Génére solutions colonne c
	for l = 1, #self.level.resolveg.y do
	--
		self.level.resolve.y[#self.level.resolve.y+1] = genereResolvegy(self, l, c)
	--
	end	
--
end
--
local function resolves_x(self)
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
local function resolves_y(self)
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
local function resolvesg_x(self)

	--[[La fonction resolvesg_x()
		Test les solutions de chaque colonne du tableau resolveg.x
		Le test se fait colonne par colonne.]]-- 
	
--
	for c = 1, #self.level.resolveg.x[1] do
	--
		genereResolvegx_Col(self, c)				-- Génére les solutions colonne c	
		resolves_x(self)							-- Controle les solutions colonne c	
		if self.resolue_x == false then break end	-- Stop le controle des autres colonnes
	--
	end
--
end
--
local function resolvesg_y(self)
--
	--[[La fonction resolvesg_y()
		Test les solutions de chaque colonne du tableau resolveg.y
		Le test se fait colonne par colonne.]]-- 
--
	--
	if self.level.resolveg.y ~= nil then 
	--
		for c = 1, #self.level.resolveg.y[1] do
		--
			genereResolvegy_Col(self, c)				-- Génére les solutions colonne c	
			resolves_y(self)							-- Controle les solutions colonne c	
			if self.resolue_y == false then break end	-- Stop le controle des autres colonnes
		--
		end
	--
	else
	--
		self.resolue_y = true
	--
	end
--
end
--
local function hideAtomes(self)
--
	if self.numAtome <= self.nbAtomes  then
		--
		local at = self.level.explode[self.numAtome]
		--
		if Game.assetManager:getObject("atome").atomes[at].life == 1 and self.exptimer < 1.7 then
			-- 
			Game.assetManager:getObject("atome").atomes[at].life = 0 -- 0 Hide
			--
			Game.assetManager:getSound("exploded"):stop()
			--
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
local function init(self)
--
	self.level = require("levels.level"..Game.level)
--
	self.minutes    = self.level.minutes
    self.secondes   = self.level.secondes
-- 
	self.stoptime   = true					-- Flag de démarrage / d'arrêt du chrono 
	self.addScore   = false					-- Flag de lancement décompte de 10 points par secondes du chrono
--
	self.numAtome   = 1						-- Numéro premier Atome pour explosion
	self.nbAtomes   = #self.level.explode	-- Nombre atomes du level
--
	self.resolue_x  = false					-- Flag résolution en x du puzzle
	self.resolue_y  = false					-- Flag résolution en y du puzzle
--
	self.exptimer   = 3						-- Timer entre chaque explosion
--
	if Game.level > 1 then	
	Game.stage = ((Game.level - 1) % 6 == 0) and Game.stage + 1 or Game.stage end
--
end
--
local function next(self)
--		
	if self.secondes > 0 then return end	
--
	Game.level = Game.level + 1	
--
	if Game.level == Game.levelmax then
		--		
		Game.sceneManager:switch("EndGame")
		--			
		return
		--
	end	
--
	init(self)
--
	Game.assetManager:getObject("atome"):init()
--	
end
--
local function nextLevel(self)
-- 
	if  (self.exptimer < 1 and self.addScore == true) then
	--
		self.exptimer = 3
	--
		next(self)
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
--
end
--
local function explodeAtomes(self, dt)
--
	self.exptimer = self.exptimer - (1 * dt)
--
	nextLevel(self)
-- 
	hideAtomes(self)
--
end
--
local function resolve(self, dt)
--
	if self.level.resolveg == nil then
		--
		resolves_x(self)
		resolves_y(self)
		--		
	else
		--
		resolvesg_x(self)
		resolvesg_y(self)
		--
	end
--	
	if self.resolue_x and self.resolue_y  then
		--
		self.stoptime = true
		--
		explodeAtomes(self, dt)
		--
	end
--
end
--
local function chronometre(self, dt)
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
			if tonumber(Game.score.points) > tonumber(Game.score.highscore) then 
				--
				Game.sceneManager:switch("HighScore")
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
end
--
local function drawTiles(self)
--
	--[[ Fonction drawTiles()		 
		 Affiche les tuiles du level]]--
--
	for y = 1, self.level.y do -- rows
	--
		for x = 1, self.level.x do -- cols
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
		--
		end
	--
	end		
--
end
--
local function drawImageResolve(self)
	--
	LG.draw(	
				Game.assetManager:getImage("stages"),
				Game.assetManager:getImageStageQuad("stages",
													Game.level - ((Game.stage - 1) * 6), 
													Game.stage, 199, 247), 																			 
				  6 * self.transform.scale.x, 
				320 * self.transform.scale.y, 0,
				self.transform.scale.x,	
				self.transform.scale.y	)
	--
end
--
local function drawHighScore(self, font)
	--
	LG.printf(	tostring(Game.score.highscore),
				font, 0 * self.transform.scale.x,
				30 * self.transform.scale.y, 590 * self.transform.scale.x, "right")
	--
end
--
local function drawScore(self, font)
--
	LG.printf(	tostring(Game.score.points),
				font, 0 * self.transform.scale.x, 
				30 * self.transform.scale.y, 270 * self.transform.scale.x, "right")
--
end
--
local function drawLevel(self, font)
--
	LG.printf(	"LEVEL",
				font, 0 * self.transform.scale.x,
				140 * self.transform.scale.y, 230 * self.transform.scale.x, "center")
				
	LG.printf(	tostring(Game.level),
				font, 0 * self.transform.scale.x,
				180 * self.transform.scale.y, 230 * self.transform.scale.x, "center")
--
end
--
local function drawChrono(self, font)
--
	local s = math.abs(math.ceil(self.secondes))
	local secondes =  ( ( s >= 0 and s < 10) and tostring("0"..s) or tostring(s) )

	-- Time
	LG.printf(	"TIME", 
				font, 0 * self.transform.scale.x, 
				220 * self.transform.scale.y, 230 * self.transform.scale.x, "center")	
	-- Chrono
	LG.printf(	tostring(math.ceil(self.minutes)).." : "..secondes,
				font, 0 * self.transform.scale.x,
				270 * self.transform.scale.y, 230 * self.transform.scale.x, "center")
--
end

--
--	Object Level 
--
local Level = {
--
--	Objet transform
--
	transform = newObjTransform ( 0, 0,	0, 0, 0, 1, 1 ),
--
-- Dimension d'une tuile
--
	w      = 32,   h      = 32,
--
-- Nombre de colonnes et de lignes Ecran initial
--
	cols   = 25,   rows   = 18,
--
-- Nombre de colonnes et de lignes Ecran resize
--
	nbRows =  0,   nbCols = 0,
--
	dbg = {}
--
}

--
-- Fonctions publiques
-- 
function Level:load()		
--
	init(self)
--
	self:Scale()
--	
end
--
function Level:update(dt)
	-- 
	chronometre(self, dt)
	-- 
	resolve(self, dt)
	--
end
--
function Level:draw()
--
	local font = (( Game.win.fullscreen) and
					Game.assetManager:getFont("font70") or
					Game.assetManager:getFont("font42") )
--
	drawTiles(self)
	drawImageResolve(self)
	drawHighScore(self,font)
	drawScore(self,font)
	drawLevel(self, font)
	drawChrono(self, font)
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
	self.transform.scale.x, self.transform.scale.y = x, y
--
end
--
function Level:debug()
	--
	if Game.debug then
		--
		LG.print("resolue_x:"..tostring(self.resolue_x), 10, 30)
		LG.print("resolue_y:"..tostring(self.resolue_y), 10, 40)
		LG.print("Nb Ligne resolution : "..tostring(#self.level.resolve.x),10,150)
		--
	end
	--	
end
--
return Level
