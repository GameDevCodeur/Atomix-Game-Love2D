Mouse = {
	x      = 0,
	y 	   = 0,
	button = false
}
--
function Mouse:load()	
	-- Mouse	
	LC.setCursor( Game.assetManager:getCursor("mousepointer") )
	
end
--
function Mouse:update(dt)
	-- Mouse
	if LC.isDown(1) then
		--
		LC.setCursor( Game.assetManager:getCursor("mouseclick") )
	else
		--
		LC.setCursor( Game.assetManager:getCursor("mousepointer") )
		
	end			
end
--
function Mouse:draw()
	if Game.debug then
		Mouse:getTile(32, 32)
		--
		LG.print("Mouse : (X: "..tostring(LC.getX())..", Y: "..tostring(LC.getY())..")", 10, 100)
		LG.print("Mouse Tile : (X: "..tostring(self.x)..", Y: "..tostring(self.y)..")", 10, 110)
	end
end

function Mouse:getTile(w, h)
	-- Position Mouse
	self.x, self.y = LC.getPosition()
	-- Convertir coordonnées souris en coordonnées de grille
	self.x = math.floor(self.x/w)
	self.y = math.floor(self.y/h)
	-- Retourne les variables
	return self.x, self.y
	
end

function Mouse:mousemoved( x, y, dx, dy, istouch )
	--
	self.button = false
end

function Mouse:mousepressed(x, y, button, istouch)
	--
	self.button = true
	
end

function Mouse:mousereleased( x, y, button, istouch, presses )
	--
	self.button = false
	
end
--
function Mouse:Scale()end
function Mouse:SetScale(x, y)end
