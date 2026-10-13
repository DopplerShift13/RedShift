/// Displays a message for if an attack was dodged due to rng
/mob/living/proc/make_attack_dodge_message(attacking_item, user)
	var/attack_message_spectator = "[src] misses with [attacking_item]!"
	var/attack_message_victim = "Something misses you with [attacking_item]!"
	var/attack_message_attacker = "You miss [src] with [attacking_item]!"
	if(user in viewers(src, null))
		attack_message_spectator = "[user] misses [src] with [attacking_item]!"
		attack_message_victim = "[user] misses you with [attacking_item]!"
	if(user == src)
		attack_message_victim = "You miss yourself with [attacking_item]."
	visible_message(span_danger("[attack_message_spectator]"),\
		span_selfwarning("[attack_message_victim]"), null, COMBAT_MESSAGE_RANGE, user)
	if(is_blind())
		to_chat(src, span_selfwarning("Someone misses you!"))
	to_chat(user, span_danger("[attack_message_attacker]"))
