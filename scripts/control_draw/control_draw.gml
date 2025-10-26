function control_draw(){
	draw_set_font(Font1)
	draw_set_color(c_white)
	//draw_text(10, 10, "Hello World!")
	
	switch(scene) {
		case SCENE.TITLE:
			scene_title()
			break
		case SCENE.MARKET:
			scene_market()
			break
		case SCENE.EDIT:
			scene_edit()
			break
		case SCENE.SELL:
			scene_sell()
			break
	}
}