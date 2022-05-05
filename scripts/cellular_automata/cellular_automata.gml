// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function cellular_automata(_width, _height, _spawn_chance, _prev = noone) constructor {
	
	width		= _width;
	height		= _height;
	special_x	= irandom_range(23, 103);
	special_y	= irandom_range(43, 83);
	prev		= _prev;
	
	show_debug_message("starting celluar_automata: " + string(current_time))
	//create initial grid in a nested array with initial value 0
	map = array_create(width, 0);
	for (var i = 0; i < width; ++i) {
		map[i] = array_create(height, 0);
	}
	
	new_map = array_create(width, 0);
	for (var i = 0; i < width; ++i) {
		new_map[i] = array_create(height, 0);
	}
	
	//create a 2d array to save initial state
	initial = array_create(width, 0);
	for (var i = 0; i < width; ++i) {
		initial[i] = array_create(height, 0);
	}
	
	final = array_create(98, 0);
	for (var i = 0; i < 98; ++i) {
		//initial[i] = array_create(98, 0);
		final[i] = array_create(98, 0);
	}
	show_debug_message("created four arrays: " + string(current_time))
	
	//First room generation
	if (_prev == noone) {
		for (var col = width - 5; col >= 5; --col) {
			for (var row = height - 5; row >= 5; --row) {
				if row < 80
					map[col][row] = 70;
				else
					map[col][row] = random(1) <= _spawn_chance ? 60 : 10;
				initial[col][row] = map[col][row];
			}
		}
	}
	
	//Later room generation
	else {
		
		//copy the initial state of bottom 32 rows of old map to top 32 rows of new map
		for (var col = width - 5; col >= 5; --col) {
			for (var row = 37; row >= 5; --row) {
				map[col][row] = prev.initial[col][width - row];
				initial[col][row] = map[col][row];
			}
		}
		
		//randomize the rest of map
		for (var col = width - 5; col >= 5; --col) {
			for (var row = height - 5; row >= 38; --row) {
				map[col][row] = random(1) <= _spawn_chance ? 60 : 10;
				initial[col][row] = map[col][row];
			}
		}
	
		//save speical room
		for (var col = special_x - 5; col < special_x + 5; ++col) {
			for (var row = special_y - 5; row < special_y + 5; ++row) {
				map[col][row] = 70;
			}
		}
		
	}
	show_debug_message("copied previous map: " + string(current_time))
	
	//covert to binary map
	//1 is empty, 0 is solid
	static get_final_map = function(_ground = false) {
		for (var row = 0; row < 98; row++) {
			var empty_land_count = 0
			var empty_land_reverse_count = 0
			for (var col = 0; col < 98; col++) {
				if (_ground) {
					
					if (row <= 78 and prev==noone) {
						final[col][row] = 1;	
					}
					//else if (row > 78 && row < 88) {
					//	if (map[col + 15][row + 15] <= 105 && map[col + 15][row + 15] > 75) {
					//		//empty
					//		final[col][row] = 1;
					//	} else {
					//		//solid
					//		final[col][row] = 0;
					//	}
					//} 
					else {
						if (map[col + 15][row + 15] <= 115 && map[col + 15][row + 15] > 65) {
							//empty
							final[col][row] = 1;
						} else {
							//solid
							final[col][row] = 0;
						}
					}
				
				} else {
					if (map[col + 15][row + 15] < 93 && map[col + 15][row + 15] > 87) {
						// val between 87 and 93, 20% torch, 80% empty
						final[col][row] = random(1) <= 0.2 ? 2 : 1;
						empty_land_count = 0
						empty_land_reverse_count = 0
					} else if (map[col + 15][row + 15] <= 115 && map[col + 15][row + 15] > 65) {
						//empty
						final[col][row] = 1;
						empty_land_count = 0
						if row!= 0 and final[col][row-1] == 0{
							empty_land_reverse_count += 1
							if empty_land_reverse_count == 4{
								final[col][row] = 4 //obj_centipede
								empty_land_reverse_count = 0
							}
						}
					}
					else if (map[col + 15][row + 15] >= 165 || map[col + 15][row + 15] < 20) {
						final[col][row] = -1;
					}
					else {
						//solid
						final[col][row] = 0;
						empty_land_reverse_count = 0
						if row!= 0 and final[col][row-1] == 1{
							empty_land_count += 1
							if empty_land_count == 4{
								final[col][row-1] = 3
								empty_land_count = 0
							}
						}
					}
					if (map[col + 15][row + 15] >= 180 || map[col + 15][row + 15] < 20) {
						final[col][row] = -2;
					}
				
				}
				if (col == 0 || col == 97) {
					final[col][row] = 0;
				}
			}
		}
	}
	
	
	#region iteration 16 line per frame
	static iterate_line = function(_num = 1,_line) {
		repeat(_num){

			for (var line = _line; line < _line+16; ++line){
				
				for (var row = 0; row < height; ++row) {
					//show_debug_message("line:" + string(row))
					//check neighbors
					var _col_dif, _row_dif, _count;
					_count = 0
					for(var col_offset = -1; col_offset < 2; ++col_offset) {
						for(var row_offset = -1; row_offset < 2; ++row_offset) {
							//this two value find the position of the neighbor
							_col_dif = line + col_offset;
							_row_dif = row + row_offset;
							if not (_col_dif < 0 || _col_dif >= width || _row_dif < 0 || _row_dif >= height) {
								// sum neighbor values including self
								
								_count += map[_col_dif][_row_dif];
							} 	
						}
					}
					var _self = map[line][row];
					
					//avg value of neighbors and remove self
					_count = (_count - _self)/8;
					
					//apply rules to each cell
					//can be tested and changed later
					if (_count < 40) {
						//if average < 40, self approaches to average
						new_map[line][row] = _self + (random(_count - _self));
					} else if (_self > _count) {
						//if self > average, self +- random(10)
						new_map[line][row] = _self + (random_range(-10, 10));
					} else {
						//if self < average and count > 40, self + random(average/5)
						new_map[line][row] = _self + (random(_count/5));
					}			
				
				}
			}
			
			//replace the old map with the new generation
			if line == 112{
				map = new_map
				
			}
			
			
			
			
		}
	}
	#endregion
	
	//creating special empty room
	static create_room= function(){
			
		for (var col = special_x - 10; col < special_x + 10; ++col) {
			for (var row = special_y - 10; row < special_y + 10; ++row) {
				if map[col][row] >= 110 map[col][row] = 110;
				//clamp(_new_map[col][row],0, 110)
			}
		}
		
			
	}
	
	#region iteration as whole
	//where PCG actually happen
	//this function will repeat _num times
	static iterate = function(_num = 1) {
		repeat(_num){

			//create next generation map
			var _new_map = array_create(width, 0);
			for (var i = 0; i < width; ++i) {
				_new_map[i] = array_create(height, 0);	
			}
			
			#region legacy genrating algo
			/*
			//show_debug_message("1")
			//pcg!!
			for(var col = 0; col < width; ++col) {
				for (var row = 0; row < height; ++row) {
					//check neighbors
					var _col_dif, _row_dif, _count;
					_count = 0
					for(var col_offset = -1; col_offset < 2; ++col_offset) {
						for(var row_offset = -1; row_offset < 2; ++row_offset) {
							//this two value find the position of the neighbor
							_col_dif = col + col_offset;
							_row_dif = row + row_offset;
							if (_col_dif < 0 || _col_dif >= width || _row_dif < 0 || _row_dif >= height) {
								//out of boundary, dont check
								continue;
							} else if (col_offset == 0 && row_offset == 0) {
								//checking self
								continue;
							} else {
								_count += map[_col_dif][_row_dif];
							}
						}
					}
					//avg value of neighbors
					_count /= 8;
					var _self = map[col][row];
					//apply rules to each cell
					//can be tested and changed later
					if (_count < 40) {
						//if average < 40, self approaches to average
						_new_map[col][row] = _self + (random(_count - _self));
					} else if (_self > _count) {
						//if self > average, self +- random(10)
						_new_map[col][row] = _self + (random_range(-10, 10));
					} else {
						//if self < average and count > 40, self + random(average/5)
						_new_map[col][row] = _self + (random(_count/5));
					}
					
				}
			}
			*/
			#endregion
			
			for(var col = 0; col < width; ++col) {
				for (var row = 0; row < height; ++row) {
					//check neighbors
					var _col_dif, _row_dif, _count;
					_count = 0
					for(var col_offset = -1; col_offset < 2; ++col_offset) {
						for(var row_offset = -1; row_offset < 2; ++row_offset) {
							//this two value find the position of the neighbor
							_col_dif = col + col_offset;
							_row_dif = row + row_offset;
							if not (_col_dif < 0 || _col_dif >= width || _row_dif < 0 || _row_dif >= height) {
								// sum neighbor values including self
								_count += map[_col_dif][_row_dif];
							} 
							
						}
					}
					var _self = map[col][row];
					
					//avg value of neighbors and remove self
					_count = (_count - _self)/8;
					
					//apply rules to each cell
					//can be tested and changed later
					if (_count < 40) {
						//if average < 40, self approaches to average
						_new_map[col][row] = _self + (random(_count - _self));
					} else if (_self > _count) {
						//if self > average, self +- random(10)
						_new_map[col][row] = _self + (random_range(-10, 10));
					} else {
						//if self < average and count > 40, self + random(average/5)
						_new_map[col][row] = _self + (random(_count/5));
					}			
				}
			}
			
			//creating special empty room
			if (prev == noone) {
				for (var col = width - 5; col >= 5; --col) {
					for (var row = width - 45; row >= 5; --row) {
						if _new_map[col][row] >= 110 _new_map[col][row] = 110;
						//clamp(_new_map[col][row],0, 110)
					}
				}
			} else {
				for (var col = special_x - 10; col < special_x + 10; ++col) {
					for (var row = special_y - 10; row < special_y + 10; ++row) {
						if _new_map[col][row] >= 110 _new_map[col][row] = 110;
						//clamp(_new_map[col][row],0, 110)
					}
				}
			}
			
			
			
			//replace the old map with the new generation
			map = _new_map;
			
		}
	}
	#endregion
	
}