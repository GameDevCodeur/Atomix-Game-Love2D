local SceneEnd = {
	--
	transform = newObjTransform( 
									0, 0, 
									0, 0, 0, 
									1, 1
								)
}

function SceneEnd:load()
	--
	Game:reset()
	--
	self.w, self.h = Game.assetManager:getImage("endgame"):getDimensions( )
	--
	self:Scale()
	
end
--
function SceneEnd:update(dt)
	--
	if LC.isDown(1) then Game.sceneManager:switch("PlayGame") end
	
end
--
function SceneEnd:draw()
	--
	LG.draw(Game.assetManager:getImage("endgame"), 
			self.transform.translate.x * self.transform.scale.x,
			self.transform.translate.y * self.transform.scale.y,
			0,
			self.transform.scale.x, self.transform.scale.y)
end
--
function SceneEnd:resize(w, h)
	--
	self:Scale()
	
end
--
function SceneEnd:Scale()
	--
	self.transform.scale.x = ( (Game.win.w > self.w) and 
							   (Game.win.w / self.w) or (self.w / Game.win.w) )
	--
	self.transform.scale.y = ( (Game.win.h > self.h) and 
						       (Game.win.h / self.h) or (self.h / Game.win.h) ) 
	
end
--
function SceneEnd:keypressed(key, scancode, isrepeat)
	--	
	if key == "escape" then	Game:winReset()	end
	
end
--
function SceneEnd:exit()

end

return SceneEnd