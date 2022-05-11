// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function inv_AddItemDef(_type,_sprite,_name,_amount){
	global.itemDefinitions[_type,ItemProp.sprite] = _sprite;
	global.itemDefinitions[_type,ItemProp.name] = _name;
	global.itemDefinitions[_type,ItemProp.amount] = _amount;
}
