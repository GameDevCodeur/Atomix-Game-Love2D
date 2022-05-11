--
-- Fonctions locales (privées)
-- 

local function collideAtomes(self, atome, ofx, ofy)
--
	for _,at in pairs(self.atomes) do
	--
		if at.selected == false then
		--
			if at.transform.translate.x == atome.transform.translate.x + ofx and
			   at.transform.translate.y == atome.transform.translate.y + ofy then 
			 --
			   atome.selected = false; 
			   return true
			--
			end
			--
		end
		--
	end	
	--
	return false
--
end
--
local function collideTuiles(self, atome, ofx, ofy)
--
	if Game.assetManager:getObject("level"):getTile(atome.transform.translate.x + ofx, 
													atome.transform.translate.y + ofy ) ~= 1 then 
		--
		atome.selected = false
		return true
		--
	end
	--
	return false
--
end
--
local function moved(self, atome, ofx, ofy)
	-- Tests collision tuiles
	if collideTuiles(self, atome, ofx, ofy) then return end	
	-- Tests collision Atome
	if collideAtomes(self, atome, ofx, ofy) then return end	
	-- Play Sound
	Game.assetManager:getSound("moved"):play()	
	-- Déplacement
	atome.transform.translate.x = atome.transform.translate.x + ofx
	atome.transform.translate.y = atome.transform.translate.y + ofy
	--
end
--
local function moveAtome(self, atome, tileX, tileY)

	-- Déplacement Gauche
	if  tileX < atome.transform.translate.x and atome.selected then
	--
	while atome.selected do	moved(self, atome, -1, 0) end
	
	-- Déplacement Droite
	elseif  tileX > atome.transform.translate.x and atome.selected  then
		--
		while atome.selected do moved(self, atome, 1, 0)	 end
		--						
	-- Déplacement Haut
	elseif  tileY < atome.transform.translate.y and atome.selected  then
		--
		while atome.selected do	moved(self, atome, 0, -1) end
		--	
	-- Déplacement Bas
	elseif  tileY > atome.transform.translate.y and atome.selected  then
		--
		while atome.selected do moved(self, atome, 0, 1)	 end
		--	
	end
--
end
--
local function clickAtome(self, atome, tileX, tileY)
--
	if( atome.transform.translate.x == tileX and
		atome.transform.translate.y == tileY and Mouse.button) then
		--
		atome.selected = true
		--
		Game.assetManager:getSound("click"):play()
		--
		if Game.assetManager:getObject("level").stoptime then
			--
			Game.assetManager:getObject("level").stoptime = false
			--
		end
		--
	end
--
end
--
local function createAtome(self)
	--
	for i, v in ipairs(Game.assetManager:getObject("level").level.atomes) do
			-- Creer nouveau atome
			local newAtome = {
								--
								transform 	= newObjTransform	(
																	v.tx, v.ty,
																	v.rx, v.ry, v.rspeed,
																	1, 1
																),
								id			= v.id,
								points 		= v.pts,
								life 		= 1,
								selected    = false
								--
							 }
							 
			-- Ajouter newAtome
			table.insert(self.atomes, newAtome)
			--
	end
	--
end
--
local function drawCercle(self, tx, ty, atome)
--
	if atome.selected == true and self.timer > 0 then
	--
		LG.draw	(
					Game.assetManager:getImage("selected"), 
					tx,	ty,	0,
					self.transform.scale.x, self.transform.scale.y
				)
	--
	end
--
end
--
local function drawQuadAtome(self, tx, ty , atome)
--
	LG.draw	(	
				Game.assetManager:getImage("atomes"),
				Game.assetManager:getImageQuad("atomes", atome.id, self.w),
				tx,	ty,	0,
				self.transform.scale.x,	self.transform.scale.y
			)
--
end
--
local function draw(self, atome)
--
	if atome.life == 1 then 
		-- Position tx,ty
		local tx = atome.transform.translate.x * self.w * self.transform.scale.x
		local ty = atome.transform.translate.y * self.h * self.transform.scale.y			
		-- 
		drawQuadAtome(self, tx, ty, atome) 	-- Affichage Atome
		drawCercle(self, tx, ty, atome)		-- Affichage Cercle
	--
	end
--
end

--
--	Object Atome 
--
local Atome = {
	--
	transform = newObjTransform	( 0, 0, 0, 0, 0, 1, 1 ),	
	-- Dimension d'un Atome
	w 		= 32, h	     = 32,
	-- Nombre de colonnes et de lignes Ecran initial
	cols    = 25, rows 	 = 18,
	-- Nombre de colonnes et de lignes Ecran resize
	nbRows 	= 0,  nbCols = 0,
	-- Timer d'affichage du halo de selection
	timer   = 0,
	--
}

--
-- Fonctions publiques
-- 
function Atome:load()
	--
	self:init()
	--
	self:Scale()
	--
end
--
function Atome:init()
	--
	self.atomes = {}
	--
	createAtome(self)
	--
end
--
function Atome:update(dt)

	-- scintillement cercle de selection
	self.timer = self.timer + dt	
	if self.timer > 0.03 then self.timer = 0 end
	
	-- Tuile(X,Y) à la possition de la souris
	local tileX, 
		  tileY = Mouse:getTile (
									math.floor(self.w * self.transform.scale.x),
									math.floor(self.h * self.transform.scale.y)
								)
							
	--
	for _, atome in pairs(self.atomes) do
		--		
		clickAtome(self, atome, tileX, tileY)	-- Click atome		
		moveAtome (self, atome, tileX, tileY)	-- Deplace Atome
		--
	end
end
--
function Atome:draw()
	--
	for _, atome in pairs(self.atomes) do draw(self, atome) end	
	--
end
--
function Atome:Scale()
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
function Atome:SetScale(x, y)
	--
	self.transform.scale.x = x
	self.transform.scale.y = y
	--
end
--
function Atome:debug()
	--
	if (Game.debug) then 
		--
		LG.print("Nb Atomes : "..tostring(#self.atomes), 10, 70)
		LG.print("Nb nbRows : "..tostring(self.nbRows),  10, 80)
		LG.print("Nb nbCols : "..tostring(self.nbCols),  10, 90)
		--
	end
	--
end
--
return Atome