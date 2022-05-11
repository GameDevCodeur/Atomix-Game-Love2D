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
							{id	= 1, tx = 16,  ty = 13, rx = 0, ry = 0, rspeed = 0, pts =  5 }, -- OL -- 1
							{id = 2, tx = 10,  ty = 10, rx = 0, ry = 0, rspeed = 0, pts =  5 }, -- OR -- 2
							{id	= 4, tx = 13,  ty =  9, rx = 0, ry = 0, rspeed = 0, pts = 20 }, -- C4 -- 3
							{id	= 5, tx = 11,  ty = 14, rx = 0, ry = 0, rspeed = 0, pts =  5 }, -- OH -- 4
							{id	= 6, tx = 17,  ty =  9, rx = 0, ry = 0, rspeed = 0, pts =  5 }, -- OB -- 5
						},
				
			-- Tiles			
			data 	=   {
							{4,4,4,4,4,0,0,0,0,0,0,0,0,0},{4,1,1,1,4,0,0,0,0,0,0,0,0,0},
							{4,1,1,1,5,4,5,4,4,4,4,4,4,4},{4,1,5,1,5,1,5,1,1,1,1,1,1,4},
							{4,1,5,1,5,1,5,1,1,1,5,1,1,4},{4,1,1,5,1,1,5,5,5,5,5,1,1,4},				
							{4,1,1,1,1,1,1,1,5,1,1,1,1,4},{4,1,1,1,1,1,1,1,5,1,1,1,1,4},
							{4,1,5,5,5,5,5,1,1,1,1,1,1,4},{4,1,1,1,5,1,1,4,4,4,4,4,4,4},
							{4,4,4,4,5,4,4,4,0,0,0,0,0,0},
					   },
				   
			-- Solution
			resolve	 =  {	x = {},	y = {}},
			
			resolveg =  {	x = {{{2,5,1},{2,3,1},{2,4,1}}}, y = {{{5,2,4},{5,3,4},{5,1,4}}}},
			--	
			explode  =  {1,2,3,4,5},
						
	   }