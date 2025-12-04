function reset(){
	scene = SCENE.TITLE
	scene_stack = [SCENE.TITLE]
	money = 2000 // Lunite
	day_counter = 1
	rounds = 1
	loan_amount = 0
	loan_due_date = -1
	deck = []
	hand = []
	used = []
	inventory = []
	inventory_tags = []
	market = []
	dream_to_remove = -1
	dream_id_counter = 0
	hand_limit = 3
	cyberwares_level = [0, 0, 0, 0]
	cyberware_accessible = 0
	deck_init()
	card_in_edit = -100
	edit_name_field = -200
	edit_desc_field = -300
	market_page = 0
	initial_replacable = 0
	
	dream_in_edit = -1
	dream_to_sell = -1
	tag_to_replace = 0
	
	current_client = 0
	player_offer = 0
	player_offer_pending = 0
	player_offer_edit = 1
	client_offer = 0
	client_offer_made = 0
	client_offer_making_timer = 0
	client_rounds = 0
	
	bubble_display = 0
	bubble_str = ""
	bubble_next = []
	bubble_name = ""
	
	popup_text = ""
	popup_title = ""
	popup_choice = -1
	popup_icon = -1
	popup_icon_index = -1
	popup_temp_value = -1
	
	dialogue_text = []
	dialogue_roles = []
	dialogue_progress = 0
	dialogue_text_progress = 0
	dialogue_text_timer = 0
	dialogue_type = 0
	
	newspaper_text = ""
	newspaper_title = ""
	
	arrow_pos = [0, 0]
	arrow_offset = 0
	arrow_move_direction = 0
	arrow_direction = 0
	
	scr_drag = 0
	
	for (var i = 0; i < 100; i++) {
		scr_value[i] = 0
		scr_dragging[i] = 0
		card_hover[i] = 0
	}
	
	tooltip_x = 0
	tooltip_y = 0
	tooltip_w = 0
	tooltip_h = 0
	tooltip_str = ""
	tooltip_display = 0
	window = 0
	
	audio_stop_all()
	bg_music = -1
	event_randomize()
}