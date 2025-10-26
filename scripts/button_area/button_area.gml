function button_area(xx, yy, w, h){
	return (mouse_rectangle(xx, yy, w, h) && mouse_check_button_released(mb_left))
}