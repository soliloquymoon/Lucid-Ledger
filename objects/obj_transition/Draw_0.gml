draw_set_alpha(alpha)
draw_rectangle_color(0, 0, 1366, 768, 0, 0, 0, 0, 0)
draw_set_alpha(1)

if (phase = 0) {
	alpha += 0.05
	if (alpha > 1) {
		alpha = 1
		phase = 1
		obj_controller.scene = scene_to
	}
} else {
	alpha -= 0.05
	if (alpha < 0) {
		alpha = 0
		instance_destroy(self)
	}
}