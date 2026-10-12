/mob/living/carbon/human/species/avian
	race = /datum/species/avian

/datum/species/avian
	name = "\improper Alcyoni"
	plural_form = "Alcyoni"
	id = SPECIES_AVIAN
	// preview_outfit =
	inherent_traits = list(
		TRAIT_MUTANT_COLORS,
	)
	inherent_biotypes = MOB_ORGANIC|MOB_HUMANOID
	mutant_organs = list(
		/obj/item/organ/snout/ob = SPRITE_ACCESSORY_NONE,
		/obj/item/organ/tail/ob = SPRITE_ACCESSORY_NONE,
		/obj/item/organ/horns/ob = SPRITE_ACCESSORY_NONE,
	)
	mutantears = /obj/item/organ/ears/ob
	exotic_bloodtype = /datum/blood_type/red
	coldmod = 1
	heatmod = 1
	payday_modifier = 1
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_PRIDE | MIRROR_MAGIC | RACE_SWAP | ERT_SPAWN | SLIME_EXTRACT
	species_language_holder = /datum/language_holder/crew
	digitigrade_customization = DIGITIGRADE_OPTIONAL
	bodypart_overrides = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/avian,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/avian,
		BODY_ZONE_L_ARM = /obj/item/bodypart/arm/left/avian,
		BODY_ZONE_R_ARM = /obj/item/bodypart/arm/right/avian,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/avian,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/avian,
	)

/datum/species/avian/get_digitgrade_for_species(not_left)
	if(not_left)
		return /obj/item/bodypart/leg/right/avian/digitigrade
	return /obj/item/bodypart/leg/left/avian/digitigrade

/datum/species/avian/prepare_human_for_preview(mob/living/carbon/human/preview_mob)
	preview_mob.dna.features[FEATURE_OB_EARS] = SPRITE_ACCESSORY_NONE
	preview_mob.dna.features[FEATURE_MUTANT_COLOR] = "#837d79"
	preview_mob.dna.features[FEATURE_OB_SNOUT_COLOR] = "#252524"
	preview_mob.dna.features[FEATURE_OB_SNOUT] = "Beak - Normal"
	preview_mob.set_haircolor("#c7c4c2", update = FALSE)
	preview_mob.set_hairstyle("Alcyoni - Rooster", update = TRUE)
	preview_mob.update_body(is_creating = TRUE)

/datum/species/avian/get_species_description()
	return "Feathered avian type peoples coming from a homeworld with a troubled tectonic history, resulting in volcanic islands the size of small continents \
		surrounded by deep oceans, making flat land a premium."

/datum/species/avian/get_species_lore()
	return list(
		"It would be a proper good idea.",

		"To put \
		something interesting.",

		"In this space.",
	)
