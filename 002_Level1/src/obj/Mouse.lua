
local Mouse = {
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
		LC.setCursor( Game.assetManager:getCursor("mousepointerclick") )
	else
		--
		LC.setCursor( Game.assetManager:getCursor("mousepointer") )
		
	end			
end

--
function Mouse:Scale()end
function Mouse:SetScale(x, y)end
function Mouse:draw()end
function Mouse:debug()
	if Game.debug then
		local X, Y, Click = getMouseTile(64, 64)
		--
		LG.print("Mouse : (X: "..tostring(LC.getX())..", Y: "..tostring(LC.getY())..")", 10, 100)
		LG.print("Mouse Tile : (X: "..tostring(X)..", Y: "..tostring(Y)..")", 10, 110)
	end
end

return Mouse