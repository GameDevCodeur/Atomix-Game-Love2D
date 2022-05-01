local SceneMenu = {
	--
	transform = newObjTransform(
									0, 0,
									0, 0, 0,
									1, 1
								)
	--
}
--
function SceneMenu:load()		
	--
	self.w, self.h = Game.assetManager:getVideo("menu"):getDimensions( )
	--
	self:resize(0, 0)
	--
    Game.assetManager:getVideo("menu"):play()
	--
end
--
function SceneMenu:update(dt)
	--
	if LC.isDown(1) then
		--
		Game.sceneManager:switch("PlayGame")
		--
	end
	--
end
--
function SceneMenu:draw()
	--
	local font = (( Game.win.fullscreen) and
					Game.assetManager:getFont("font70") or
					Game.assetManager:getFont("font42") )
					
	--
	if Game.assetManager:getVideo("menu"):isPlaying() then
		--
		LG.draw(Game.assetManager:getVideo("menu"), 0,
													0,
													0,
													self.transform.scale.x, self.transform.scale.y)
		--
	else
		--
		Game.assetManager:getVideo("menu"):play()
		--
	end
	
	-- Affiche Copyright		
	LG.printf(	"(c) 2022 GAMEDEVCODEUR INC", 
				font, 
				0, 
				Game.win.h - (self.transform.scale.y * 30), 
				Game.win.w, "center")
	--
end
--
function SceneMenu:exit()
	--
	Game.assetManager:getVideo("menu"):getSource():stop()
	--
end
--
function SceneMenu:destroy()

end
--
function SceneMenu:resize(w, h)
	--
	self.transform.scale.x = ( (Game.win.w > self.w) and 
							   (Game.win.w / self.w) or (self.w / Game.win.w) )
	--
	self.transform.scale.y = ( (Game.win.h > self.h) and 
						       (Game.win.h / self.h) or (self.h / Game.win.h) ) 
	--	
end
--
function SceneMenu:keypressed(key, scancode, isrepeat)
	--
	if key == "space" or key == "return" or key == "kpenter"then 
		--
		Game.sceneManager:switch("PlayGame")	
		--
	end
	--
	if key == "escape" then	Game:winReset()	end
	--
	if key == "q" then love.event.quit() end
	--
end

return SceneMenu