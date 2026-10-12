/mob/living/carbon/human/species/furries
	race = /datum/species/furries

/datum/species/furries
	name = "\improper Nanthi"
	plural_form = "Nanthi"
	id = SPECIES_FURRIES
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
	mutanteyes =/obj/item/organ/eyes/furries
	exotic_bloodtype = /datum/blood_type/red
	coldmod = 1
	heatmod = 1
	payday_modifier = 1
	changesource_flags = MIRROR_BADMIN | RACE_SWAP | ERT_SPAWN
	species_language_holder = /datum/language_holder/crew
	digitigrade_customization = DIGITIGRADE_OPTIONAL
	bodypart_overrides = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/furries,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/furries,
		BODY_ZONE_L_ARM = /obj/item/bodypart/arm/left/furries,
		BODY_ZONE_R_ARM = /obj/item/bodypart/arm/right/furries,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/furries,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/furries,
	)

/datum/species/furries/get_digitgrade_for_species(not_left)
	if(not_left)
		return /obj/item/bodypart/leg/right/furries/digitigrade
	return /obj/item/bodypart/leg/left/furries/digitigrade

/datum/species/furries/prepare_human_for_preview(mob/living/carbon/human/preview_mob)
	preview_mob.dna.features[FEATURE_MUTANT_COLOR] = "#64564e"
	preview_mob.dna.features[FEATURE_OB_SNOUT] = "Nanthi - Lynx"
	preview_mob.dna.features[FEATURE_OB_SNOUT_COLOR] = "#64564e"
	preview_mob.dna.features[FEATURE_OB_EARS] = "Nanthi - Felinid"
	preview_mob.dna.features[FEATURE_OB_EARS_COLOR] = "#64564e"
	preview_mob.update_body(is_creating = TRUE)

/datum/species/furries/get_species_description()
	return "A furred people, usually sharing many features with earth's felidae, vulpes, and canidae life, often a mixture of the three. Their home planet resembles \
		the countrysides of Earth's European continent."

/datum/species/furries/get_species_lore()
	return list(
		"It would be a proper good idea.",

		"To put \
		something interesting.",

		"In this space.",
	)
