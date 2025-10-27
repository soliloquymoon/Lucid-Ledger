function scene_title(){
	// draw title background
	// TODO
	
	// draw title
	draw_set_color(0)
	draw_text(1366 / 2 - 100, 200, "Title")
	
	// draw start button
	if (draw_button_size(1366 / 2 - 60 , 500 , 120, 100, "Start")) scene_transition(SCENE.MAIN)
}