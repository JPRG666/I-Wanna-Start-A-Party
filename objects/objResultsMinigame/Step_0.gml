if (info.is_finished) {
	var target_follow = null;

	with (objPlayerReference) {
		if (reference == 1) {
			target_follow = id;
			break;
		}
	}
	
	objCamera.target_follow = target_follow;
}

switch (state) {
	case 0:
		if (get_player_count(objPlayerBoardData) != global.player_max) {
			exit;
		}
	
		alpha -= 0.03;
		var room_name = room_get_name(room);
		var bgm_name = "bgm" + string_copy(room_name, 2, string_length(room_name) - 1);
	
		if (room == rBoardIsland && !global.board_day) {
			bgm_name += "Night";
		}
		
		music_play(bgm_name);
	
		if (alpha <= 0) {
			alpha = 0;
			state = -1;
		
			for (var i = 0; i < global.player_max; i++) {
				var p_info = places_minigame_info[i];
				var order = places_minigame_order[i];
			
				with (p_info) {
					target_draw_x = 400 - draw_w / 2;
					target_draw_y = 79 + (draw_h + 30) * (order - 1);
				}
			}
		
			alarm[0] = get_frames(1);
		}
		break;
		
	case 1:
		alpha += 0.03;
	
		if (alpha >= 1) {
			alpha = 1;
			
			with (objPlayerBase) {
				change_to_object(objPlayerBoard);
			}
			
			for (var i = 0; i < array_length(info.player_positions); i++) {
				var pos = info.player_positions[i];
				var player = focus_player_by_id(i + 1);
				player.x = pos.x;
				player.y = pos.y;
				player.lost = false;
			}
			
			minigame_info_reset();
			info = global.minigame_info;
			
			with (objPlayerInfo) {
				target_draw_x = main_draw_x;
				target_draw_y = main_draw_y;
				draw_x = target_draw_x;
				draw_y = target_draw_y;
				player_info.space = c_ltgray;
			}
			
			global.player_turn = 1;
			state = 2;
			
			if (global.board_turn == global.max_board_turns - 4) {
				instance_create_layer(0, 0, "Managers", objLastTurns);
			}
		}
		break;
		
	case 2:
		if (get_player_count(objPlayerBoard) != global.player_max) {
			exit;
		}
	
		alpha -= 0.04;
		
		if (alpha <= 0) {
			instance_destroy();
		}
		break;
}