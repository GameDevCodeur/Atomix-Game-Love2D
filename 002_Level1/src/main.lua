
require ("mod.Modules")

-- Charge les valeurs
function love.load()	
	--
	Game:load()
	--
	min_dt = 0.010 -- 1/60
    next_time = LT.getTime()	
	
end

-- Logique
function love.update(dt)	
	--
	next_time = next_time + min_dt
	--
	Game:update(dt)
	
end

-- Affichage
function love.draw() 
	--
	Game:draw()
	--
	local cur_time = LT.getTime()
	
	if next_time <= cur_time then
		--
      next_time = cur_time
      return
	  
	end
	--
	LT.sleep(next_time - cur_time)	
	
end
--
function love.resize(w, h)	
	--
	Game:resize(w, h)
	
end

function love.keypressed(key, scancode, isrepeat)
	--
	Game:keypressed(key, scancode, isrepeat)
	--
	if key == "f" then
		--
		Game.win.fullscreen = LW.setFullscreen( true )
		
	end
	--
	if key == "d" then
		--
		Game.debug = not Game.debug
		
	end
	--
	if key == "q" then
		--
		love.event.quit()
	  
	end
	
end
