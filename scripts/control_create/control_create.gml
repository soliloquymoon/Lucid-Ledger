function control_create(){
	widget_set_owner(string(int64(window_handle())))
	
	randomize()
	
	enum SCENE {
		TITLE,
		MARKET,
		EDIT,
		SELL,
		MAIN,
		INVENTORY,
		SETTINGS,
		SELL_INNER,
		
		CARDEDITOR
	}
	enum EFFECT {
		TEST1,
		TEST2
	}
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
	market = []
	dream_to_remove = -1
	dream_id_counter = 0
	
	card_import_all()
	
	card_in_edit = -100
	edit_name_field = -200
	edit_desc_field = -300
	
	dream_in_edit = -1
	dream_to_sell = -1
	
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
	
	scr_value[100] = 0
	scr_dragging[100] = 0
	scr_drag = 0
	
	tooltip_x = 0
	tooltip_y = 0
	tooltip_w = 0
	tooltip_h = 0
	tooltip_str = ""
	tooltip_display = 0
	
	current_event = "event_none"
	
	tags = load_tags(working_directory + "tags.json")
	events = load_events(working_directory + "events.json")
}