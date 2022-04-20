--
local Atome = {
	--
	transform 	= newObjTransform	(
										0, 0,
										0, 0, 0,
										1, 1
									),
	
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
function Atome:load()
	--
	self:init()
	--
	self:Scale()
	
end
--
function Atome:init()
	--
	self.atomes = {}
	--
	self.level = require("levels.atome"..Game.level)
	--
	self:CreateAtome()
	--
end
--
function Atome:CreateAtome()
	--
	for i, v in ipairs(self.level) do
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
function Atome:moved(v, valx, valy)
	-- Tuile ~= 1 pas de déplacement
	if Game.assetManager:getObject("level"):getTile(
		v.transform.translate.x + valx, v.transform.translate.y + valy ) ~= 1
		then v.selected = false; return end	
	-- Collision autres atomes pas de déplacement
	for _,v1 in pairs(self.atomes) do
		if v1.selected == false then
			if v1.transform.translate.x == v.transform.translate.x + valx and
			   v1.transform.translate.y == v.transform.translate.y + valy
	 		   then v.selected = false; return end
		end
	end	
	-- Play Sound
	Game.assetManager:getSound("moved"):play()	
	-- Déplacement
	v.transform.translate.x = v.transform.translate.x + valx
	v.transform.translate.y = v.transform.translate.y + valy
	--
end

function Atome:update(dt)
	-- scintillement cercle de selection
	self.timer = self.timer + dt
	--
	if self.timer > 0.03 then self.timer = 0 end		
	-- Recuperation tuile sous souris et si clickmouse gauche
	local tileX, tileY = Mouse:getTile(
							math.floor(self.w * self.transform.scale.x),
							math.floor(self.h * self.transform.scale.y))											
	-- Déplacement case par case
	for _,v in pairs(self.atomes) do	
		-- Click atome
		if( v.transform.translate.x == tileX and
			v.transform.translate.y == tileY and Mouse.button) then
			--
			v.selected = true
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
		-- Déplacement Gauche
		if  tileX < v.transform.translate.x and v.selected then
			--
			while v.selected do	self:moved(v, -1, 0) end
			--
		-- Déplacement Droite
		elseif  tileX > v.transform.translate.x and v.selected  then
			--
			while v.selected do self:moved(v, 1, 0)	 end
			--						
		-- Déplacement Haut
		elseif  tileY < v.transform.translate.y and v.selected  then
			--
			while v.selected do	self:moved(v, 0, -1) end
			--	
		-- Déplacement Bas
		elseif  tileY > v.transform.translate.y and v.selected  then
			--
			while v.selected do self:moved(v, 0, 1)	 end
			--	
		end
	end
end
--
function Atome:draw()
	--
	for k,v in pairs(self.atomes) do		
		-- Affichage
		if v.life == 1 then 
			-- Position tx,ty
			local tx = v.transform.translate.x * self.w * self.transform.scale.x
			local ty = v.transform.translate.y * self.h * self.transform.scale.y			
			-- Affichage atome
			LG.draw(	
						Game.assetManager:getImage("atomes"),
						Game.assetManager:getImageQuad("atomes", v.id, self.w),
						tx,
						ty,
						0,
						self.transform.scale.x,	
						self.transform.scale.y
					)
					
			-- Affichage cercle rouge
			if v.selected == true and self.timer > 0 then
				LG.draw(
						 Game.assetManager:getImage("selected"), 
						 tx,
						 ty,
						 0,
						 self.transform.scale.x, 
						 self.transform.scale.y
					   )
			end
			--
		end
	end	
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