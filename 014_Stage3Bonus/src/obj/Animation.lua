
local Animation = {
	--
	run = false,
	x   = 32,
    y   = 32,
	
}

function Animation:newAnimation(image, width, height, duration)
	--
    self.spriteSheet = image;
    self.quads = {}

    for y = 0, image:getHeight() - height, height do
        for x = 0, image:getWidth() - width, width do
            table.insert(self.quads, LG.newQuad(x, y, width, height, image:getDimensions()))
        end
    end

    self.duration = duration or 1
    self.currentTime = 0

end


function Animation:load()
	
	self:newAnimation(Game.assetManager:getImage("oexplode"), 32, 32, 2)
  
end

function Animation:update(dt)
	--
	if self.run then
		self.currentTime = self.currentTime + dt
		if self.currentTime >= self.duration then
			self.currentTime = self.currentTime - self.duration
		end
	end
  
end

function Animation:draw()
	--
	local spriteNum = math.floor(self.currentTime / self.duration * #self.quads) + 1
	
	if spriteNum == 5 then self.run = false end
	
	if self.run then
		LG.draw(self.spriteSheet, self.quads[spriteNum], self.x, self.y, 0, 1 )
		
	end
	
end

function Animation:Scale()
		
end

function Animation:debug()
end

return Animation

