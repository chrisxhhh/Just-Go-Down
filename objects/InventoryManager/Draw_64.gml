/// @description Insert description here
// You can write your code in this editor
//draw_clear_alpha(c_white, 0.0);
draw_sprite(spr_itemHolder,-1,700,30);

for(var itm=0; itm<23; itm++){
	itemDefIndex = global.inventory[itm];
	//itemDefIndex = 1;
	i = (itm+1) div 6;
	j = itm-6*i+1;
	//show_debug_message("i:");
	//show_debug_message(i);
	//show_debug_message("j:");
	//show_debug_message(j);
	if(itemDefIndex != ItemType.none){
		draw_sprite(global.itemDefinitions[itemDefIndex,ItemProp.sprite], -1,700+8+40*j,30+8+40*i);
		//draw_text(8+40*j+25,8+40*i+25,string(global.itemDefinitions[itemDefIndex, ItemProp.amount]));
		//draw_text_transformed(700+8+40*j+25,30+8+40*i+25,string(global.itemDefinitions[itemDefIndex, ItemProp.amount]),0.5,0.5,0);
		draw_text_transformed(700+8+40*j+25,30+8+40*i+25,string(itm+1),0.5,0.5,0);
		//show_debug_message("i:");
		//show_debug_message(i);
		//show_debug_message("j:");
		//show_debug_message(j);
	}
}
draw_sprite(global.itemDefinitions[global.inventory[23],ItemProp.sprite], -1,700+8,30+8);
