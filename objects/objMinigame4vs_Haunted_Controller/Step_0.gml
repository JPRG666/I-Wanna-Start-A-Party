if (info.is_finished) {
	exit;
}

var lost_count = 0;

with (objPlayerBase) {
	lost_count += lost;
}

if (lost_count == global.player_max) {
	with (objPlayerBase) {
		minigame4vs_points(network_id, -1);
	}
	
	minigame_finish(true);
}
