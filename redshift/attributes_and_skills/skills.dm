/mob/living
	/// List of all skills a mob has
	var/list/skills = list(
		// Weapons skills
		SKILL_WEAPON_ECCENTRIC = 0
	)

/// Get's a mob's score for a skill
/mob/living/proc/get_skill_value(skill)
	if(!skill)
		return 0
	var/score = skills[skill]
	return score

/// Returns a modifier for chance to hit the target (or target limb) depending on relevant weapon skill
/mob/living/proc/target_chance_skill_modifier(target_skill)
	var/skill_value = get_skill_value(target_skill)
	switch(skill_value)
		if(0)
			return -25
		if(1 to 2)
			return -10
		if(3 to 4)
			return -5
		if(5 to 6)
			return 0
		if(7 to 10)
			return 5
		if(11 to 13)
			return 10
		if(14 to INFINITY)
			return 25
