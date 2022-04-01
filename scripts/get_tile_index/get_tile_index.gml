// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// getting the index of the tile we should draw at this position by checking its neighbors 
// passing in a _map struct
function get_tile_index(_map, _row, _col) {

	var tile_top = false; 
	var tile_bottom = false; 
	var tile_left = false; 
	var tile_right = false; 
	
	// check if above us is empty or is border
	if (_row == 0) { 
		tile_top = true; 
	} 
	else if (_row > 0 && _map.final[_col][_row-1] > 0) {
		tile_top = true; 
	} 
	
	// check if below us is empty or is border
	if (_row == 97) {
		tile_bottom = true; 	
	} 
	else if (_row < 97 && 0 < _map.final[_col][_row+1] ) {
		tile_bottom = true; 	
	} 
	
	// check if tile to left is empty or is border 
	if (_col == 0) {
		tile_left = true; 	
	} 
	else if (_col > 0 && 0 < _map.final[_col-1][_row]) {
		tile_left = true; 	
	} 
	
	// check if tile to the right is empty or is border
	if (_col == 97) {
		tile_right = true;
	} 
	else if (_col < 97 && 0 < _map.final[_col+1][_row]) {
		tile_right = true; 	
	} 
	
	// use special tile if all its neighbors are empty 
	if (tile_top && tile_bottom && tile_right && tile_left) {
		return 144; 
	} 
	
	if (tile_top) {
		if (tile_right) { 
			return 15; 
		} 
		else if (tile_left) {
			return 17; 
		} 
		else {
			return 16; 
		} 
	} 
	if (tile_bottom) {
		if (tile_left) { 
			return 43; 
		} 
		else if (tile_right) { 
			return 45; 
		}
		else { 
			return 44; 
		} 
	}
	if (tile_left) {
		if (tile_top) { 
			return 15; 
		} 
		else if (tile_bottom) { 
			return 43; 
		} 
		else { 
			return 29;
		} 
	} 
	if (tile_right) {
		if (tile_top) {
			return 17; 
		} 
		else if (tile_bottom) { 
			return 45; 
		} 
		else { 
			return 31; 
		} 
	} 
	
	return 155;
}