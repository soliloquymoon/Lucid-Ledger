function deck_init(){
	deck = []
	used = []
	for (var i = 0; i < array_length(all_cards); i++) {
		if (all_cards[i].requisite != "") {
			if (all_cards[i].requisite = "arm1") {
				if (cyberwares_level[0] < 1) continue
			} else if (all_cards[i].requisite = "arm2") {
				if (cyberwares_level[0] < 2) continue
			} else if (all_cards[i].requisite = "arm3") {
				if (cyberwares_level[0] < 3) continue
			} else if (all_cards[i].requisite = "arm4") {
				if (cyberwares_level[0] < 4) continue
			}
		}
		array_push(deck, all_cards[i])
		show_debug_message("card pushed")
	}
}