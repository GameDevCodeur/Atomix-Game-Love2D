
local Background = {
	--
	transform = newObjTransform( 
									0, 0, 
									0, 0, 0, 
									1, 1
								)
}

function Background:load()
	--
	self.w = Game.assetManager:getImage("bgStage"..tostring(Game.stage)):getWidth()
	self.h = Game.assetManager:getImage("bgStage"..tostring(Game.stage)):getHeight()
	--	
	self:Scale()	
		
end

function Background:Scale()
	--
	if self.w ~= nil then
		--
		self.transform.scale.x = ( (Game.win.w > self.w) and 
								   (Game.win.w / self.w) or (self.w / Game.win.w) )
		--
		self.transform.scale.y = ( (Game.win.h > self.h) and 
								   (Game.win.h / self.h) or (self.h / Game.win.h) )
	end
end

function Background:SetScale(x, y)
	--
	self.transform.scale.x = x
	self.transform.scale.y = y
	
end

function Background:update(dt)
	
end

function Background:draw()
	--
	LG.draw(Game.assetManager:getImage("bgStage"..tostring(Game.stage)), 
			self.transform.translate.x * self.transform.scale.x,
			self.transform.translate.y * self.transform.scale.y,
			0,
			self.transform.scale.x,
			self.transform.scale.y)
end


function Background:debug()
end

return Background