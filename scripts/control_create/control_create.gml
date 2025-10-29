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
		
		CARDEDITOR
	}
	enum EFFECT {
		TEST1,
		TEST2
	}
	scene = SCENE.TITLE
	last_scene = SCENE.TITLE
	money = 0 // Lunite
	day_counter = 1
	rounds = 1
	loan_amount = 0
	loan_due_date = -1
	deck = []
	inventory = []
	market = []
	
	card_in_edit = -100
	edit_name_field = -200
	edit_desc_field = -300
	
	scr_value[100] = 0
	scr_dragging[100] = 0
	
	current_trend = 0
	
	dream_tags()
}