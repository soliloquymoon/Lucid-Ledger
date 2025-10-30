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
	
	scr_value[100] = 0
	scr_dragging[100] = 0
	scr_drag = 0
	
	tooltip_x = 0
	tooltip_y = 0
	tooltip_w = 0
	tooltip_h = 0
	tooltip_str = ""
	tooltip_display = 0
	
	current_trend = 0
	
	trend_types = [
		"Lucid Wave",
		"Emotive Bloom",
		"Synthetic Mirage",
		"Somnium Decay"
	]
	rarities = [
		{ rarity_name: "Common", base_price: 100, trend_price: 50 },
		{ rarity_name: "Rare", base_price: 300, trend_price: 150 },
		{ rarity_name: "Epic", base_price: 700, trend_price: 350 },
		{ rarity_name: "Legendary", base_price: 1500, trend_price: 800 }
	]
	tags = [
		{ tag_name: "Awakening", trend_type: 0, rarity: 1 },
		{ tag_name: "Lucid Veil", trend_type: 0, rarity: 2 },
		{ tag_name: "Mindwalk", trend_type: 0, rarity: 3 },
		{ tag_name: "Echo Focus", trend_type: 0, rarity: 0 },
		{ tag_name: "Zen Fracture", trend_type: 0, rarity: 2 },
		{ tag_name: "Astral Thread", trend_type: 0, rarity: 3 },
		{ tag_name: "Inner Horizon", trend_type: 0, rarity: 1 },
		{ tag_name: "Glass Thought", trend_type: 0, rarity: 1 },
		{ tag_name: "Revelation Loop", trend_type: 0, rarity: 2 },
		{ tag_name: "Third Eye", trend_type: 0, rarity: 3 },
		{ tag_name: "Clarity Pulse", trend_type: 0, rarity: 0 },
		{ tag_name: "Heavenline", trend_type: 0, rarity: 1 },
		{ tag_name: "Memory Stitch", trend_type: 1, rarity: 0 },
		{ tag_name: "Velvet Heart", trend_type: 1, rarity: 2 },
		{ tag_name: "Nostalgia Bloom", trend_type: 1, rarity: 3 },
		{ tag_name: "Lover’s Echo", trend_type: 1, rarity: 2 },
		{ tag_name: "Wistful Dawn", trend_type: 1, rarity: 1 },
		{ tag_name: "Childhood Light", trend_type: 1, rarity: 0 },
		{ tag_name: "Golden Tear", trend_type: 1, rarity: 2 },
		{ tag_name: "Tender Pulse", trend_type: 1, rarity: 0 },
		{ tag_name: "Dream of Holding", trend_type: 1, rarity: 1 },
		{ tag_name: "Petal Archive", trend_type: 1, rarity: 2 },
		{ tag_name: "Soft Hour", trend_type: 1, rarity: 0 },
		{ tag_name: "Memory Lantern", trend_type: 1, rarity: 3 },
		{ tag_name: "Digital Vein", trend_type: 2, rarity: 1 },
		{ tag_name: "Glitch Bloom", trend_type: 2, rarity: 2 },
		{ tag_name: "Neon Pulse", trend_type: 2, rarity: 0 },
		{ tag_name: "Machine Halo", trend_type: 2, rarity: 3 },
		{ tag_name: "Fractal Wave", trend_type: 2, rarity: 2 },
		{ tag_name: "Data Orchid", trend_type: 2, rarity: 1 },
		{ tag_name: "Mirror Syntax", trend_type: 2, rarity: 0 },
		{ tag_name: "Cyber Veil", trend_type: 2, rarity: 2 },
		{ tag_name: "Plastic Sky", trend_type: 2, rarity: 1 },
		{ tag_name: "Electric Bloom", trend_type: 2, rarity: 2 },
		{ tag_name: "Synthetic Halo", trend_type: 2, rarity: 3 },
		{ tag_name: "Quantum Lull", trend_type: 2, rarity: 3 },
		{ tag_name: "Bitstream Dream", trend_type: 2, rarity: 1 },
		{ tag_name: "Silent Decay", trend_type: 3, rarity: 0 },
		{ tag_name: "Rusted Halo", trend_type: 3, rarity: 1 },
		{ tag_name: "Void Song", trend_type: 3, rarity: 2 },
		{ tag_name: "Forgotten Path", trend_type: 3, rarity: 1 },
		{ tag_name: "Obsidian Petal", trend_type: 3, rarity: 2 },
		{ tag_name: "Cemetery Cloud", trend_type: 3, rarity: 3 },
		{ tag_name: "Dustfall", trend_type: 3, rarity: 0 },
		{ tag_name: "Hollow Gate", trend_type: 3, rarity: 2 },
		{ tag_name: "Echo Tomb", trend_type: 3, rarity: 1 },
		{ tag_name: "Glass Coffin", trend_type: 3, rarity: 3 },
		{ tag_name: "Midnight Rust", trend_type: 3, rarity: 2 },
		{ tag_name: "Black Lace", trend_type: 3, rarity: 1 },
		{ tag_name: "Moon Residue", trend_type: 3, rarity: 0 },
		{ tag_name: "Neural Thread", trend_type: 0, rarity: 1 },
		{ tag_name: "Soul Algorithm", trend_type: 0, rarity: 2 },
		{ tag_name: "Celestial Focus", trend_type: 0, rarity: 3 },
		{ tag_name: "Meditation Loop", trend_type: 0, rarity: 1 },
		{ tag_name: "Fracture Bloom", trend_type: 0, rarity: 2 },
		{ tag_name: "Illumina", trend_type: 0, rarity: 3 },
		{ tag_name: "Reminiscence", trend_type: 1, rarity: 1 },
		{ tag_name: "Affection Echo", trend_type: 1, rarity: 2 },
		{ tag_name: "Kiss of Dust", trend_type: 1, rarity: 3 },
		{ tag_name: "Paper Memory", trend_type: 1, rarity: 0 },
		{ tag_name: "Warm Rain", trend_type: 1, rarity: 1 },
		{ tag_name: "Sepia Frame", trend_type: 1, rarity: 0 },
		{ tag_name: "Broken Clock", trend_type: 1, rarity: 2 },
		{ tag_name: "Heart Residue", trend_type: 1, rarity: 1 },
		{ tag_name: "Nerve Bloom", trend_type: 2, rarity: 1 },
		{ tag_name: "Laser Mirage", trend_type: 2, rarity: 2 },
		{ tag_name: "Chromatic Core", trend_type: 2, rarity: 3 },
		{ tag_name: "Pixel Dust", trend_type: 2, rarity: 0 },
		{ tag_name: "Neon Lattice", trend_type: 2, rarity: 2 },
		{ tag_name: "Coded Vein", trend_type: 2, rarity: 1 },
		{ tag_name: "Circuit Halo", trend_type: 2, rarity: 3 },
		{ tag_name: "Hologram Tide", trend_type: 2, rarity: 2 },
		{ tag_name: "Vapor Path", trend_type: 2, rarity: 0 },
		{ tag_name: "Silver Glitch", trend_type: 2, rarity: 1 },
		{ tag_name: "Mournlight", trend_type: 3, rarity: 2 },
		{ tag_name: "Gravepetal", trend_type: 3, rarity: 3 },
		{ tag_name: "Lament Bloom", trend_type: 3, rarity: 1 },
		{ tag_name: "Ashen Coil", trend_type: 3, rarity: 2 },
		{ tag_name: "Weeping Wire", trend_type: 3, rarity: 3 },
		{ tag_name: "Night Residue", trend_type: 3, rarity: 0 },
		{ tag_name: "Pale Orbit", trend_type: 3, rarity: 1 },
		{ tag_name: "Chasm Vein", trend_type: 3, rarity: 2 },
		{ tag_name: "Eclipse Thread", trend_type: 3, rarity: 3 },
		{ tag_name: "Wraith Logic", trend_type: 3, rarity: 1 },
		{ tag_name: "Silence Loop", trend_type: 3, rarity: 0 },
		{ tag_name: "Echo Bloom", trend_type: 0, rarity: 1 },
		{ tag_name: "Soul Ascend", trend_type: 0, rarity: 2 },
		{ tag_name: "Light Fracture", trend_type: 0, rarity: 3 },
		{ tag_name: "Clarity Spiral", trend_type: 0, rarity: 1 },
		{ tag_name: "Vision Tide", trend_type: 0, rarity: 2 },
		{ tag_name: "Inner Flame", trend_type: 0, rarity: 0 },
		{ tag_name: "Serenity Gate", trend_type: 0, rarity: 2 },
		{ tag_name: "Harmonic Dream", trend_type: 0, rarity: 3 },
		{ tag_name: "Glass Eden", trend_type: 1, rarity: 1 },
		{ tag_name: "Crimson Heart", trend_type: 1, rarity: 2 },
		{ tag_name: "Velvet Trace", trend_type: 1, rarity: 3 },
		{ tag_name: "Petal Signal", trend_type: 1, rarity: 0 },
		{ tag_name: "Starlit Memory", trend_type: 1, rarity: 2 },
		{ tag_name: "Lullaby Loop", trend_type: 1, rarity: 1 },
		{ tag_name: "Lost Embrace", trend_type: 1, rarity: 3 }
	]
	tags_rarity = [[], [], [], []]
	for (var i = 0; i < array_length(tags); i++) {
		array_push(tags_rarity[tags[i].rarity], tags[i])
	}
}