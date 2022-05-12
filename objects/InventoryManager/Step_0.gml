/// @description Insert description here
// You can write your code in this editor
for(var i=1;i<10;i++){
	if(keyboard_check_pressed(ord(string(i)))){
		var _itemType = global.inventory[i-1];
		if((_itemType == ItemType.shovel)||(_itemType == ItemType.gun)||(_itemType == ItemType.laser)||(_itemType == ItemType.gun0)){
			//global.inventory[i-1] = global.inventory[23];
			global.inventory[5] = _itemType;
		}
	}
}
