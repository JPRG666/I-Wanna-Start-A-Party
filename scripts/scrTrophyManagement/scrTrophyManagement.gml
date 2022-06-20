function Trophy(image, rank, name, description, hint) constructor {
	self.image = image;
	self.rank = rank;
	self.name = name;
	self.description = description;
	self.hint = hint;
}

global.trophies = [
	new Trophy(1, 2, "Shiny!", "You obtained your first Shine!\nBut just one isn't enough, ain't it?", "You're gonna obtain one sooner or later."),
	new Trophy(2, 1, "Shinier!", "You obtained 50 Shines!\nBut is it really enough?", "I love me something shiny."),
	new Trophy(3, 0, "Shiny yet Shinier!", "You obtained 100 Shines!\nNow that's a decent amount.", "I WANT MORE SHINY!!!"),
	new Trophy(4, 2, "Chest", "You found a Hidden Chest!\n", "Something's hidden in this space... I swear..."),
	new Trophy(5, 0, "Lucky Chest", "You found a Shine within a Hidden Chest!?\nNow that's what I call lucky, I bet the others are angry.", "Why must this always give me coins?"),
	new Trophy(6, 1, "Money Money", "You reached 100 Coins in Party!\nWhat does it feel to be rich?", "I want to have more and more!"),
	new Trophy(7, 1, "Spaceless", "You went down to 0 Coins in Party...\nWelp, time to live in the streets.", "You don't wanna lose that many."),
	new Trophy(8, 2, "Memory Magician", "You scored a perfect 10 in Magic Memory.\nCan I borrow that memory of yours for a second?", "How can you keep so many items in your head?"),
	new Trophy(9, 2, "Messed Memory", "You didn't put any items in the pedestals in Magic Memory...\nAt least try!", "You can't have that bad of a memory..."),
	new Trophy(10, 2, "Tie your tie", "You obtained a Tie in a minigame.\nWelp guess no one wins anything.", "Seriously? No one wins?")
];

global.collected_trophies_stack = [];

function gain_trophy(trophy) {
	if (have_trophy(trophy)) {
		return;
	}
	
	if (!instance_exists(objCollectedTrophy)) {
		collect_trophy(trophy);
	} else {
		array_push(global.collected_trophies_stack, trophy);
	}
	
	array_push(global.collected_trophies, trophy);
	array_sort(global.collected_trophies, true);
	save_file();
}

function have_trophy(trophy) {
	return (array_contains(global.collected_trophies, trophy));
}

function collect_trophy(trophy) {
	var now_trophy = global.trophies[trophy];
	var t = instance_create_layer(0, 0, "Managers", objCollectedTrophy);
	t.rank = now_trophy.rank;
	t.image = now_trophy.image;
	t.trophy = trophy;
}

function increase_collected_coins(amount) {
	var c = instance_create_layer(0, 0, "Managers", objCollectedCoins);
	c.amount = amount;
	global.collected_coins += amount;
}