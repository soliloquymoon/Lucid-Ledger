function scene_title(){
	draw_set_color(0)
	draw_text(10, 10, "title scene")
	// draw title background
	// TODO
	
	// draw title
	draw_set_color(0)
	draw_text(1366 / 2 - 100, 200, "Title")
	
	// draw start button
	if (draw_button_size(1366 / 2 - 60 , 500 , 120, 100, "Start")) scene_transition(SCENE.MAIN)
	
	// card editor button
	if (draw_button_size(10, 768 - 100 - 10, 120, 100, "Card Maker")) scene_transition(SCENE.CARDEDITOR)
}