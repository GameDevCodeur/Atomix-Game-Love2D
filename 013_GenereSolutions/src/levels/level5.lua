return {

			x   = 14, -- nb de col
			y   = 13, -- nb de rows
			--
			ofx =  8, -- calage x 
			ofy =  4, -- calage y
			
			-- Chonométre
			minutes = 3, secondes = 00,
			
			-- Atomes
			atomes	=	{
							{id =  2, tx = 11,  ty = 10, rx = 0, ry = 0, rspeed = 0, pts =  5 }, -- 1 -- OR
							{id	=  4, tx = 16,  ty = 10, rx = 0, ry = 0, rspeed = 0, pts = 20 }, -- 2 -- C4
							{id =  6, tx = 13,  ty =  7, rx = 0, ry = 0, rspeed = 0, pts =  5 }, -- 3 -- OB
							{id =  6, tx = 18,  ty = 11, rx = 0, ry = 0, rspeed = 0, pts =  5 }, -- 4 -- OB
							{id =  5, tx = 17,  ty = 15, rx = 0, ry = 0, rspeed = 0, pts =  5 }, -- 5 -- OH
							{id =  7, tx = 16,  ty =  6, rx = 0, ry = 0, rspeed = 0, pts =  5 }, -- 6 -- ODBL
							{id =  8, tx =  9,  ty = 15, rx = 0, ry = 0, rspeed = 0, pts =  5 }, -- 7 -- ODHL
							{id =  9, tx = 19,  ty =  9, rx = 0, ry = 0, rspeed = 0, pts =  5 }, -- 8 -- C4DR
							{id = 10, tx = 11,  ty =  8, rx = 0, ry = 0, rspeed = 0, pts =  5 }, -- 9 -- C2R
						},			
			--
			data 	= 	{
							{0,0, 0, 0, 0, 0,9, 9, 9, 9, 0, 0, 0, 0},
							{0,0, 9, 9, 9, 9,9, 1, 1, 9, 0, 0, 0, 0},
							{0,0, 9, 1, 1, 1,1, 1, 1, 9, 0, 0, 0, 0},
							{0,0, 9, 1, 1, 1,9, 9, 9, 9, 9, 9, 9, 9},
							{0,0, 9, 1, 1, 1,1, 1, 1, 9, 1, 1, 1, 9},
							{0,0,10,10,10,10,1, 1, 9, 9, 1, 1, 1, 9},
							{9,9, 9, 1, 1,10,1, 1, 1, 9, 1, 1, 1, 9},				
							{9,1, 1, 1, 1,10,1, 1, 1, 1, 1, 1, 1, 9},
							{9,1,10, 1, 1,10,1,10,10,10,10,10,10,10},
							{9,1, 1, 1, 1, 1,1, 1, 1, 1, 1, 1, 1, 9},
							{9,1, 1, 1,10, 1,1, 1, 1,10,10, 1, 1, 9},
							{9,1, 1, 1,10, 1,1, 1, 1, 1, 1, 1, 1, 9},
							{9,9, 9, 9,10, 9,9, 9, 9, 9, 9, 9, 9, 9},
						},
					
			-- Solution
			resolve	 =  {
							--
							x = {
								 {{3,1,4},{4,2,6},{3,3,6},{1,1,2},{2,1,9},{9,1,8},{5,3,7}},
								 {{4,1,3},{3,2,6},{4,3,6},{1,1,2},{2,1,9},{9,1,8},{5,3,7}},
								},
							--
							y = {{{1,1,5},{3,1,2},{2,1,5},{4,1,9},{8,-1,6},{8,1,7},{6,2,7}},
								 {{1,1,5},{4,1,2},{2,1,5},{3,1,9},{8,-1,6},{8,1,7},{6,2,7}},},
							--
						},
			
			--			
			explode  =  {1,2,3,4,5,6,7,8,9}
					
	   }