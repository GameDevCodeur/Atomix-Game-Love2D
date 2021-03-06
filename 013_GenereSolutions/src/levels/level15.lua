--
return { 
			x    = 13, -- nb de col
			y    = 12, -- nb de rows
			--
			ofx  =  8, -- calage x
			ofy  =  4, -- calage y
			
			-- Chonométre
			minutes = 5, secondes = 0,
			
			-- Atomes
			atomes	=	{
							{id	=  7, tx =  9, ty = 10, rx = 0, ry = 0, rspeed = 0, pts =  5 }, -- ODBL  --  1
							{id	=  7, tx = 19, ty = 11, rx = 0, ry = 0, rspeed = 0, pts =  5 }, -- ODBL  --  2
							{id	=  8, tx = 16, ty =  8, rx = 0, ry = 0, rspeed = 0, pts =  5 }, -- ODHL  --  3
							{id	=  8, tx = 19, ty =  9, rx = 0, ry = 0, rspeed = 0, pts =  5 }, -- ODHL  --  4
							{id	=  9, tx = 10, ty =  8, rx = 0, ry = 0, rspeed = 0, pts =  5 }, -- C2DR  --  5
							{id	= 11, tx = 15, ty =  7, rx = 0, ry = 0, rspeed = 0, pts =  5 }, -- C2DL  --  6
							{id	= 12, tx = 18, ty =  5, rx = 0, ry = 0, rspeed = 0, pts =  5 }, -- ODHR  --  7
							{id	= 12, tx = 11, ty =  6, rx = 0, ry = 0, rspeed = 0, pts =  5 }, -- ODHR  --  8	
							{id	= 13, tx = 13, ty =  6, rx = 0, ry = 0, rspeed = 0, pts =  5 }, -- ODBR  --  9
							{id	= 13, tx = 18, ty =  7, rx = 0, ry = 0, rspeed = 0, pts =  5 }, -- ODBR  -- 10
							{id	= 37, tx = 18, ty = 13, rx = 0, ry = 0, rspeed = 0, pts =  5 }, -- CD4D  -- 11
							{id	= 37, tx =  9, ty = 14, rx = 0, ry = 0, rspeed = 0, pts =  5 }, -- CD4D  -- 12							
						},
						
			-- Tiles
			data  	=	{
							{13,20,20,20,20,20,20,20,20,20,20,20,13},
							{20, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,20},
							{20, 1, 1, 1, 1, 1,13, 1, 1, 1, 1, 1,20},							
							{13,13, 1,13, 1, 1,13, 1,13,13, 1, 1,20},
							{20, 1, 1,13, 1, 1, 1, 1, 1, 1, 1, 1,20},
							{20, 1,13,13, 1,13,13,13,13,13, 1, 1,20},
							{20, 1, 1,13, 1, 1, 1, 1, 1, 1, 1, 1,20},
							{20, 1, 1, 1, 1, 1, 1,13, 1, 1, 1, 1,20},
							{20, 1,13,13, 1,13, 1, 1, 1, 1,13, 1,20},
							{20, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,20},
							{20, 1, 1, 1, 1, 1, 1,13, 1, 1, 1, 1,20},
							{13,20,20,20,20,20,20,13,20,20,20,20,13},
						},
						
			-- Solution
			resolve	 =  {
							x = {
									{{ 9,3,1},{10,2,6},{6,1,5},{5,2,2},{11,3,12},{7,2,3},{3,1,8},{8,2,4}},
									{{ 9,3,1},{10,2,6},{6,1,5},{5,2,2},{11,3,12},{8,2,3},{3,1,7},{7,2,4}},
									{{ 9,3,1},{10,2,6},{6,1,5},{5,2,2},{11,3,12},{7,2,4},{4,1,8},{8,2,3}},
									{{ 9,3,1},{10,2,6},{6,1,5},{5,2,2},{11,3,12},{8,2,4},{4,1,7},{7,2,3}},
																		
									{{ 9,3,2},{10,2,6},{6,1,5},{5,2,1},{11,3,12},{8,2,3},{3,1,7},{7,2,4}},
									{{ 9,3,2},{10,2,6},{6,1,5},{5,2,1},{11,3,12},{7,2,3},{3,1,8},{8,2,4}},
									{{ 9,3,2},{10,2,6},{6,1,5},{5,2,1},{11,3,12},{7,2,4},{4,1,8},{8,2,3}},
									{{ 9,3,2},{10,2,6},{6,1,5},{5,2,1},{11,3,12},{8,2,4},{4,1,7},{7,2,3}},
									
									{{ 9,3,1},{10,2,6},{6,1,5},{5,2,2},{12,3,11},{8,2,3},{3,1,7},{7,2,4}},
									{{ 9,3,1},{10,2,6},{6,1,5},{5,2,2},{12,3,11},{7,2,3},{3,1,8},{8,2,4}},
									{{ 9,3,1},{10,2,6},{6,1,5},{5,2,2},{12,3,11},{7,2,4},{4,1,8},{8,2,3}},
									{{ 9,3,1},{10,2,6},{6,1,5},{5,2,2},{12,3,11},{8,2,4},{4,1,7},{7,2,3}},
									
									{{ 9,3,2},{10,2,6},{6,1,5},{5,2,1},{12,3,11},{7,2,3},{3,1,8},{8,2,4}},
									{{ 9,3,2},{10,2,6},{6,1,5},{5,2,1},{12,3,11},{8,2,3},{3,1,7},{7,2,4}},
									{{ 9,3,2},{10,2,6},{6,1,5},{5,2,1},{12,3,11},{7,2,4},{4,1,8},{8,2,3}},
									{{ 9,3,2},{10,2,6},{6,1,5},{5,2,1},{12,3,11},{8,2,4},{4,1,7},{7,2,3}},
									
									{{10,3,1},{ 9,2,6},{6,1,5},{5,2,2},{11,3,12},{7,2,3},{3,1,8},{8,2,4}},
									{{10,3,1},{ 9,2,6},{6,1,5},{5,2,2},{11,3,12},{8,2,3},{3,1,7},{7,2,4}},
									{{10,3,1},{ 9,2,6},{6,1,5},{5,2,2},{11,3,12},{7,2,4},{4,1,8},{8,2,3}},
									{{10,3,1},{ 9,2,6},{6,1,5},{5,2,2},{11,3,12},{8,2,4},{4,1,7},{7,2,3}},
																		
									{{10,3,2},{ 9,2,6},{6,1,5},{5,2,1},{11,3,12},{8,2,3},{3,1,7},{7,2,4}},
									{{10,3,2},{ 9,2,6},{6,1,5},{5,2,1},{11,3,12},{7,2,3},{3,1,8},{8,2,4}},
									{{10,3,2},{ 9,2,6},{6,1,5},{5,2,1},{11,3,12},{7,2,4},{4,1,8},{8,2,3}},
									{{10,3,2},{ 9,2,6},{6,1,5},{5,2,1},{11,3,12},{8,2,4},{4,1,7},{7,2,3}},
									
									{{10,3,1},{ 9,2,6},{6,1,5},{5,2,2},{12,3,11},{8,2,3},{3,1,7},{7,2,4}},
									{{10,3,1},{ 9,2,6},{6,1,5},{5,2,2},{12,3,11},{7,2,3},{3,1,8},{8,2,4}},
									{{10,3,1},{ 9,2,6},{6,1,5},{5,2,2},{12,3,11},{7,2,4},{4,1,8},{8,2,3}},
									{{10,3,1},{ 9,2,6},{6,1,5},{5,2,2},{12,3,11},{8,2,4},{4,1,7},{7,2,3}},
									
									{{10,3,2},{ 9,2,6},{6,1,5},{5,2,1},{12,3,11},{7,2,3},{3,1,8},{8,2,4}},
									{{10,3,2},{ 9,2,6},{6,1,5},{5,2,1},{12,3,11},{8,2,3},{3,1,7},{7,2,4}},
									{{10,3,2},{ 9,2,6},{6,1,5},{5,2,1},{12,3,11},{7,2,4},{4,1,8},{8,2,3}},
									{{10,3,2},{ 9,2,6},{6,1,5},{5,2,1},{12,3,11},{8,2,4},{4,1,7},{7,2,3}},									
								},
								  
							y = {
									{{ 9,2,11},{10,2,7},{6,2,3},{2,2,4},{1,2,12},{5,2,8}},
									{{ 9,2,11},{10,2,8},{6,2,3},{2,2,4},{1,2,12},{5,2,7}},
									{{ 9,2,11},{10,2,7},{6,2,3},{1,2,4},{2,2,12},{5,2,8}},
									{{ 9,2,11},{10,2,8},{6,2,3},{1,2,4},{2,2,12},{5,2,7}},
									
									{{ 9,2,11},{10,2,8},{6,2,4},{2,2,3},{1,2,12},{5,2,7}},
									{{ 9,2,11},{10,2,7},{6,2,4},{2,2,3},{1,2,12},{5,2,8}},
									{{ 9,2,11},{10,2,7},{6,2,4},{1,2,3},{2,2,12},{5,2,8}},
									{{ 9,2,11},{10,2,8},{6,2,4},{1,2,3},{2,2,12},{5,2,7}},
									
									{{ 9,2,12},{10,2,7},{6,2,3},{2,2,4},{1,2,11},{5,2,8}},
									{{ 9,2,12},{10,2,8},{6,2,3},{2,2,4},{1,2,11},{5,2,7}},
									{{ 9,2,12},{10,2,8},{6,2,4},{2,2,3},{1,2,11},{5,2,7}},
									{{ 9,2,12},{10,2,7},{6,2,4},{2,2,3},{1,2,11},{5,2,8}},
									
									{{ 9,2,12},{10,2,7},{6,2,3},{1,2,4},{2,2,11},{5,2,8}},
									{{ 9,2,12},{10,2,8},{6,2,3},{1,2,4},{2,2,11},{5,2,7}},
									{{ 9,2,12},{10,2,7},{6,2,4},{1,2,3},{2,2,11},{5,2,8}},
									{{ 9,2,12},{10,2,8},{6,2,4},{1,2,3},{2,2,11},{5,2,7}},
																		
									{{10,2,11},{ 9,2,7},{6,2,3},{2,2,4},{1,2,12},{5,2,8}},
									{{10,2,11},{ 9,2,8},{6,2,3},{2,2,4},{1,2,12},{5,2,7}},
									{{10,2,11},{ 9,2,7},{6,2,3},{1,2,4},{2,2,12},{5,2,8}},
									{{10,2,11},{ 9,2,8},{6,2,3},{1,2,4},{2,2,12},{5,2,7}},
									
									{{10,2,11},{ 9,2,8},{6,2,4},{2,2,3},{1,2,12},{5,2,7}},
									{{10,2,11},{ 9,2,7},{6,2,4},{2,2,3},{1,2,12},{5,2,8}},
									{{10,2,11},{ 9,2,7},{6,2,4},{1,2,3},{2,2,12},{5,2,8}},
									{{10,2,11},{ 9,2,8},{6,2,4},{1,2,3},{2,2,12},{5,2,7}},								
									
									{{10,2,12},{ 9,2,7},{6,2,3},{2,2,4},{1,2,11},{5,2,8}},
									{{10,2,12},{ 9,2,8},{6,2,3},{2,2,4},{1,2,11},{5,2,7}},
									{{10,2,12},{ 9,2,8},{6,2,4},{2,2,3},{1,2,11},{5,2,7}},
									{{10,2,12},{ 9,2,7},{6,2,4},{2,2,3},{1,2,11},{5,2,8}},
									
									{{10,2,12},{ 9,2,7},{6,2,3},{1,2,4},{2,2,11},{5,2,8}},
									{{10,2,12},{ 9,2,8},{6,2,3},{1,2,4},{2,2,11},{5,2,7}},
									{{10,2,12},{ 9,2,7},{6,2,4},{1,2,3},{2,2,11},{5,2,8}},
									{{10,2,12},{ 9,2,8},{6,2,4},{1,2,3},{2,2,11},{5,2,7}},
									
								},
						},
			--			
			explode  =  {1,2,3,4,5,6,7,8,9,10,11,12}
		
	   }
