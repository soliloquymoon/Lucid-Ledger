function event_randomize(){
	current_event = events[irandom_range(1, array_length(events) - 1)].event_id
}