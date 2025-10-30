function dream_value_calculate(dream){
	var value = dream.dream_value
	for (var i = 0; i < 4; i++) {
		if (dream.unlocks[i]) {
			value += rarities[dream.tags[i].rarity].base_price
			if (dream.tags[i].trend_type = current_trend) value += rarities[dream.tags[i].rarity].trend_price
		}
	}
	return value
}