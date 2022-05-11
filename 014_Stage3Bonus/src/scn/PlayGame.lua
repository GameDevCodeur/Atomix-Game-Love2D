local ScenePlay = {}

function ScenePlay:load()
	-- Charger objets du jeu
	for i, v in ipairs(Game.assetManager:getObjects()) do v:load() end
	
end

-- Update
function ScenePlay:update(dt)
	-- Objets du jeu
	for i, v in ipairs(Game.assetManager:getObjects()) do v:update(dt) end
	
end

-- Afficher
function ScenePlay:draw()
	-- Objets du jeu
	for i, v in ipairs(Game.assetManager:getObjects()) do v:draw() end	
	-- FPS
	LG.print("FPS: "..tostring(LT.getFPS()), Game.win.w - 140, 20)
	-- Information de débogage
	for i, v in ipairs(Game.assetManager:getObjects()) do v:debug()  end
	
end
--
function ScenePlay:resize(w, h)
	--
	Game.win.w = w
	Game.win.h = h	
	
	for i, v in ipairs(Game.assetManager:getObjects()) do v:Scale() end
	
end
--
function ScenePlay:keypressed(key, scancode, isrepeat)
	--
	if key == "escape" then	Game:winReset()	end
	--
	if key == "f" then Game.win.fullscreen = LW.setFullscreen( true ) end
	
end
--
function ScenePlay:exit()

end

return ScenePlay