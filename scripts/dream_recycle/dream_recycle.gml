function dream_recycle(dream){
	for (var i = 0; i < array_length(dream.tags); i++) {
		if (dream.unlocks[i]) array_push(inventory_tags, dream.tags[i])
	}
	schedule_dream_removal(dream)
	for (var i = 0; i < array_length(inventory); i++) {
		if (inventory[i].dream_id = dream.dream_id) {
			array_delete(inventory, i, 1)
			break
		}
	}
}