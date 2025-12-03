function dream_create(){
	dream_name = ""
	icon_index = 0
	tags = []
	unlocks = [1, 0, 0, 0]
	dream_value = 0
	recommended_value = 0
	stability = obj_controller.stability_init
	emotion = obj_controller.emotion_init
	clarity = obj_controller.clarity_init
	dream_id = obj_controller.dream_id_counter
	obj_controller.dream_id_counter++
}