return {
		--
			x   = 10, -- nb de col
			y   = 11, -- nb de rows
			--
			ofx =  8, -- calage x
			ofy =  4, -- calage y
			
			-- Chonométre
			minutes = 2, secondes = 10,
			--
				data = {
				
							{2,2,2,2,2,2,2,2,2,2},
							{2,1,1,1,1,1,1,1,1,2},
							{2,1,1,3,3,3,1,3,1,2},
							{2,1,1,1,1,1,1,3,1,2},
							{2,1,3,3,1,1,1,1,1,2},
							{2,1,1,1,1,1,1,3,1,2},
							{2,1,3,3,3,3,1,3,1,2},
							{2,1,1,1,1,1,1,1,1,2},
							{2,1,3,1,1,2,2,2,2,2},
							{2,1,3,1,1,2,0,0,0,0},
							{2,2,2,2,2,2,0,0,0,0},
							
						},
					
			-- Solution
			resolve	 =  {
							--
							x = {							
									{{1,1,4},{4,1,5},{5,1,7},{1,1,3},{3,1,2},{2,1,7},{1,1,6},{6,1,2}},
									{{1,1,5},{5,1,4},{4,1,7},{1,1,3},{3,1,2},{2,1,7},{1,1,6},{6,1,2}},
								},
							--
							y = {	
									{{1,1,6},{4,1,3},{3,1,6},{5,1,2},{2,1,6},{5,1,7}},
									{{1,1,6},{5,1,3},{3,1,6},{4,1,2},{2,1,6},{4,1,7}},
								},
							--
						},
			--
			explode  =  {1,2,3,4,5,6,7}
		--		
	   }