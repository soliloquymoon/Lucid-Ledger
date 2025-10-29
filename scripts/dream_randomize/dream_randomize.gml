function dream_randomize(dream){
	var dream_names = [
		"Glass Horizon",
		"Velvet Orbit",
		"Echoseed",
		"Noctis Bloom",
		"Hollow Sugar",
		"The Violet Staircase",
		"Static Sonata",
		"Ashfall Reverie",
		"Dream of Rusted Bells",
		"Chromatic Meadow",
		"The Sky Beneath",
		"Silken Apparition",
		"Marble Eclipse",
		"Fractured Dew",
		"Whisper Loop",
		"Cradle of Fragments",
		"Neon Tides",
		"Cloud Machinery",
		"The Candle Logic",
		"Seraph Circuit",
		"Drowned Cathedral",
		"Polaris Sleep",
		"Paper Comet",
		"Echo Orchard",
		"Glass Orchard",
		"Tesseract Veil",
		"The Eighth Mirror",
		"Night’s Blueprint",
		"Dream of Sand and Copper",
		"Liminal Lanterns",
		"Forgotten Frequency",
		"Amber Rain",
		"The Spiral Library",
		"Sea of Quiet Fire",
		"Midnight Syntax",
		"Lucid Bloom",
		"The Breathing Clock",
		"Crimson Fog",
		"Whale in the Wires",
		"The Violet Architect",
		"Dream Static",
		"Feather Logic",
		"Salt Cathedral",
		"Hourglass Skin",
		"The Color of Memory",
		"Harmonic Abyss",
		"Waking Algorithm",
		"Paper Orbit",
		"Soft Apocalypse",
		"Fractal Lullaby",
		"Echo of the Void"
	]
	dream.dream_name = dream_names[irandom_range(0, array_length(dream_names))]
	dream.tags[0] = tags[0][irandom_range(0, array_length(tags[0]))]
	var rarity_second = irandom_range(0, 10) > 8
	dream.tags[1] = tags[rarity_second][irandom_range(0, array_length(tags[rarity_second]))]
	dream.tags[2] = tags[2][irandom_range(0, array_length(tags[2]))]
	var rarity_fourth = (irandom_range(0, 10) > 8) + 2
	dream.tags[3] = tags[rarity_fourth][irandom_range(0, array_length(tags[rarity_fourth]))]
	dream.dream_value = dream_value_calculate(dream)
}