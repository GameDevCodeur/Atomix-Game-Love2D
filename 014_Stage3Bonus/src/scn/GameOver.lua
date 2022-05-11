--
local SceneOver = { transform = newObjTransform( 0, 0, 0, 0, 0, 1, 1 ) }
--
function SceneOver:load()
--
	self.w, self.h = Game.assetManager:getImage("gameover"):getDimensions( )
	--
	self:Scale()
--
end
--
function SceneOver:update(dt)
--
	if LC.isDown(1) then
	--
		Game:reset()
	--
		Game.sceneManager:switch("PlayGame")
	--
	end
--
end
--
function SceneOver:draw()
--
	LG.draw(Game.assetManager:getImage("gameover"), 
			self.transform.translate.x * self.transform.scale.x,
			self.transform.translate.y * self.transform.scale.y,
			0,
			self.transform.scale.x, self.transform.scale.y)
--
end
--
function SceneOver:resize(w, h)
--
	self:Scale()
--	
end
--
function SceneOver:Scale()
--
	self.transform.scale.x = ( (Game.win.w > self.w) and 
							   (Game.win.w / self.w) or (self.w / Game.win.w) )
--
	self.transform.scale.y = ( (Game.win.h > self.h) and 
						       (Game.win.h / self.h) or (self.h / Game.win.h) ) 
--	
end
--
function SceneOver:keypressed(key, scancode, isrepeat)
--
	if key == "escape" then	Game:winReset()	end
--	
end
--
function SceneOver:exit()

end
--
return SceneOver