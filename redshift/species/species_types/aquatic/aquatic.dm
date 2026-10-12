/mob/living/carbon/human/species/aquatic
	race = /datum/species/aquatic

/datum/species/aquatic
	name = "\improper Persean"
	plural_form = "Perseans"
	id = SPECIES_AQUATIC
	// preview_outfit =
	inherent_traits = list(
		TRAIT_MUTANT_COLORS,
	)
	inherent_biotypes = MOB_ORGANIC|MOB_HUMANOID
	mutant_organs = list(
		/obj/item/organ/tail/ob = SPRITE_ACCESSORY_NONE,
		/obj/item/organ/horns/ob = SPRITE_ACCESSORY_NONE,
	)
	mutantears = /obj/item/organ/ears/ob
	mutanteyes = /obj/item/organ/eyes/aquatic
	exotic_bloodtype = /datum/blood_type/red
	coldmod = 1
	heatmod = 1
	payday_modifier = 1
	changesource_flags = MIRROR_BADMIN | RACE_SWAP | ERT_SPAWN
	species_language_holder = /datum/language_holder/crew
	digitigrade_customization = DIGITIGRADE_OPTIONAL
	bodypart_overrides = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/aquatic,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/aquatic,
		BODY_ZONE_L_ARM = /obj/item/bodypart/arm/left/aquatic,
		BODY_ZONE_R_ARM = /obj/item/bodypart/arm/right/aquatic,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/aquatic,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/aquatic,
	)

/datum/species/aquatic/get_digitgrade_for_species(not_left)
	if(not_left)
		return /obj/item/bodypart/leg/right/aquatic/digitigrade
	return /obj/item/bodypart/leg/left/aquatic/digitigrade

/datum/species/aquatic/prepare_human_for_preview(mob/living/carbon/human/preview_mob)
	preview_mob.dna.features[FEATURE_OB_EARS] = SPRITE_ACCESSORY_NONE
	preview_mob.dna.features[FEATURE_MUTANT_COLOR] = "#816e86"
	preview_mob.update_body(is_creating = TRUE)

/datum/species/aquatic/get_species_description()
	return "Originating from a warm planet covered mosty in shallow oceans, Perseans are outstanding swimmers and are capable of breathing in both water and air."

/datum/species/aquatic/get_species_lore()
	return list(
		"It would be a proper good idea.",

		"To put \
		something interesting.",

		"In this space.",
	)
