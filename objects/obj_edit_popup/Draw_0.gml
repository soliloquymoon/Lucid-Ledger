draw_set_alpha(alpha)
draw_sprite(spr_popsout, atype, xx, yy)
draw_set_font(Font2)
draw_set_color(colors[(atype div 3 != 0)])
draw_text(xx + 118, yy + 28, str)
draw_set_alpha(1)

alpha -= 0.025
yy -= 1
if (alpha < 0) {
	alpha = 0
	instance_destroy(self)
}