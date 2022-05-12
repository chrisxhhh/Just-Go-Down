// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function inv_DeclareItemDefinitions(){
	//global.inventory[24] = ItemType.none;
	global.itemDefinitions[ItemType.length, ItemProp.length] = noone;
	inv_AddItemDef(ItemType.none,sEmpty,"",0);
	
	inv_AddItemDef(ItemType.shovel,spri_shovel,"shovel",0);
	inv_AddItemDef(ItemType.gun,spri_gun,"gun",0);
	inv_AddItemDef(ItemType.laser,spri_laser,"laser",0);
	inv_AddItemDef(ItemType.gun0,spri_gun0,"gun0",0);
	inv_AddItemDef(ItemType.gem,spri_gem,"gem",0);
	inv_AddItemDef(ItemType.gold,spri_gold,"gold",0);
}
