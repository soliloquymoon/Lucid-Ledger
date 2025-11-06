function dream_value_calculate(dream){
	var value = dream.dream_value * (1 + dream.clarity / 100) * (1 + (irandom_range(1, 100) <= dream.emotion))
	for (var i = 0; i < 4; i++) {
		if (dream.unlocks[i]) {
			var tag_price = dream.tags[i].base_value
			var curr_event = get_event(current_event)
			if (curr_event != -1) {
				var effects = variable_struct_get_names(curr_event.effects)
				for (var j = 0; j < array_length(effects); j++) {
					if (effects[j] == dream.tags[i].tag_name) tag_price *= variable_struct_get(curr_event.effects, effects[j])
				}
			}
			show_debug_message(dream.tags[i])
			value += tag_price
		}
	}
	return floor(value + 0.5)
}