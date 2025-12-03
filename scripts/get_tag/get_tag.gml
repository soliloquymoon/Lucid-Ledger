function get_tag(tag_id){
	for (var i = 0; i < array_length(tags); i++) {
		if (tags[i].tag_id = tag_id) return tags[i]
	}
}