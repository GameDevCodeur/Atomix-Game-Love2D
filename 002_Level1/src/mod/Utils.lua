-- 
function getMouseTile(w, h)
	-- Position Mouse
	local mouse_x, mouse_y = LC.getPosition()
	-- Boutin droit Clicker
	local clickmouse 	   = LC.isDown(1)
	-- Convertir coordonnées souris en coordonnées de grille
	mouse_x = math.floor(mouse_x/w)
	mouse_y = math.floor(mouse_y/h)
	-- Retourne les variables
	return mouse_x, mouse_y, clickmouse	
end
