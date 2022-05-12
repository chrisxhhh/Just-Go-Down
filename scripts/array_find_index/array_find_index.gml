// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function array_find_index(_arr, _val){
	for(var _g=0; _g<6; _g++){
		if(_arr[_g]==_val){
			return _g;	
		}
	}
	return -1;
}
