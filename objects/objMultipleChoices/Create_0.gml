image_alpha = 0;
alpha_target = 1;

choices = [];
length = 96;
separation = 20;
final_action = null;

function skip_empty_choice(scroll) {
	do {
		global.choice_selected = (global.choice_selected + array_length(choices) + scroll) % array_length(choices);
	} until (choices[global.choice_selected] != "");
}