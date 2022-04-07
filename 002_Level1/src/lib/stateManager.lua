local State = {
				Intro 		= true,
				Menu  		= false,
				HighScore	= false,
				Play      	= false
			  }

function State:changeState(state)
	--
	self.Intro 	   = state == "Intro"
	self.Menu  	   = state == "Menu"
	self.HighScore = state == "HighScore"
	self.Play  	   = state == "Play"
	--
	Game:loadScene()
	
end

return State
