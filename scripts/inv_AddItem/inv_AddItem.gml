// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function inv_AddItem(_type){
	var indexAddedAt = -2;
	if(array_find_index(global.inventory, _type) == -1){
		indexAddedAt = array_replace_value(global.inventory, ItemType.none, _type);	
	}
	if(indexAddedAt != -1){
		global.itemDefinitions[_type,ItemProp.amount] += 1;	
	}
	//audio_play_sound(sound_collect, 0, false);
	return (indexAddedAt != -1);
}
