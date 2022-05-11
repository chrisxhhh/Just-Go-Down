function barDisplay(_x,_y,_w,_h,_pct,_bordercol,_barcol){
	_w = clamp(_w,50,1000)

	draw_set_alpha(1)
	draw_set_color(_barcol)
	draw_rectangle(_x -_w/2, _y, _x - (_w/2) + (_w*_pct), _y + _h, false)

	draw_set_color(_bordercol)
	draw_rectangle(_x - _w/2, _y, _x + _w/2, _y + _h, true)
}
