with (objPlayerBase) {
	change_to_object(objPlayerPlatformer);
}

with (objPlayerBase) {
	enable_shoot = false;
	chosed_block = -1;
}

event_inherited();

minigame_start = minigame_1vs3_start;
minigame_time = 40;
minigame_time_end = function() {
	with (objPlayerBase) {
		if (y < 128) {
			minigame_4vs_points(objMinigameController.info, network_id - 1, -1);
			break;
		}
	}
	
	minigame_finish(true);
}

music = bgmMinigameE;
points_draw = true;
points_number = false;
player_check = objPlayerPlatformer;
