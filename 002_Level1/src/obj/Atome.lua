
local Atome = {
	--
	transform 	= newObjTransform	( 
										0, 0, 
										0, 0, 0,
										1, 1															
									),
	--
	w 		= 64,
	h 		= 64,
	--
	rows 	= 13,
	cols 	= 20,
	--
	nbRows 	= 0,
	nbCols 	= 0	
	
}

function Atome:load()
	--
	self.atomes = {}
	--
	self.level  = 	{
						{
							id		= "oxygeneR",
							tx		= 9,
							ty		= 9,
							rx      = 0,
							ry      = 0,
							rspeed	= 0, 
							pts		= 5
						},
						{
							id		= "oxygeneL", 
							tx		= 9,
							ty		= 4,
							rx		= 0,
							ry      = 0,
							rspeed	= 0, 
							pts		= 5
						},
						{
							id		= "hydrogeneH", 
							tx		= 14,
							ty		= 8,
							rx		= 0,
							ry      = 0,
							rspeed	= 0, 
							pts		= 10
						},
					}					
	--
	self:CreateAtome()
	--
	self:Scale()
end

function Atome:CreateAtome()
	--
	for i, v in ipairs(self.level) do	
		-- Creer nouveau atome
		local newAtome = {
							transform 	= newObjTransform	( 
																v.tx, v.ty, 
																v.rx, v.ry, v.rspeed,
																1, 1															
															),
							id			= v.id,
							pts 		= v.pts,
							live 		= 1,
							selected    = false
							
						 }
		-- Ajouter newAtome
		table.insert(self.atomes, newAtome)		
	end
end

function Atome:moved(v, valx, valy)
	-- Tuile ~= 1 pas de déplacement
	if Game.assetManager:getObject("level"):getTile(
		v.transform.translate.x + valx, v.transform.translate.y + valy ) ~= 1			
		then v.selected = false; return end		
	-- Collision autre atome pas de déplacement
	for _,v1 in pairs(self.atomes) do
		if v1.selected == false then
			if v1.transform.translate.x == v.transform.translate.x + valx and
			   v1.transform.translate.y == v.transform.translate.y + valy
	 		   then v.selected = false; return end
		end
	end
	-- Déplacement
	v.transform.translate.x = v.transform.translate.x + valx
	v.transform.translate.y = v.transform.translate.y + valy

function Atome:update(dt)
	-- Recuperation tuile sous souris et si clickmouse gauche
	local tileX, 
		  tileY, 
		  clickmouse = getMouseTile(
										math.floor(self.w * self.transform.scale.x), 
										math.floor(self.h * self.transform.scale.y)
								    )
	-- Déplacement case par case
	for k,v in pairs(self.atomes) do
		-- Click atome
		if (
				v.transform.translate.x == tileX and 
				v.transform.translate.y == tileY and clickmouse
				
			) then v.selected = true end
			
		-- Déplacement Gauche
		if  tileX < v.transform.translate.x and v.selected then
			while v.selected do	self:moved(v, -1, 0) end
		end		
		-- Déplacement Droite
		if  tileX > v.transform.translate.x and v.selected then
			while v.selected do self:moved(v, 1, 0)	 end			
		end
		-- Déplacement Haut
		if  tileY < v.transform.translate.y and v.selected then
			while v.selected do	self:moved(v, 0, -1) end
		end
		-- Déplacement Bas
		if  tileY > v.transform.translate.y and v.selected then
			while v.selected do self:moved(v, 0, 1)	 end
		end
	end
end

function Atome:draw()
	--
	for _,v in pairs(self.atomes) do
	
		-- Position tx,ty
		local tx = v.transform.translate.x * self.w * self.transform.scale.x
		local ty = v.transform.translate.y * self.h * self.transform.scale.y
		
		-- Affichage des atomes
		LG.draw(
					Game.assetManager:getImage(v.id), 
					tx,
					ty,
					0,
					self.transform.scale.x, 
					self.transform.scale.y
				)
				
		-- Affichage cercle rouge si selected
		if v.selected == true then
			LG.draw(
					 Game.assetManager:getImage("atonselected"), 
					 tx,
					 ty,
					 0,
					 self.transform.scale.x, 
					 self.transform.scale.y
				   )
		end	
	end		
end

function Atome:Scale()
	--
	self.nbRows  = Game.win.h / self.h
	self.nbCols  = Game.win.w / self.w
	--
	self.transform.scale.x = (self.nbCols >= self.cols) and 
	                         (self.nbCols / self.cols ) or (self.cols / self.nbCols)
	--						 
	self.transform.scale.y = (self.nbRows >= self.rows) and 
	                         (self.nbRows / self.rows ) or (self.rows / self.nbRows)
		
end

function Atome:SetScale(x, y)
	--
	self.transform.scale.x = x
	self.transform.scale.y = y
	
end

function Atome:debug()
	--
	if (Game.debug) then 
		--
		LG.print("Nb Atomes : "..tostring(#self.atomes), 10, 70)
		LG.print("Nb nbRows : "..tostring(self.nbRows),  10, 80)
		LG.print("Nb nbCols : "..tostring(self.nbCols),  10, 90)		
		
	end
	
end

return Atome