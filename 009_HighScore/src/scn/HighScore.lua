--
local scnHighScore = {
	--
	transform = newObjTransform( 
									0, 0,
									0, 0,
									0,
									1, 1
								),
	--
	scores 		= {},
	nbScores 	= 0,
	nbScoresMax = 8,
	indice 		= 1,
	chars 		= {},
	posnewscore = 0,
	--
}
--
function scnHighScore:load()
	--
	self.w, self.h = Game.assetManager:getImage("bghighscore"):getDimensions( )
	--
	self:resize(0, 0)
	--
	self.tempo = 0
	--
	self.addnew = false
	--
	if LF.getInfo("GameData.lua") == nil then
		--
		LF.newFile("GameData.lua")
		LF.write("GameData.lua", tostring("5000	GDC"))
		
	end
	--
	local file = LF.newFile("GameData.lua")
	--
	if not LF.getInfo("GameData.lua") or not file:open("r") then return end
	--
	self.scores = {}
	--
	for line in file:lines() do
		--
		local i = line:find('\t', 1, true)
		self.scores[#self.scores + 1] = {sc = line:sub(1, i-1), na = line:sub(i+1)}
	
	end	
	--
	if(#self.scores) then
		--
		Game.score.highscore = self.scores[1].sc
		--
	end	
	--	
    file:close()
	--
end
--
function scnHighScore:add(newscore)
	--
	self.scores[#self.scores + 1] = newscore
	table.sort(self.scores, function (SC1, SC2) return tonumber(SC1.sc) > tonumber(SC2.sc) end)
	--	
end
--
function scnHighScore:save()
	--
	local file = LF.newFile("GameData.lua")
	--
	if not file:open("w") then return end
	--
	self.nbScores = ( (#self.scores < self.nbScoresMax) and (#self.scores) or (self.nbScoresMax) )
	--
	for i = 1, self.nbScores do
		--
		file:write(self.scores[i].sc .. "\t" .. self.scores[i].na .. "\n")
		--
	end	
	--
	if(#self.scores) then
		--
		Game.score.highscore = self.scores[1].sc
		--
	end
	--
	file:close()
	--
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
		--
	end
	--
	if self.addnew == false then
		--
		for k,v in ipairs(self.scores) do
			--
			if tonumber(v.sc) < tonumber(Game.score.points) then 
				--
				self.posnewscore = k
				--
				self:add({sc = Game.score.points, na = ""})	
				--
				self.addnew = true
				--
				break
				--
			end
		--
		end
		--
	end
	--
end
--
function scnHighScore:draw()
	--
	local font = (( Game.win.fullscreen) and
					Game.assetManager:getFont("font70") or
					Game.assetManager:getFont("font36") )
	
	local ofx = (( Game.win.fullscreen) and	180 or 1 )
	local ofy = (( Game.win.fullscreen) and	180 or 1 )
	--
	LG.draw(Game.assetManager:getImage("bghighscore"), 
			self.transform.translate.x * self.transform.scale.x,
			self.transform.translate.y * self.transform.scale.y,
			0,
			self.transform.scale.x, self.transform.scale.y)
	--	
	for k, v in ipairs(self.scores) do 
		-- 
		if k > self.nbScoresMax then break end
		--
		LG.printf(	v.na,
					font,  
					(180 * self.transform.scale.x), 
					(180 * self.transform.scale.y) + (30 * k * self.transform.scale.y), 
					300, "left" )
		--		
		LG.printf(	tostring(v.sc),
					font, 
					(360 * self.transform.scale.x) + ofx * self.transform.scale.x, 
					(180 * self.transform.scale.y) + (30 * k * self.transform.scale.y), 
					300, "right" )
		--
	end		
	--	
	if self.toggle and self.addnew then
		--
		LG.printf(	"[ ]",
					font, 
					(165 * self.transform.scale.x) + (15 * self.transform.scale.x) + 15 * #self.chars-1, 
					(180 * self.transform.scale.y) + (30 * self.posnewscore * self.transform.scale.y), 
					300, "left" )
		--
	end
	--
end
--
function scnHighScore:exit()	
	--
	self:save()	
	--
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
function scnHighScore:keypressed(key, scancode, isrepeat)
	--
	if key == "left"     or key == "right"       or key == "up"     	 or key =="down"   	or
	   key == "delete"   or key == "insert"      or key == "end"   		 or key =="home"   	or
	   key == "pageup"   or key == "pagedown"    or key == "end"   		 or key =="lshift" 	or
	   key == "numlock"  or key == "lctrl"       or key == "rctrl" 		 or key =="rshift" 	or
	   key == "capslock" or key == "tab"         or key == "lgui"  	 	 or key =="kp+"    	or
	   key == "f1" 		 or key == "f2"          or key == "f3"  	 	 or key =="f4"    	or
	   key == "f5" 		 or key == "f6"          or key == "f7"  	 	 or key =="f8"    	or
	   key == "f9" 		 or key == "f10"         or key == "f11"  	 	 or key =="f12"    	or
	   key == "kp*" 	 or key == "kp/"         or key == "k."  	 	 or key =="kp1"    	or
	   key == "kp1" 	 or key == "kp2"         or key == "kp3"  	 	 or key =="kp4"    	or
	   key == "kp5" 	 or key == "kp6"         or key == "kp7"  	 	 or key =="kp8"    	or
	   key == "kp9" 	 or key == "ù"           or key == "$"  	 	 or key =="^"    	or
	   key == "rgui"     or key == "²" 			 or key == "scrolllock"  or key =="pause"   or
	   key == "kp-"      or key == "printscreen" or key == "scrolllock"  or key =="pause" 	then return end
	--
	if key == "backspace" then
		--
		if self.indice >= 1 and self.addnew then
			--
			table.remove(self.chars, self.indice)
			--
			self.indice = self.indice - 1
			--			
			if self.indice <= 0 then self.indice = 1 end
			--
			self.chars[self.indice] = ""			
			--
			self.scores[self.posnewscore].na = ""
			--
			for k,v in ipairs(self.chars) do
				--
				self.scores[self.posnewscore].na = self.scores[self.posnewscore].na..v
				--
			end
			--
		end
		--
	elseif key == "escape" then	
		--
		Game:winReset()	
		--
	elseif key == "return" or key == "kpenter" then 
		--
		Game:reset()
		--
		Game.sceneManager:switch("PlayGame")
		--
	elseif self.indice < 18 and self.addnew then 
		--
		if key == "space" then
			--
			self.chars[self.indice] = " "
			--
		else
			--
			self.chars[self.indice] = key
			self.scores[self.posnewscore].na = self.scores[self.posnewscore].na..key
			
			--
		end
		--
		self.indice = self.indice + 1
		--	
	end
	--
end

return scnHighScore