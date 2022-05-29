if (!global.board_started) {
	if (fade_start && get_player_count(objPlayerBoard) == global.player_max) {
		fade_alpha -= 0.03;
		var room_name = room_get_name(room);
		music_play(asset_get_index("bgm" + string_copy(room_name, 2, string_length(room_name) - 1)), true);
	
		if (fade_alpha <= 0) {
			fade_alpha = 0;
			fade_start = false;
		
			if (global.player_id == 1) {
				board_start();
			}
		}
	}

	if (!tell_choices && is_local_turn() && instance_number(objDiceRoll) == global.player_max) {
		tell_turns();
		tell_choices = true;
	}
}
