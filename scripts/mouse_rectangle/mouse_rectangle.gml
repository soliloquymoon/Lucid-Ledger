function mouse_rectangle(xx, yy, w, h){
	return (mouse_x >= xx && mouse_x < xx + w && mouse_y >= yy && mouse_y < yy + h)
}