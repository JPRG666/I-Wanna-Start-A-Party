///@desc Shine Lose Animation
if (spawned_shine == noone) {
	if (focus_player != null && instance_exists(focus_player)) {
		spawned_shine = instance_create_layer(focus_player.x, focus_player.y, "Actors", objShine);
		spawned_shine.focus_player = focus_player;
	}
	
	alarm[ShineChangeType.Lose] = get_frames(1);
} else {
	spawned_shine.vspeed = -6;
	spawned_shine.losing = true;
}