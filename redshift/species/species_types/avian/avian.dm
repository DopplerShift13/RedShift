/mob/living/carbon/human/species/avian
	race = /datum/species/avian

/datum/species/avian
	name = "\improper Aviamod"
	plural_form = "Aviamods"
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
	return "Various humanoid species that have been modified with avian-like feathery features to better occupy planets in Crusoe's Rest such \
		as Truth and Accord."

/datum/species/avian/get_species_lore()
	return list(
		"When searching for a viable solution for genetic modification of peoples of multiple species to best fit the climates of Truth and Accord, \
		anything with fur was written off due to the logistical problems that introducing even more furred species onto a closed environment would \
		introduce.",

		"Drawing inspiration from other natural cold-weather life, avian-like feathers were chosen after observations of effective arctic \
		birds of prey were brought to the table.",

		"Depending on the original species of the modder, they may look anywhere between an anthropomorphised arctic bird, to a feathered \
		reptile.",

		"While thriving in cold environments, variations in more tropical styles for New Gibraltar are also a common sight, though as more \
		of a fashion statement than a practical need.",
	)
