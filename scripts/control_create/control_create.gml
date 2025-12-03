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
		UPGRADE,
		
		CARDEDITOR
	}
	enum EFFECT {
		TEST1,
		TEST2
	}
	enum WINDOWS {
		NONE,
		POPUP,
		ARROW,
		TEXT,
		DIALOGUE
	}
	scene = SCENE.TITLE
	scene_stack = [SCENE.TITLE]
	money = 2000 // Lunite
	day_counter = 1
	rounds = 1
	loan_amount = 0
	loan_due_date = -1
	all_cards = []
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
	
	card_import_all()
	array_copy(deck, 0, all_cards, 0, array_length(all_cards))
	
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
	
	scr_value[100] = 0
	scr_dragging[100] = 0
	scr_drag = 0
	
	tooltip_x = 0
	tooltip_y = 0
	tooltip_w = 0
	tooltip_h = 0
	tooltip_str = ""
	tooltip_display = 0
	
	text_prologue = ["Welcome to your new shop, Julia. Recently inherited, slightly unstable, but definitely yours.", 
	"As long as it helps me pay rent, I’ll make it work.",
	"A reasonable goal. Before rent becomes a problem, let me show you how this place works."]
	text_prologue_role = [1, 0, 1]
	text_prologue_shown = 0
	text_newspaper = ["Your day starts with the newspaper. Yes, printed on real paper.",
	"And this helps me… how?",
	"News influences dream tag prices. Market trends shift with scandals, accidents, and corporate drama.",
	"Just check which tags are valuable today. The rest doesn’t help your rent."]
	text_newspaper_role = [1, 0, 1, 1]
	text_newspaper_shown = 0
	text_market = ["This is the Dream Market — where buying someone’s subconscious is legally acceptable… for now.",
	"So I buy a dream I can afford and start editing it?",
	"Exactly. Each dream has a base value and an initial tag. You can buy additional tags to improve its final selling price.",
	"Just don’t overspend before you’ve even earned your first rent payment."]
	text_market_role = [1, 0, 1, 1]
	text_market_shown = 0
	text_editing = ["Here is your editing station. Try not to unplug anything important — some wires are older than the city grid.",
	"And what exactly do I do here?",
	"Improve: Clarity (raises base value) and Emotion (increases chance of doubling the final price).",
	"What about Stability?",
	"Stability prevents the dream from collapsing. If it hits zero, the dream disintegrates — as does your money.",
	"As the dream grows stronger, new tag slots unlock. Use them to boost its final price."]
	text_editing_role = [1, 0, 1, 0, 1, 1]
	text_editing_shown = 0
	text_selling = ["Alright, dream edited. Time to make some cash.",
	"Indeed. Start with an asking price. Too low, and you can’t pay rent. Too high, and the customer leaves.",
	"Every customer has a max they’re willing to pay, right?",
	"Correct. If you exceed it, they’ll counteroffer sharply. If their final offer goes past their own limit, they leave.",
	"So aim high… just not ridiculous."]
	text_selling_role = [0, 1, 0, 1, 1]
	text_selling_shown = 0
	text_skill = ["If you’ve earned money, congratulations — your rent is looking slightly more payable. Now you can purchase upgrades.",
	"Cyberware upgrades, right?",
	"Yes. They improve your efficiency — processing speed, editing precision, emotional tuning, etc. No drawbacks. Just better tools for a demanding job.",
	"Finally, some good news."]
	text_skill_role = [1, 0, 1, 0]
	text_skill_shown = 0
	
	arrow_newspaper_shown = 0
	
	text_roles = ["Julia", "Alpha"]
	
	window = 0
	
	bg_music = -1
	
	config_sounds = 1
	
	check_money = 0
	
	current_event = "event_none"
	
	tags = load_tags(working_directory + "tags.json")
	events = load_events(working_directory + "events.json")
	dream_stages = dream_load_stages(working_directory + "dream.json")
	cyberwares = load_cyberwares(working_directory + "cyberware.json")
	cyberwares_max_lvl = [4, 3, 3, 1]
	
	event_randomize()
}