function scene_sell_inner(){
	draw_set_color(0)
	draw_text(10, 10, "sell inner scene")
	
	if (player_offer > 0 && current_client == 0) {
		if (irandom_range(1, 100) == 37) {
			current_client = 1;

			client_init  = 1;
			client_rounds = 0;
			client_offer_made = 0;
			client_offer_making_timer = 0;

			var min_profit_percent = 10;
			min_sale_price = (dream_to_sell.dream_value * (100 + min_profit_percent)) div 100;
			min_sale_price = max(min_sale_price, (dream_to_sell.recommended_value * 70) div 100);
			min_sale_price = (min_sale_price div 10) * 10;

			var desire = 85 + irandom(25);
			client_willing_max = (dream_to_sell.recommended_value * desire) div 100;
			client_willing_max = (client_willing_max div 10) * 10;

			client_concede_step = max(10, (dream_to_sell.recommended_value div 50));
		}
	}
	
	if (current_client) {
		draw_sprite_stretched(spr_client, 0, 207, 103, 230, 480)
	}
	
	draw_frame_solid(0, 576, 1366, 768 - 576)
	draw_sprite_ext(spr_character_sell, 0, 0, 0, 0.3, 0.3, 0, -1, 1)
	
	dream_draw_item(150, 576 + 30, dream_to_sell)
	set_tooltip(150, 576 + 30, 456, 138, "Bought for " + string(dream_to_sell.dream_value))
	
	if (player_offer_edit) {
		draw_text(688, 622, "Make an offer!")
		player_offer_pending = draw_number_adjust(688, 642, player_offer_pending, 10)
		if (draw_button_size(688, 672, 50, 50, "OK")) {
			player_offer_edit = 0
			player_offer = player_offer_pending
			client_offer_made = 0
		}
	}
	
	if (current_client) {
		if (client_offer_made == 0) {
			client_offer_making_timer++;
		}

		if (client_offer_making_timer > 60) {

			if (client_willing_max < min_sale_price) {
				show_message("Client: That's over my budget.");
				current_client = 0;
				client_init = 0;
				client_offer_made = 0;
				client_rounds = 0;
				client_offer = 0;
				client_offer_making_timer = 0;
				player_offer = 0
				player_offer_edit = 1
			}
			else {
				if (player_offer > 0 && player_offer >= min_sale_price && player_offer <= client_willing_max) {
					client_offer = -10;
				}
				else {
					var prev_offer = client_offer;
					if (prev_offer <= 0) {
						prev_offer = (dream_to_sell.recommended_value * 80) div 100;
					}

					var goal = clamp(player_offer, min_sale_price, client_willing_max);

					var remaining = max(1, 3 - client_rounds);
					var step = max(client_concede_step, abs(goal - prev_offer) div remaining);

					var new_offer = prev_offer + sign(goal - prev_offer) * step;

					new_offer = clamp(new_offer, min_sale_price, client_willing_max);

					client_offer = (new_offer div 10) * 10;
				}

				if (client_offer > 0) {
					bubble_name = "Client";
					if (client_rounds >= 3) {
						bubble_str = "That's the most I can do: " + string(client_offer);
					} else {
						bubble_str = "Can you do " + string(client_offer) + "?";
					}
					bubble_display = 1;
				}

				client_offer_made = 1;
				client_offer_making_timer = 0;
			}
		}
	}
	
	if (client_offer = -10) {
		client_offer = 0
		show_message("Dream sold!")
		money += player_offer
		schedule_dream_removal(dream_to_sell)
		for (var i = 0; i < array_length(inventory); i++) {
			if (inventory[i].dream_id = dream_to_sell.dream_id) {
				array_delete(inventory, i, 1)
				break
			}
		}
		rounds++
		scene_exit()
	}
	
	if (bubble_display) {
		draw_frame_solid(474, 143, 450, 198)
		draw_text(510, 204, bubble_str)
		if (draw_button_size(526, 276, 85, 46, "Accept")) {
			show_message("Dream sold!")
			money += client_offer
			schedule_dream_removal(dream_to_sell)
			for (var i = 0; i < array_length(inventory); i++) {
				if (inventory[i].dream_id = dream_to_sell.dream_id) {
					array_delete(inventory, i, 1)
					break
				}
			}
			rounds++
			scene_exit()
		}
		if (draw_button_size(642, 276, 85, 46, "Decline")) {
			show_message("Dream failed to sell!")
			rounds++
			scene_exit()
		}
		if (client_rounds < 4) {
			if (draw_button_size(758, 276, 100, 46, "Counteroffer")) {
				player_offer = 0
				player_offer_pending = client_offer
				player_offer_edit = 1
				client_rounds++
				bubble_display = 0
			}
		}
	}
}