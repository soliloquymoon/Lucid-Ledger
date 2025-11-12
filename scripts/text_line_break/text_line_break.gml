function text_line_break(str, width){
	var words = string_split(str, " ")
	var ret = ""
	var lines = []
	var line = 0
	for (var i = 0; i < array_length(words); i++) {
		if (array_length(lines) - 1 <= line) array_push(lines, "")
		if (lines[line] != "") lines[line] += " "
		if (string_width(lines[line] + words[i]) > width) {
			line++
		}
		lines[line] += words[i]
	}
	for (var i = 0; i < array_length(lines); i++) {
		ret += lines[i]
		if (i < array_length(lines) - 1) ret += "\n"
	}
	return ret
}