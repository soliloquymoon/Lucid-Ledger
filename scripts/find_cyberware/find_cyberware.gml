function find_cyberware(type, level){
	for (var i = 0; i < array_length(cyberwares); i++) {
		if (cyberwares[i].part = type && cyberwares[i].level = level) return cyberwares[i]
	}
	return -1
}