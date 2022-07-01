///@desc Item Gain Animation
if (focus_player != null && instance_exists(focus_player)) {
	var i = instance_create_layer(focus_player.x, focus_player.y - 40, "Actors", objItem);
	i.focus_player = focus_player;
	i.sprite_index = item.sprite;
	i.vspeed = -6;
	i.gravity = 0.3;
}

alarm[11] = get_frames(1);