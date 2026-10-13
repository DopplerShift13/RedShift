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

/mob/living/verb/view_skills()
	set name = "Skills"
	set category = "Redshift"
	set desc = "View your character's skills."
	skills_to_chat()

/// Prints a box with all of the mob's skills to chat
/mob/living/proc/skills_to_chat()
	var/skills_text = ""
	for(var/skill in skills)
		skills_text += "[get_skill_title(get_skill_value(skill))] [skill]"
		skills_text += " - [get_skill_value(skill)]"
	to_chat(src, fieldset_block("Skills", skills_text, "boxed_message"))

/// Returns a title for a skill value
/proc/get_skill_title(score)
	switch(score)
		if(0)
			return "Miserable"
		if(1)
			return "Novice"
		if(2)
			return "Adequate"
		if(3)
			return "Competent"
		if(4)
			return "Skilled"
		if(5)
			return "Proficient"
		if(6)
			return "Talented"
		if(7)
			return "Adept"
		if(8)
			return "Expert"
		if(9)
			return "Professional"
		if(10)
			return "Accomplished"
		if(11)
			return "Elite"
		if(12)
			return "Master"
		if(13)
			return "High Master"
		if(14)
			return "Grand Master"
		if(15)
			return "Legendary"

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
