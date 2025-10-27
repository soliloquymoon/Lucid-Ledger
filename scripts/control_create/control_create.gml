function control_create(){
	enum SCENE {
		TITLE,
		MARKET,
		EDIT,
		SELL,
		MAIN
	}
	enum EFFECT {
		TEST1,
		TEST2
	}
	scene = SCENE.TITLE
	money = 0 // Lunite
	day_counter = 0
	rounds = 0
	loan_amount = 0
	loan_due_date = -1
	deck = []
}