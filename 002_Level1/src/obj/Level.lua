local Level = {
	--
	transform = newObjTransform( 
									0, 0, 
									0, 0, 
									0, 
									1, 1
								),
								
	w      = 64,
	h      = 64,
	rows   = 13,
	cols   = 20,
	nbRows = 0,
	nbCols = 0,
}
--
function Level:load()		
	--	
	self:Scale()
	
	self.level = {
					{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
					{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
					{0,0,0,0,0,0,3,3,3,3,3,0,0,0,0,0,0,0,0,0},
					{0,0,0,0,0,0,3,1,1,1,3,0,0,0,0,0,0,0,0,0},
					{0,0,0,0,0,0,3,1,1,1,2,3,3,3,3,3,0,0,0,0},
					{0,0,0,0,0,0,3,1,1,2,1,1,1,1,1,3,0,0,0,0},
					{0,0,0,0,0,0,3,1,2,1,1,1,1,1,1,2,3,0,0,0},
					{0,0,0,0,0,0,3,1,2,1,1,2,1,2,2,1,3,0,0,0},				
					{0,0,0,0,0,0,3,1,1,1,1,2,1,2,1,1,3,0,0,0},
					{0,0,0,0,0,0,3,2,2,1,2,1,1,2,1,1,3,0,0,0},
					{0,0,0,0,0,0,0,3,1,1,1,1,1,1,1,1,3,0,0,0},
					{0,0,0,0,0,0,0,3,3,3,3,3,3,3,3,3,3,0,0,0},
					{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},					
				}
								
end
--
function Level:update(dt)
	
end
--
function Level:draw()
	--
    local tuile  = ""
	--
	for y = 1, self.rows do
		for x = 1, self.cols do
			-- getTuile
			if self.level[y][x] == 0 then tuile = ""; 	   end
			if self.level[y][x] == 1 then tuile = "tuile1" end
			if self.level[y][x] == 2 then tuile = "tuile2" end
			if self.level[y][x] == 3 then tuile = "tuile3" end
			--
			if tuile ~= "" then
				--
				LG.draw(Game.assetManager:getImage(tuile), 
						self.w * (x - 1) * self.transform.scale.x,
						self.h * (y - 1) * self.transform.scale.y,
						0,
						self.transform.scale.x,
						self.transform.scale.y)
				--
				tuile = ""
					
			end		
		end
	end	
end
--
function Level:getTile(x,y)
	--
	return self.level[y+1][x+1]
	
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
		
end
--
function Level:SetScale(x, y)
	--
	self.transform.scale.x = x
	self.transform.scale.y = y
	
end
--
function Level:debug()
	if Game.debug then
		LG.print(tostring(Game.win.w), 10, 10)
		LG.print(tostring(Game.win.h), 10, 20)
		LG.print(tostring(self.transform.scale.x), 10, 30)
		LG.print(tostring(self.transform.scale.y), 10, 40)
		LG.print(tostring(self.nbCols), 10, 50)
		LG.print(tostring(self.nbRows), 10, 60)
	end
end

return Level