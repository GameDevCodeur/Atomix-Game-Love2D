--
return { 
			x    = 11, -- nb de col
			y    = 10, -- nb de rows
			--
			ofx  =  8, -- calage x
			ofy  =  5, -- calage y
			
			-- Chonométre
			minutes  = 1, secondes = 0,
			
			-- Tiles
			data  = 	{
							{3,3,3,3,3,0,0,0,0,0,0},
							{3,1,1,1,3,0,0,0,0,0,0},
							{3,1,1,1,2,3,3,3,3,3,0},
							{3,1,1,2,1,1,1,1,1,3,0},
							{3,1,2,1,1,1,1,1,1,2,3},
							{3,1,2,1,1,2,1,2,2,1,3},
							{3,1,1,1,1,2,1,2,1,1,3},
							{3,2,2,1,2,1,1,2,1,1,3},
							{0,3,1,1,1,1,1,1,1,1,3},
							{0,3,3,3,3,3,3,3,3,3,3},
						},
			
			-- Solution
			resolve	 =  {
							x = {{{1,-1,3},{2,1,3}}},
							y = {{{1, 0,2},{2,0,3}}},
						},

			--			
			explode  =  {2, 3, 1},
		
	   }
