/obj/item
	/// How much this item weighs, generates a value off of w_class if null, 1000 = 1 kg
	var/carry_weight = null
	/// How much this item weighs by base, used to reset in case of modifications like magazines
	var/base_carry_weight = null

/obj/item/Initialize(mapload)
	. = ..()
	if(isnull(carry_weight))
		switch(w_class)
			if(WEIGHT_CLASS_TINY)
				carry_weight = 250
			if(WEIGHT_CLASS_SMALL)
				carry_weight = 500
			if(WEIGHT_CLASS_NORMAL)
				carry_weight = 1 KILO
			if(WEIGHT_CLASS_BULKY)
				carry_weight = 5 KILO
			if(WEIGHT_CLASS_HUGE)
				carry_weight = 10 KILO
			if(WEIGHT_CLASS_GIGANTIC)
				carry_weight = 25 KILO
	base_carry_weight = carry_weight

/obj/item/examine(mob/user)
	. = ..()
	if(carry_weight)
		var/feels_text = "looks"
		var/should_show_weight = FALSE
		if(user.is_holding(src))
			feels_text = "feels"
			should_show_weight = TRUE
		if(!iscarbon(user))
			should_show_weight = TRUE
		else
			var/mob/living/carbon/carbon_user = user
			if(carbon_user.get_attribute_score(ATTRIBUTE_INTUITION, TRUE) > 3)
				should_show_weight = TRUE
		if(should_show_weight)
			. += span_notice("It [feels_text] about [round(carry_weight, 250) MILLI] kg.")

/datum/movespeed_modifier/carry_weight
	variable = TRUE

/mob/living/carbon
	/// The maximum weight that this mob can carry before getting slowed
	var/max_carry_weight = 10 KILO

/mob/living/carbon/update_equipment_speed_mods()
	. = ..()
	update_carry_weight()

/// Calculates a carbon's maximum carry weight based off of muscle
/mob/living/carbon/proc/update_max_carry_weight()
	max_carry_weight = (get_attribute_score(ATTRIBUTE_MUSCLE, TRUE) * 2) KILO

/// Gets how much all of a mob's equipped and stored items weigh them down
/mob/living/carbon/proc/update_carry_weight()
	var/final_weight = 0
	var/list/equipped_items = get_equipped_items(INCLUDE_POCKETS|INCLUDE_ACCESSORIES|INCLUDE_HELD)
	for(var/obj/item/equipped_item in equipped_items)
		if(!isnull(equipped_item.carry_weight))
			final_weight += equipped_item.carry_weight
		if(length(equipped_item.contents))
			for(var/obj/item/stored_item in equipped_item.contents)
				if(!isnull(stored_item.carry_weight))
					final_weight += stored_item.carry_weight
	if(final_weight > max_carry_weight * 3)
		add_or_update_variable_movespeed_modifier(/datum/movespeed_modifier/carry_weight, TRUE, 2)
	else if(final_weight > max_carry_weight * 2)
		add_or_update_variable_movespeed_modifier(/datum/movespeed_modifier/carry_weight, TRUE, 1.5)
	else if(final_weight > max_carry_weight * 1.5)
		add_or_update_variable_movespeed_modifier(/datum/movespeed_modifier/carry_weight, TRUE, 0.75)
	else if(final_weight > max_carry_weight)
		add_or_update_variable_movespeed_modifier(/datum/movespeed_modifier/carry_weight, TRUE, 0.4)
	else
		add_or_update_variable_movespeed_modifier(/datum/movespeed_modifier/carry_weight, TRUE, 0)
