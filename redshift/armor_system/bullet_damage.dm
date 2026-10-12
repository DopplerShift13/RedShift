/// Checks the armor that the person is wearing when they are attacked and damages it under the correct conditions
/mob/living/proc/damage_armor(damage = 0, damage_type = BRUTE, def_zone = BODY_ZONE_CHEST)
	return FALSE

/mob/living/carbon/human/damage_armor(damage = 0, damage_type = BRUTE, def_zone = BODY_ZONE_CHEST)
	var/obj/item/bodypart/affecting
	if(def_zone)
		if(isbodypart(def_zone))
			affecting = def_zone
		else
			affecting = get_bodypart(check_zone(def_zone))

	if(!affecting)
		return FALSE

	var/list/clothings = get_clothing_on_part(affecting)
	for(var/obj/item/clothing/clothing in clothings)
		if(clothing.take_damage_zone(def_zone, damage, damage_type, 100))
			return TRUE

	return FALSE

// Override of living apply_projectile_effects that also damages the armor someone is wearing
/mob/living/apply_projectile_effects(obj/projectile/proj, def_zone, armor_check)
	var/hard_protection = get_zone_armor_type(def_zone)
	var/used_armor_block = armor_check
	if(hard_protection)
		switch(used_armor_block)
			if(-INFINITY to 50)
				used_armor_block = 75
			if(51 to 75)
				used_armor_block = 50
			else
				used_armor_block = 25

	var/damage_dealt = apply_damage(
		damage = hard_protection ? (max(proj.damage - (armor_check / 4), 0)) : proj.damage,
		damagetype = proj.damage_type,
		def_zone = def_zone,
		blocked = hard_protection ? used_armor_block : armor_check,
		wound_bonus = proj.wound_bonus,
		exposed_wound_bonus = proj.exposed_wound_bonus,
		sharpness = proj.sharpness,
		attack_direction = get_dir(proj.starting, src),
		attacking_item = proj,
	)

	if(proj.damage_type == BRUTE && damage_dealt >= 10 && proj.speed >= 1 && prob(0.1))
		var/obj/item/organ/brain/a_brain = locate() in get_bodypart(def_zone)
		a_brain?.cure_trauma_type(resilience = TRAUMA_RESILIENCE_LOBOTOMY)

	apply_effects(
		stun = proj.stun,
		knockdown = proj.knockdown,
		unconscious = proj.unconscious,
		slur = (mob_biotypes & MOB_ROBOTIC) ? 0 SECONDS : proj.slur, // Don't want your cyborgs to slur from being ebow'd
		stutter = (mob_biotypes & MOB_ROBOTIC) ? 0 SECONDS : proj.stutter, // Don't want your cyborgs to stutter from being tazed
		eyeblur = proj.eyeblur,
		drowsy = proj.drowsy,
		blocked = armor_check,
		stamina = proj.stamina,
		jitter = (mob_biotypes & MOB_ROBOTIC) ? 0 SECONDS : proj.jitter, // Cyborgs can jitter but not from being shot
		paralyze = proj.paralyze,
		immobilize = proj.immobilize,
	)

	// If the damage type isn't one of the types that already does clothing damage, then we damage armor
	damage_armor(proj.damage, proj.damage_type, def_zone)

	if(proj.dismemberment)
		check_projectile_dismemberment(proj, def_zone)

	if (proj.damage && armor_check < 100)
		create_projectile_hit_effects(proj, def_zone, armor_check)

	if(proj.fired_from)
		SEND_SIGNAL(proj.fired_from, COMSIG_PROJECTILE_POST_HIT_LIVING, src, def_zone, armor_check)
	SEND_SIGNAL(proj, COMSIG_PROJECTILE_SELF_POST_HIT_LIVING, src, def_zone, armor_check)
