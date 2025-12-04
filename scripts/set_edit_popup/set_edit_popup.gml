function set_edit_popup(xx, yy, type, str){
	var obj = instance_create_depth(0, 0, -1, obj_edit_popup)
	obj.xx = xx
	obj.yy = yy
	obj.atype = type
	obj.str = str
}