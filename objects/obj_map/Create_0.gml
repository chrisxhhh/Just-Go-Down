

//spawn_square = function(_map, _ground = false) {
//	instance_destroy(obj_square)
	
//	var _spacing = sprite_get_width(spr_square_white)
	
//	for (var col = 0; col < _map.width; col += 1) {
//		for (var row = 0; row < _map.height; row += 1) {
//			//show_debug_message(string(col)+" , "+string(row))
//			with(instance_create_layer(col * _spacing, row * _spacing, layer, obj_square)) {
//				if (_ground) {
//					if (row > 128 - 45 && row < 128 - 35)
//						set_color(_map.map[col][row], 75, 105);
//						//set_color(_map.map[col][row]);
//					else
//						set_color(_map.map[col][row]);
//				} else 
//					set_color(_map.map[col][row]);
//			}
//		}
//	}
//}

//global.loadCnt = -1;



spawn_square = function(_map, _ground = false) {
	instance_destroy(obj_square);
	var _spacing = sprite_get_width(spr_square_white);
	for (var col = 0; col < 98; ++col) {
		for (var row = 0; row < 98; ++row) {
			//show_debug_message(string(col)+" , "+string(row))
			with(instance_create_layer(col * _spacing, row * _spacing, layer, obj_square)) {
				if (_map.final[col][row] == 0) {
					image_blend = c_black;
				} else if (_map.final[col][row] == 1) {
					
				} else if (_map.final[col][row] == 2) {
					image_blend = c_blue;
				}
			}
		}
	}
}

spawn_wall = function(_map) {
	instance_destroy(obj_wall);
	var _spacing = sprite_get_width(spr_square_wall);
	show_debug_message(_spacing);
	for (var col = 0; col < 98; ++col) {
		for (var row = 0; row < 98; ++row) {
			//show_debug_message(string(col)+" , "+string(row))
			if (_map.final[col][row] == 0){
				instance_create_layer(col * _spacing, row * _spacing, layer, obj_wall);
			}
		}
	}
}

create_map = function(_map, _ground = false) {

    // var _spacing = sprite_get_width(spr_square_white)
    var tiles_layerID = layer_get_id("Tiles_Floor"); 
    var tilemapID = layer_tilemap_get_id(tiles_layerID);
    tilemap_clear(tilemapID, 166);  

    for (var col = 0; col < 98; col += 1) {
        for (var row = 0; row < 98; row += 1) {
			if (_map.final[col][row] == 0) {
				//var tile_ind = get_tile_index(_map, col, row);
				tilemap_set(tilemapID, 165, col, row);
			} else {
				tilemap_set(tilemapID, 166, col, row);
			}
			
			
		}
    }
}




goto_level = function(_level) {
	instance_destroy(obj_checkpoint);
	if (all_maps[_level] == noone) {
		all_maps[_level] = new cellular_automata(128, 128, 0.50, all_maps[_level - 1]);
		all_maps[_level].iterate(num_iterations);
		all_maps[_level].get_final_map();
	}
	instance_create_layer((all_maps[_level].special_x-15) * 16, (all_maps[_level].special_y-15) * 16, "Instances", obj_checkpoint);
	create_map(all_maps[_level], false);
}


ite				= 0;
ite_rdy			= true;
num_iterations	= 30;
current_level	= 0;
all_maps		= array_create(32, noone);
loadCnt = -1;
px = 0;
py = 0;
randomize();
all_maps[0] = new cellular_automata(128, 128, 0.50, all_maps[0]);
all_maps[0].iterate(num_iterations);
all_maps[0].get_final_map(true);
//spawn_square(all_maps[0], true);
spawn_wall(all_maps[0]);


