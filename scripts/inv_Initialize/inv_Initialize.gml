// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function inv_Initialize(){
	for(var i=5; i>=0; i--){
		global.inventory[i] = ItemType.none;
	}
}
