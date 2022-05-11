// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function has_wall(_x,_y){
	var rw = (_y div 32) mod 98;
	var cl = _x div 32;
	var mapNum = (_y div 32) div 98;
	if(obj_map.all_maps[mapNum]!=noone && cl>=0 && cl<98 && rw>=0 && rw<98 && obj_map.all_maps[mapNum].final[cl][rw]<=0){
		return true;
	}
	else{
		return false;
	}
}