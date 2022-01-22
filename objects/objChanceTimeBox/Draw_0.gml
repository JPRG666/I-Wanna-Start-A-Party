sprite_index = sprBox;
draw_self();
sprite_index = sprChanceTimeBox;

if (layer_sequence_is_finished(sequence)) {
	if (!surface_exists(surf)) {
		surf = surface_create(32, 32);
	}

	surface_set_target(surf);
	draw_clear_alpha(c_black, 0);

	for (var i = 0; i < array_length(show_sprites); i++) {
		var show = show_sprites[i];
		draw_sprite((!indexes) ? show : sprBox, (!indexes) ? 0 : show, sprite_get_xoffset(show), sprite_get_yoffset(show) + yy + (32 * i));
	}

	surface_reset_target();

	draw_surface_ext(surf, x - 16, y - 32, image_xscale, image_yscale, 0, c_white, 1);
}

draw_self();