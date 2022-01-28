depth = -10000;
player_info = null;
player_focus = null;
draw_w = 240;
draw_h = 90;

function setup() {
	draw_x = 0;
	draw_y = 0;

	switch (player_info.turn) {
		case 1:
			draw_x = 0;
			draw_y = 0;
			break;
		
		case 2:
			draw_x = display_get_gui_width() - draw_w;
			draw_y = 0;
			break;
		
		case 3:
			draw_x = 0;
			draw_y = display_get_gui_height() - draw_h;
			break;
		
		case 4:
			draw_x = display_get_gui_width() - draw_w;
			draw_y = display_get_gui_height() - draw_h;
			break;
	}

	target_draw_x = draw_x;
	target_draw_y = draw_y;
	main_draw_x = draw_x;
	main_draw_y = draw_y;
}