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
	dream.dream_name = dream_names[irandom_range(0, array_length(dream_names) - 1)]
	array_push(dream.tags, tags_rarity[0][irandom_range(0, array_length(tags_rarity[0]) - 1)])
	var rarity_second = irandom_range(0, 10) > 8
	array_push(dream.tags, tags_rarity[rarity_second][irandom_range(0, array_length(tags_rarity[rarity_second]) - 1)])
	array_push(dream.tags, tags_rarity[2][irandom_range(0, array_length(tags_rarity[2]) - 1)])
	var rarity_fourth = (irandom_range(0, 10) > 8) + 2
	array_push(dream.tags, tags_rarity[rarity_fourth][irandom_range(0, array_length(tags_rarity[rarity_fourth]) - 1)])
	dream.dream_value = irandom_range(120, 160) * 10
	dream.recommended_value = dream_value_calculate(dream)
}