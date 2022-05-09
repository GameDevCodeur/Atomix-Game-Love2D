return {
		--
			x   = 13, -- nb de col
			y   = 12, -- nb de rows
			--
			ofx =  8, -- calage x
			ofy =  4, -- calage y
			
			-- Chonométre
			minutes = 4, secondes = 40,
			
			-- Atomes
			atomes	=	{
							{id =  1, tx = 17,  ty =  6, rx = 0, ry = 0, rspeed = 0, pts =  5 }, --  1 - OL
							{id =  2, tx = 13,  ty = 13, rx = 0, ry = 0, rspeed = 0, pts =  5 }, --  2 - OR
							{id =  6, tx = 15,  ty =  7, rx = 0, ry = 0, rspeed = 0, pts =  5 }, --  3 - OB
							{id =  6, tx = 17,  ty =  9, rx = 0, ry = 0, rspeed = 0, pts =  5 }, --  4 - OB
							{id =  5, tx = 11,  ty =  5, rx = 0, ry = 0, rspeed = 0, pts =  5 }, --  5 - OH
							{id =  5, tx = 11,  ty =  7, rx = 0, ry = 0, rspeed = 0, pts =  5 }, --  6 - OH
							{id =  4, tx = 18,  ty =  9, rx = 0, ry = 0, rspeed = 0, pts =  5 }, --  7 - C4
							{id =  4, tx = 14,  ty = 11, rx = 0, ry = 0, rspeed = 0, pts =  5 }, --  8 - C4		
							{id = 25, tx = 16,  ty = 11, rx = 0, ry = 0, rspeed = 0, pts =  5 }, --  9 - C2B
							{id = 24, tx = 17,  ty = 12, rx = 0, ry = 0, rspeed = 0, pts =  5 }, -- 10 - H2H						
						},
			
			-- Tiles
			data 	= 	{
				
							{6,6,6,6,6,5,6,6,6,6,6,6,6},
							{6,1,1,1,1,5,1,1,1,1,1,1,6},
							{6,1,1,5,1,1,1,8,1,1,5,5,5},
							{6,1,1,1,1,1,1,1,1,1,1,1,6},
							{6,6,5,5,5,5,5,5,5,1,1,1,6},
							{0,0,6,1,1,1,1,1,5,1,1,1,6},
							{0,0,6,1,1,5,1,1,1,1,1,1,6},
							{6,6,6,1,1,1,1,1,1,1,5,1,6},
							{6,1,1,1,1,5,1,1,1,1,5,1,6},
							{6,1,1,1,1,1,5,5,5,1,1,1,6},
							{6,1,1,1,1,1,1,1,5,1,1,1,6},
							{6,6,6,6,6,6,6,6,5,6,6,6,6}
							
						},
					
			-- Solution
			resolve	 =  {
							--
							x = {							
									{{2,1,5},{3,2,4},{3,1,9},{2,1,7},{7,1,9},{9,1,8},{8,1,1},{5,1,10},{10,1,6},{6,1,1}},
									{{2,1,5},{4,2,3},{4,1,9},{2,1,7},{7,1,9},{9,1,8},{8,1,1},{5,1,10},{10,1,6},{6,1,1}},
									{{2,1,5},{3,2,4},{3,1,9},{2,1,8},{8,1,9},{9,1,7},{7,1,1},{5,1,10},{10,1,6},{6,1,1}},									
									{{2,1,5},{4,2,3},{4,1,9},{2,1,8},{8,1,9},{9,1,7},{7,1,1},{5,1,10},{10,1,6},{6,1,1}},
									
									{{2,1,6},{3,2,4},{3,1,9},{2,1,7},{7,1,9},{9,1,8},{8,1,1},{6,1,10},{10,1,5},{5,1,1}},
									{{2,1,6},{4,2,3},{4,1,9},{2,1,7},{7,1,9},{9,1,8},{8,1,1},{6,1,10},{10,1,5},{5,1,1}},
									{{2,1,6},{3,2,4},{3,1,9},{2,1,8},{8,1,9},{9,1,7},{7,1,1},{6,1,10},{10,1,5},{5,1,1}},									
									{{2,1,6},{4,2,3},{4,1,9},{2,1,8},{8,1,9},{9,1,7},{7,1,1},{6,1,10},{10,1,5},{5,1,1}},
								
								},
							--
							y = {	
									{{2,1,5},{3,1,7},{7,1,5},{4,1,8},{8,1,6},{9,1,10},{1,1,10}},
									{{2,1,5},{3,1,8},{8,1,5},{4,1,7},{7,1,6},{9,1,10},{1,1,10}},
									{{2,1,5},{4,1,8},{8,1,5},{3,1,7},{7,1,6},{9,1,10},{1,1,10}},
									
									{{2,1,6},{3,1,7},{7,1,6},{4,1,8},{8,1,5},{9,1,10},{1,1,10}},
									{{2,1,6},{3,1,8},{8,1,6},{4,1,7},{7,1,5},{9,1,10},{1,1,10}},
									{{2,1,6},{4,1,7},{7,1,6},{3,1,8},{8,1,5},{9,1,10},{1,1,10}},
								},
							--
						},
			--
			explode  =  {1,2,3,4,5,6,7,8,9,10}
		--		
	   }