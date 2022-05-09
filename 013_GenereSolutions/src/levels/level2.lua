return {
			x   = 14, -- nb de col
			y   = 11, -- nb de rows
			--
			ofx =  8, -- calage x 
			ofy =  5, -- calage y
			
			-- Chonométre
			minutes  = 2, secondes = 0,
			
			-- Atomes
			atomes	 =	{
							{id	= 1, tx = 16,  ty = 13, rx = 0, ry = 0, rspeed = 0, pts =  5 }, -- OL
							{id = 2, tx = 10,  ty = 10, rx = 0, ry = 0, rspeed = 0, pts =  5 }, -- OR
							{id	= 4, tx = 13,  ty =  9, rx = 0, ry = 0, rspeed = 0, pts = 20 }, -- C4
							{id	= 5, tx = 11,  ty = 14, rx = 0, ry = 0, rspeed = 0, pts =  5 }, -- OH
							{id	= 6, tx = 17,  ty =  9, rx = 0, ry = 0, rspeed = 0, pts =  5 }, -- OB							
						},
				
			-- Tiles			
			data 	=   {
							{4,4,4,4,4,0,0,0,0,0,0,0,0,0},
							{4,1,1,1,4,0,0,0,0,0,0,0,0,0},
							{4,1,1,1,5,4,5,4,4,4,4,4,4,4},
							{4,1,5,1,5,1,5,1,1,1,1,1,1,4},
							{4,1,5,1,5,1,5,1,1,1,5,1,1,4},
							{4,1,1,5,1,1,5,5,5,5,5,1,1,4},				
							{4,1,1,1,1,1,1,1,5,1,1,1,1,4},
							{4,1,1,1,1,1,1,1,5,1,1,1,1,4},
							{4,1,5,5,5,5,5,1,1,1,1,1,1,4},
							{4,1,1,1,5,1,1,4,4,4,4,4,4,4},
							{4,4,4,4,5,4,4,4,0,0,0,0,0,0},
					   },
				   
			-- Solution
			resolve	 =  {
							x = {{{3,-1,2},{3,1,1},{3, 0,4},{4,0,5}}},
							y = {{{3, 0,1},{1,0,2},{3,-1,5},{3,1,4}}},
						},
			
			--			
			explode  =  {5,2,3,1,4},
						
	   }
