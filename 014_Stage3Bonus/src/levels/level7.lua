return {
		--
			x   = 13, -- nb de col
			y   = 13, -- nb de rows
			--
			ofx =  8, -- décalage x
			ofy =  4, -- décalage y
			
			-- Chonométre
			minutes = 2, secondes = 30,
			
			-- Atomes
			atomes 	=	{
							{id =  1, tx = 11,  ty =  9, rx = 0, ry = 0, rspeed = 0, pts =  5 }, -- 1 - OL
							{id	=  2, tx = 10,  ty = 13, rx = 0, ry = 0, rspeed = 0, pts =  5 }, -- 2 - OR
							{id =  3, tx = 13,  ty = 12, rx = 0, ry = 0, rspeed = 0, pts =  5 }, -- 3 - HH
							{id =  4, tx = 14,  ty =  7, rx = 0, ry = 0, rspeed = 0, pts =  5 }, -- 4 - C4
							{id =  4, tx = 16,  ty =  9, rx = 0, ry = 0, rspeed = 0, pts =  5 }, -- 5 - C4
							{id =  6, tx = 11,  ty =  5, rx = 0, ry = 0, rspeed = 0, pts =  5 }, -- 6 - OB
							{id =  6, tx = 17,  ty = 13, rx = 0, ry = 0, rspeed = 0, pts =  5 }, -- 7 - OB
							{id =  5, tx = 14,  ty = 14, rx = 0, ry = 0, rspeed = 0, pts =  5 }, -- 8 - OH
							{id =  5, tx = 12,  ty = 15, rx = 0, ry = 0, rspeed = 0, pts =  5 }, -- 9 - OH						
						},
			--
			data 	= 	{
							{13,13,13,13,13,13,13,13,13,13,13, 0, 0},{13, 1, 1, 1, 1, 1, 1, 1, 1, 1,13, 0, 0},
							{13, 1,14,14, 1, 1,14, 1, 1, 1,13, 0, 0},{13, 1, 1, 1, 1, 1, 1,14, 1, 1,13, 0, 0},
							{13, 1, 1, 1,14, 1, 1,14, 1, 1,13, 0, 0},{13, 1,14, 1,14, 1, 1,14, 1, 1,13, 0, 0},
							{13, 1, 1, 1, 1, 1, 1, 1, 1,14,13,13,13},{13,13,14,14,14, 1, 1,14, 1, 1, 1, 1,13},
							{ 0,13, 1, 1, 1, 1, 1,14, 1,14, 1, 1,13},{13,13, 1,14,14, 1, 1, 1, 1, 1, 1, 1,13},
							{13, 1, 1, 1, 1, 1, 1, 1,13,13,13,13,13},{13, 1 ,1, 1, 1, 1,14, 1,13, 0, 0, 0, 0},
							{13,13,13,13,13,13,13,13,13, 0, 0, 0, 0},
						},
					
			-- Solution
			resolve	 =  {	x = {}, y = {} },
			--
			resolveg =  {	x = {
									{{2,6,7,3,1},{2,4,5,3,1},{2,8,9,3,1}},
									{{2,7,6,3,1},{2,5,4,3,1},{2,9,8,3,1}}
								}, 
							--
							y = {
									{{6,2,8},{6,4,8},{6,4,8},{6,3,8},{6,1,8}},
									{{6,2,9},{6,4,9},{6,4,9},{6,3,9},{6,1,9}},
									{{7,2,8},{6,5,8},{6,5,8},{7,3,8},{7,1,8}},
									{{7,2,9},{6,5,9},{6,5,9},{7,3,9},{7,1,9}},
									{{6,2,8},{7,4,8},{7,4,8},{6,3,8},{6,1,8}},
									{{6,2,9},{7,4,9},{7,4,9},{6,3,9},{6,1,9}},
									{{7,2,8},{7,5,8},{7,5,8},{6,3,8},{6,1,9}},
									{{7,2,9},{7,5,9},{7,5,9},{6,3,9},{6,1,9}}
								},
						},
			--
			explode  =  {1,2,3,4,5,6,7,8,9}
		--		
	   }
