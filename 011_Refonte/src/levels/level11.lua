return {
		--
			x   = 13, -- nb de col
			y   = 13, -- nb de rows
			--
			ofx =  8, -- calage x
			ofy =  3, -- calage y
			
			-- Chonométre
			minutes = 1, secondes = 30,
			--
				data = {
				
							{ 0, 0, 0, 0, 0, 0, 0, 0, 0,14,14,14,14},
							{14,14,14,14,14,14, 0,14,14,14, 1, 1,14},
							{14, 1, 1, 1, 1,14, 0,14, 1, 1, 1, 1,14},
							{14, 1, 1, 1, 1,14,14,14, 1, 1,18, 1,14},
							{14, 1,18,18, 1, 1, 1, 1, 1, 1, 1, 1,14},
							{14, 1, 1, 1, 1, 1, 1, 1, 1,18,18,18,18},
							{18,18,18,18, 1, 1,18,18, 1, 1, 1, 1,14},
							{14, 1, 1, 1, 1, 1, 1, 1, 1, 1,18, 1,14},
							{18,18, 1, 1,18, 1,18, 1, 1,18, 1,18,18},
							{14, 1, 1, 1,18, 1, 1, 1, 1, 1, 1, 1,14},
							{18,18, 1, 1, 1, 1, 1, 1,18, 1,18, 1,14},
							{14, 1, 1, 1, 1, 1,18, 1,18, 1, 1, 1,14},
							{14,14,14,14,14,14,18,14,18,14,14,14,14}
							
						},
					
			-- Solution
			resolve	 =  {
							--
							x = {							
									{{2,1,5},{5,1,3},{3,1,1},{2,3,1},{1,-2,5}},
																	
								},
							--
							y = {	
									{{2,-1,4},{4,1,5},{3,-1,4},{1,-1,4}}
								},
							--
						},
			--
			explode  =  {1,2,3,4,5}
		--		
	   }
