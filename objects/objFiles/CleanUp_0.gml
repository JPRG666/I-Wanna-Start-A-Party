for (var i = 0; i < array_length(file_sprites); i++) {
	sprite_delete(file_sprites[i]);
}

for (var i = 0; i < array_length(menu_buttons); i++) {
	for (var j = 0; j < array_length(menu_buttons[i]); j++) {
		var button = menu_buttons[i][j];
		
		if (button == null) {
			continue;
		}
		
		sprite_delete(button.sprite);
	}
}
