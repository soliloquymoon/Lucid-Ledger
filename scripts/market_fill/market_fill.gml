function market_fill(refill = 0){
	market_target_amount = 20
	if (refill) {
		for (var i = 0; i < array_length(market); i++) {
			instance_destroy(market[i])
		}
		market = []
	}
	while (array_length(market) < market_target_amount) {
		var new_dream = instance_create_depth(0, 0, 0, obj_dream)
		dream_randomize(new_dream)
		array_push(market, new_dream)
	}
}