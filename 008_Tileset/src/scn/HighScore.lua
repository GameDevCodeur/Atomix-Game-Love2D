
local scnHighScore = {
	--
	transform = newObjTransform( 
									0, 0,
									0, 0,
									0,
									1, 1
								),
	--	
	toggle = false,	
	tempo  = 0,

}

function scnHighScore:load()	
	--
	self.w, self.h = Game.assetManager:getImage("bghighscore"):getDimensions( )

end
--
function scnHighScore:update(dt)
	--
	self.tempo = self.tempo + dt
	--
	if self.tempo > 0.3 then
		--
		self.tempo = 0
		--
		self.toggle = not self.toggle 
		
	end
	
end
--
function scnHighScore:draw()	
	--
	LG.draw(Game.assetManager:getImage("bghighscore"), 
			self.transform.translate.x * self.transform.scale.x,
			self.transform.translate.y * self.transform.scale.y,
			0,
			self.transform.scale.x, self.transform.scale.y)
end
--
function scnHighScore:exit()
end
--
function scnHighScore:destroy()
end
--
function scnHighScore:reset()		
end
--
function scnHighScore:resize(w, h)
	--
	self.transform.scale.x = ( (Game.win.w > self.w) and 
							   (Game.win.w / self.w) or (self.w / Game.win.w) )
	--
	self.transform.scale.y = ( (Game.win.h > self.h) and 
						       (Game.win.h / self.h) or (self.h / Game.win.h) ) 
	--
end
--
function scnHighScore:addHighScore()
end
--
function scnHighScore:keypressed(key, scancode, isrepeat)
	--
	if key == "escape" then	Game:winReset()	end
	--
	if key == "return" or key == "kpenter" then 
		--
		self:addHighScore()
		Game.sceneManager:switch("PlayGame")
		--
	end
	--
end

return scnHighScore