function get_event(event_id){
	for (var i = 0; i < array_length(events); i++) {
		if (events[i].event_id = event_id) return events[i]
	}
	return -1
}