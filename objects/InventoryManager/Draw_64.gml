/// @description Insert description here
// You can write your code in this editor
//draw_clear_alpha(c_white, 0.0);
draw_sprite(spr_itemHolder,-1,650,50);

for (var itm = 0; itm < 6; itm++) {
	itemDefIndex = global.inventory[itm];
	//itemDefIndex = 1;
	i = (itm+1) div 7;
	j = itm-7*i+1;
	//show_debug_message("i:");
	//show_debug_message(i);
	//show_debug_message("j:");
	//show_debug_message(j);
	if(itemDefIndex != ItemType.none){
		draw_sprite(global.itemDefinitions[itemDefIndex,ItemProp.sprite], -1,650+8+40*j,50+8+40*i);
		//draw_text(8+40*j+25,8+40*i+25,string(global.itemDefinitions[itemDefIndex, ItemProp.amount]));
		//draw_text_transformed(700+8+40*j+25,30+8+40*i+25,string(global.itemDefinitions[itemDefIndex, ItemProp.amount]),0.5,0.5,0);
		draw_text_transformed(650+8+40*j+25,50+8+40*i+25,string(global.itemDefinitions[itemDefIndex, ItemProp.amount]),0.5,0.5,0);
		draw_text_transformed(650+8+40*j+13,50+8+40*i+45,string(itm+1),1,1,0);
		//show_debug_message("i:");
		//show_debug_message(i);
		//show_debug_message("j:");
		//show_debug_message(j);
	}
}
draw_sprite(global.itemDefinitions[global.inventory[6],ItemProp.sprite], -1,650+8,50+8);
