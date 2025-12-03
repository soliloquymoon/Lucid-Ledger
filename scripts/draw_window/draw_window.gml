function draw_window(){
	if (window != 0 && window != WINDOWS.ARROW) {
		draw_set_alpha(0.5)
		draw_set_color(0)
		draw_rectangle(0, 0, 1366, 768, 0)
		draw_set_alpha(1)
	}
	switch (window) {
		case WINDOWS.POPUP: 
			window_popup()
			break
		case WINDOWS.TEXT:
			window_text()
			break
		case WINDOWS.DIALOGUE:
			window_dialogue()
			break
			break
		case WINDOWS.ARROW:
			window_arrow()
			break
		case WINDOWS.TEXT + WINDOWS.DIALOGUE:
			window_text()
			window_dialogue()
			break
	}
}