function market_fill(){
	market_target_amount = 20
	while (array_length(market) < market_target_amount) {
		var new_dream = instance_create_depth(0, 0, 0, obj_dream)
		dream_randomize(new_dream)
		array_push(market, new_dream)
	}
}