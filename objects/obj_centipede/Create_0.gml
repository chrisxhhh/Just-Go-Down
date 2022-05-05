
TlayerID = layer_get_id("Tiles_Ground"); 
tilemapID = layer_tilemap_get_id(TlayerID); 
empty_tile = 0;

dir = random(1) <= 0.5 ? 1 : -1;

//change depend on clockwise direction

direction = dir==-1? 180 : 0;
image_xscale = dir==-1? -1 : 1;

speed = 0.5
image_angle=180

switch direction{
	case 0:
		check_x= x;
		check_y= y + 5*dir;
		check_xb = x;
		check_yb = y - 5*dir;
		break;
	case 90:
		check_x = x + 5*dir;
		check_y = y;
		check_xb = x - 5*dir;
		check_yb = y;
		break;
	case 180:
		check_x = x
		check_y = y - 5*dir
		check_xb = x;
		check_yb = y+5*dir;
		break;
	case 270:
		check_x = x - 5*dir
		check_y = y;
		check_xb = x + 5*dir;
		check_yb = y;
		break;
}


while ((tilemap_get_at_pixel(tilemapID,x,y))==empty_tile){
	y -= 1
}

