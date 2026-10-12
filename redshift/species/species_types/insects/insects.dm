/mob/living/carbon/human/species/insect
	race = /datum/species/insect

/datum/species/insect
	name = "\improper Shedir"
	plural_form = "Shedir"
	id = SPECIES_INSECT
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
	mutanteyes = /obj/item/organ/eyes/insect
	mutantears = /obj/item/organ/ears/ob
	exotic_bloodtype = /datum/blood_type/insect
	coldmod = 1
	heatmod = 1
	payday_modifier = 1
	changesource_flags = MIRROR_BADMIN | RACE_SWAP | ERT_SPAWN
	species_language_holder = /datum/language_holder/crew
	digitigrade_customization = DIGITIGRADE_OPTIONAL
	bodypart_overrides = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/insect,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/insect,
		BODY_ZONE_L_ARM = /obj/item/bodypart/arm/left/insect,
		BODY_ZONE_R_ARM = /obj/item/bodypart/arm/right/insect,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/insect,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/insect,
	)

/datum/species/insect/get_digitgrade_for_species(not_left)
	if(not_left)
		return /obj/item/bodypart/leg/right/insect/digitigrade
	return /obj/item/bodypart/leg/left/insect/digitigrade

/datum/species/insect/prepare_human_for_preview(mob/living/carbon/human/preview_mob)
	preview_mob.dna.features[FEATURE_MUTANT_COLOR] = "#4c5050"
	preview_mob.dna.features[FEATURE_OB_SNOUT] = "Insect - Itty-Bitty"
	preview_mob.dna.features[FEATURE_OB_SNOUT_COLOR] = "#353535"
	preview_mob.dna.features[FEATURE_OB_EARS] = "Antennae - Straight"
	preview_mob.dna.features[FEATURE_OB_EARS_COLOR] = "#353535"
	preview_mob.update_body(is_creating = TRUE)

/datum/species/insect/get_species_description()
	return "Bipedal insectoids varying wildly in appearance between any few members. They hail from a world that, on the surface, looks barren and rocky with only \
		a few hardy lichen surviving there. Beneath the surface, however, is an extensive network of caves and caverns that are home to life adapted to the dim \
		tunnels, lit only by the many bioluminescent plants that call the caves their home."

/datum/species/insect/get_species_lore()
	return list(
		"It would be a proper good idea.",

		"To put \
		something interesting.",

		"In this space.",
	)
