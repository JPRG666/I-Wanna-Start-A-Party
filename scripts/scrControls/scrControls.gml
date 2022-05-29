function Action(button) constructor {
	self.button = button;
	self.label = "";
	
	static held = function(id = null) {
		if (id != null && id > 0 && id != global.player_id) {
			return ai_actions(id)[$ self.label].held(id);
		}
		
		return keyboard_check(self.button);
	}
	
	static pressed = function(id = null) {
		if (id != null && id > 0 && id != global.player_id) {
			return ai_actions(id)[$ self.label].pressed(id);
		}
		
		return keyboard_check_pressed(self.button);
	}
	
	static released = function(id = null) {
		if (id != null && id > 0 && id != global.player_id) {
			return ai_actions(id)[$ self.label].released(id);
		}
		
		return keyboard_check_released(self.button);
	}
}

global.actions = {
	left: new Action(vk_left),
	right: new Action(vk_right),
	up: new Action(vk_up),
	down: new Action(vk_down),
	jump: new Action(vk_shift),
	shoot: new Action(ord("Z"))
};

var keys = variable_struct_get_names(global.actions);

for (var i = 0; i < array_length(keys); i++) {
	var key = keys[i];
	global.actions[$ key].label = key;
}

function AIAction() constructor {
	self.triggered = false;
	self.untriggered = false;
	self.frames = 0;
	
	static hold = function(frames) {
		self.frames = frames;
		self.triggered = true;
		self.untriggered = false;
	}
	
	static press = function() {
		self.triggered = true;
		self.untriggered = false;
	}
	
	static release = function(force = false) {
		var prev_untriggered = self.untriggered;
		self.untriggered = false;
		
		if (self.frames > 0 && !force) {
			self.frames--;
			return;
		}
		
		self.triggered = false;
		self.untriggered = !prev_untriggered;
	}
	
	static held = function() {
		return self.triggered;
	}
	
	static pressed = function() {
		return self.held();
	}
	
	static released = function() {
		return self.untriggered;
	}
}

global.all_ai_actions = [];

repeat (3) {
	var actions = {};
	var keys = variable_struct_get_names(global.actions);
	
	for (var i = 0; i < array_length(keys); i++) {
		actions[$ keys[i]] = new AIAction();
	}
	
	array_push(global.all_ai_actions, actions);
}

function ai_actions(id) {
	return global.all_ai_actions[id - 1];
}

function ai_release_all() {
	for (var i = 1; i <= array_length(global.all_ai_actions); i++) {
		var actions = ai_actions(i);
		
		if (actions != null) {
			var keys = variable_struct_get_names(actions);
	
			for (var j = 0; j < array_length(keys); j++) {
				actions[$ keys[j]].release();
			}
		}
	}
}

function check_player_actions_by_id(player_id) {
	var actions = ai_actions(player_id);

	if (actions == null) {
		return null;
	}

	if (!is_player_local(player_id)) {
		return null;
	}
	
	return actions;
}
