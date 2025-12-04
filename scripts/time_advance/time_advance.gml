function time_advance(){
	rounds++
	if (rounds > 4) {
		rounds = 0
		day_counter++
		event_randomize()
	}
}