function control_draw(){
	draw_set_font(Font1)
	draw_clear(c_ltgrey) // bg color
	draw_set_color(0)
	//draw_text(10, 10, "Hello World!")
	
	switch(scene) {
		case SCENE.TITLE:
			scene_title()
			break
		case SCENE.MAIN:
			scene_main()
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
			
		case SCENE.CARDEDITOR:
			scene_card_editor()
			break
	}
}