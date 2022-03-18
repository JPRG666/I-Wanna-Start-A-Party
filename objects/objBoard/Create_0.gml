depth = -10000;

with (objPlayerBase) {
	change_to_object(objPlayerBoard);
}

global.initial_rolls = array_sequence(1, 10);
array_shuffle(global.initial_rolls);
array_delete(global.initial_rolls, global.player_max, array_length(global.initial_rolls) - global.player_max);

//Board controllers
global.board_started = false;
global.board_turn = 1;
global.player_turn = 1;
global.dice_roll = 0;
global.choice_selected = -1;

//Board values
global.max_board_turns = 20;
global.shine_price = 20;
global.min_shop_coins = 5;
global.min_blackhole_coins = 5;

//Minigame values
minigame_info_reset();

tell_choices = false;
from_minigame = false;
from_minigame_alpha = 0;

//Temp
temp = false;
//Temp

alarm[11] = 1;