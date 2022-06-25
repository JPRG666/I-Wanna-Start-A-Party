event_inherited();

with (objPlayerBase) {
	if (player_info_by_id(network_id).space == other.info.player_colors[1]) {
		image_xscale = 14;
		image_yscale = 14;
		y += 12;
		other.big_player = id;
		break;
	}
	
	xstart = x;
	ystart = y;
}

with (objCameraSplit4) {
	target_follow[0] = other.big_player;
	target_follow[1] = objMinigame1vs3_Chase_Gradius;
	lock_y = true;
	boundaries = true;
}
