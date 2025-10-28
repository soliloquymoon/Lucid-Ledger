function scene_title(){
	draw_set_color(0)
	//draw_text(10, 10, "title scene")
	// draw title background
	// TODO
	
	// draw title
	draw_set_color(0)
	draw_text(1366 / 2 - 100, 200, "Title")
	
	// draw start button
	draw_set_font(Font2)
	if (draw_button_size(942, 300, 357, 75, "Start")) scene_transition(SCENE.MAIN)
	
	// draw settings button
	if (draw_button_size(942, 424, 357, 75, "Options")) show_debug_message("options")
	
	// card editor button
	if (draw_button_size(942, 547, 357, 75, "Card Maker")) {
		scene_transition(SCENE.CARDEDITOR)
	}
	draw_set_font(Font1)
}