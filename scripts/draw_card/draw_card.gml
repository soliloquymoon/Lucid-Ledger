function draw_card(){
	var rand = irandom_range(0, array_length(deck) - 1)
	array_push(hand, deck[rand])
	array_delete(deck, rand, 1)
}