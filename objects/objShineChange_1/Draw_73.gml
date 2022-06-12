draw_set_alpha(animation_alpha);
var positive = (sign(amount) == 1);
draw_set_color((positive) ? c_blue : c_red);
draw_set_halign(fa_center);
draw_sprite_ext(sprShine, 0, focus_player.x - 15, focus_player.y - 40, 0.75, 0.75, 0, c_white, animation_alpha);
draw_set_halign(fa_left);
draw_text_outline(focus_player.x + 10, focus_player.y - 50, ((positive) ? "+" : "-") + string(abs(amount)), c_black);
draw_set_halign(fa_left);
draw_set_alpha(1);