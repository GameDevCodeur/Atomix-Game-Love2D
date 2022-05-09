return {
		--
			x   = 6, -- nb de col
			y   = 6, -- nb de rows
			--
			ofx = 10, -- calage x
			ofy =  6, -- calage y
			
			-- Chonométre
			minutes = 1, secondes = 00,
			
			-- Atomes
			atomes	=	{
							{id =  14, tx = 11,  ty = 10, rx = 0, ry = 0, rspeed = 0, pts =  5 }, -- 1 
							{id	=  15, tx = 14,  ty =  7, rx = 0, ry = 0, rspeed = 0, pts =  5 }, -- 2 
							{id =  16, tx = 13,  ty = 10, rx = 0, ry = 0, rspeed = 0, pts =  5 }, -- 3 
							{id =  17, tx = 12,  ty =  7, rx = 0, ry = 0, rspeed = 0, pts =  5 }, -- 4 
							{id =  18, tx = 14,  ty =  9, rx = 0, ry = 0, rspeed = 0, pts =  5 }, -- 5 
							{id =  19, tx = 11,  ty =  7, rx = 0, ry = 0, rspeed = 0, pts =  5 }, -- 6 
							{id =  20, tx = 12,  ty =  8, rx = 0, ry = 0, rspeed = 0, pts =  5 }, -- 7 
							{id =  21, tx = 13,  ty =  8, rx = 0, ry = 0, rspeed = 0, pts =  5 }, -- 8
					   },
					   
			-- Tiles
			data 	= 	{
							{11,12,12,12,11,11},
							{12,1, 1, 1, 1, 12},
							{12,1, 1, 1, 1, 12},
							{12,1, 1, 1, 1, 12},
							{11,1, 1, 1, 1, 12},
							{11,12,12,12,12,11},						
						},
					
			-- Solution
			resolve	 =  {
							--
							x = {{{1,1,2},{2,1,3},{4,1,5},{5,1,6},{7,1,8}}},
							--
							y = {{{1,1,4},{4,1,7},{2,1,5},{5,1,8},{3,1,6}}},
							--
						},
			--
			explode  =  {1,2,3,4,5,6,7,8}
		--		
	   }
