local SceneIntro = {
	--
	transform = newObjTransform( 
									0, 0, 
									0, 0, 0, 
									1, 1
								)
}

function SceneIntro:load()
	--
	self.w, self.h = Game.assetManager:getVideo("intro"):getDimensions( )
	--
	self:resize(0, 0)
	--
    Game.assetManager:getVideo("intro"):play()
	
end
--
function SceneIntro:update(dt)
	--
	if Game.assetManager:getVideo("intro"):isPlaying( ) == false then
		--
		Game.sceneManager:switch("Menu")
		--
	end
	--
	if LC.isDown(1) then		
		--
		Game.sceneManager:switch("Menu")
		--
	end

end
--
function SceneIntro:draw()
	--
	local font = (( Game.win.fullscreen) and 
					Game.assetManager:getFont("font70") or 
					Game.assetManager:getFont("font42") )
					
	--
	if Game.assetManager:getVideo("intro"):isPlaying() then
		--
		LG.draw(Game.assetManager:getVideo("intro"), 0, 
													 0, 
													 0, 
													 self.transform.scale.x, self.transform.scale.y)
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
function SceneIntro:exit()
	--
	Game.assetManager:getVideo("intro"):getSource():stop()
	--
end
--
function SceneIntro:destroy()

end
--
function SceneIntro:resize(w, h)
	--
	self.transform.scale.x = ( (Game.win.w > self.w) and 
							   (Game.win.w / self.w) or (self.w / Game.win.w) )
	--
	self.transform.scale.y = ( (Game.win.h > self.h) and 
						       (Game.win.h / self.h) or (self.h / Game.win.h) ) 
	--
end
--
function SceneIntro:keypressed(key, scancode, isrepeat)
	--
	if key == "escape" then	Game:winReset()	end	
	
end

return SceneIntro