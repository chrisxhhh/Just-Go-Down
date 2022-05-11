// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function inv_RemoveItem(_type){
	var _indexOfGiven = array_find_index(global.inventory, _type);
	if(_indexOfGiven != -1){
		global.itemDefinitions[_type, ItemProp.amount] -= 1;
		if(global.itemDefinitions[_type, ItemProp.amount] <= 0){
			global.inventory[_indexOfGiven] = ItemType.none;	
		}
	}
}
