function draw_window(){
	if (window != 0) {
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
	}
}