if room == rm_end {
	var _lay_id = layer_get_id("Text");
	var _map_id = layer_tilemap_get_id(_lay_id);
	
	//680 200
	//800 200
	for (var i = ds_list_size(list_depth) - 1; i >= 0; i--) {
		var _x = 680 + (ds_list_size(list_depth) - i) * 40; 
		tilemap_set_at_pixel(_map_id, ds_list_find_value(list_depth, i), _x, 200);
	}
	
	for (var i = 0; i < ds_list_size(list_level); i++) {
		var _x = 720 + (ds_list_size(list_level) - i) * 40; 
		tilemap_set_at_pixel(_map_id, ds_list_find_value(list_level, i), _x, 300);
	}
	
}

ds_list_clear(list_depth);
ds_list_clear(list_level);
