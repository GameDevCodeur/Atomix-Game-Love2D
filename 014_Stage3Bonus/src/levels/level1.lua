--
return { 
			x    = 11, -- nb de col
			y    = 10, -- nb de rows
			--
			ofx  =  8, -- calage x
			ofy  =  5, -- calage y
			
			-- Chonométre
			minutes  = 1, secondes = 0,
			
			-- Atomes
			atomes	 =	{
							{id	= 1, tx = 11, ty =  7, rx = 0, ry = 0, rspeed = 0, pts =  5 }, -- OL -- 1
							{id	= 2, tx = 11, ty = 12, rx = 0, ry = 0, rspeed = 0, pts =  5 }, -- OR -- 2
							{id	= 3, tx = 16, ty = 11, rx = 0, ry = 0, rspeed = 0, pts = 10 }, -- HH -- 3
						},
			-- Tiles
			data  = 	{
							{3,3,3,3,3,0,0,0,0,0,0},{3,1,1,1,3,0,0,0,0,0,0},{3,1,1,1,2,3,3,3,3,3,0},
							{3,1,1,2,1,1,1,1,1,3,0},{3,1,2,1,1,1,1,1,1,2,3},{3,1,2,1,1,2,1,2,2,1,3},
							{3,1,1,1,1,2,1,2,1,1,3},{3,2,2,1,2,1,1,2,1,1,3},{0,3,1,1,1,1,1,1,1,1,3},
							{0,3,3,3,3,3,3,3,3,3,3},
						},
			
			-- Solution
			resolve	 =  {x = {}, y = {}},
			--
			resolveg =  {x = {{{2,3,1}}}},
			--			
			explode  =  {1, 2, 3},
		
	   }
