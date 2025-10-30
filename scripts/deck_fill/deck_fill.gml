function deck_fill(){
	array_copy(deck, array_length(deck), used, 0, array_length(used))
	used = []
}