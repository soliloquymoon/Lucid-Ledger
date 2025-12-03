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
	cyberwares_unlocked = []
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
	dialogue_progress = 0
	dialogue_text_progress = 0
	dialogue_text_timer = 0
	dialogue_type = 0
	
	scr_value[100] = 0
	scr_dragging[100] = 0
	scr_drag = 0
	
	tooltip_x = 0
	tooltip_y = 0
	tooltip_w = 0
	tooltip_h = 0
	tooltip_str = ""
	tooltip_display = 0
	
	text_prologue = ["In the near future, corporations have claimed every resource worth owning.", 
	"Technology and wealth have pooled into the hands of the top ten percent, while humanity’s scientific achievements stretch beyond the Solar System and into deeper, stranger frontiers.",
	"And yet, far below those shining cities, countless people still live in the shadowed sprawl of the megastructures — places where the sun never reaches and hope rarely lingers.",
	"However, none of that is your concern.",
	"You are a dream editor, a programmer of illusions and emotions, skilled in the craft of shaping temporary escapes. For the wealthy, dreams are entertainment. For the desperate, they are refuge."]
	text_prologue_shown = 0
	text_newspaper = ["Old-school, huh? Still have no idea why anyone prints newspapers nowadays.",
	"But have to admit that reading one with my morning coffee feels weirdly classy.",
	"Anyway, you are not here for politics. But these events? They do change the market value of certain dream tags. And that part is absolutely my business.",
	"But don’t worry, the effects are only temporary, because the free market will fix it."]
	text_newspaper_shown = 0
	text_market = ["Welcome to the Dream Market, the only place where buying someone else’s subconscious isn’t considered a crime… yet.",
	"Here you can buy dreams with base value and an initial tag. You can also buy some supplement tags. Don’t know how to choose? Just buy one that you can afford and don’t get bankrupt."]
	text_market_shown = 0
	text_editing = ["Welcome to your workplace. Don’t mind the clutter, you’ll get used to it.",
	"Your objective is simple: use your strategy to raise the dream’s Clarity and Emotion.",
	"The clarity will raise the base value of the dream while the emotion will raise the possibility that the final price will double. The tag slots will be unlocked when the dream stats over the certain threshold.",
	"And be aware of the Stability, the dream will collapse when it hits zero."]
	text_editing_shown = 0
	text_selling = ["Negotiation is an art, but not everyone is an artist. Let’s start by suggesting a price based on the dream’s value and the tags you’ve added.",
	"From there, you’ll negotiate with your customer.",
	"Be aware that every customer has a maximum price they’re willing to accept. If your offer goes above that limit, they’ll push back by raising their counteroffer depending on the gap between your price and theirs.",
	"But be careful. If their final offer strays outside the maximum price, they’ll walk away from the deal entirely.",
	"So, aim high, but don’t set your price too high."]
	text_selling_shown = 0
	text_skill = ["Now it’s time to upgrade! Use the money you earned to buy cyberwares that can boost your work.",
	"But don’t rely on them too much or they will destroy your mind.",
	"Anyway, good luck with your journey!"]
	text_skill_shown = 0
	
	window = 0
	
	current_event = "event_none"
	
	tags = load_tags(working_directory + "tags.json")
	events = load_events(working_directory + "events.json")
	dream_stages = dream_load_stages(working_directory + "dream.json")
	cyberwares = load_cyberwares(working_directory + "cyberware.json")
	
	event_randomize()
}