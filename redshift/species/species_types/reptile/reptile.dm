/mob/living/carbon/human/species/reptile
	race = /datum/species/reptile

/datum/species/reptile
	name = "\improper Cenerian"
	plural_form = "Cenerians"
	id = SPECIES_REPTILE
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
	exotic_bloodtype = /datum/blood_type/copper
	coldmod = 1
	heatmod = 1
	payday_modifier = 1
	changesource_flags = MIRROR_BADMIN | RACE_SWAP | ERT_SPAWN
	species_language_holder = /datum/language_holder/crew
	digitigrade_customization = DIGITIGRADE_OPTIONAL
	bodypart_overrides = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/lizard,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/lizard,
		BODY_ZONE_L_ARM = /obj/item/bodypart/arm/left/lizard,
		BODY_ZONE_R_ARM = /obj/item/bodypart/arm/right/lizard,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/lizard,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/lizard,
	)

/datum/species/reptile/get_digitgrade_for_species(not_left)
	if(not_left)
		return /obj/item/bodypart/leg/right/digitigrade
	return /obj/item/bodypart/leg/left/digitigrade

/datum/species/reptile/prepare_human_for_preview(mob/living/carbon/human/preview_mob)
	preview_mob.dna.features[FEATURE_OB_EARS] = SPRITE_ACCESSORY_NONE
	preview_mob.dna.features[FEATURE_OB_SNOUT] = SPRITE_ACCESSORY_NONE
	preview_mob.dna.features[FEATURE_MUTANT_COLOR] = "#5f9597"
	preview_mob.dna.features[FEATURE_OB_HORNS] = "Lizard - Ram (Alt)"
	preview_mob.dna.features[FEATURE_OB_HORNS_COLOR] = "#353535"
	preview_mob.set_haircolor("#b9985a", update = FALSE)
	preview_mob.set_hairstyle("Comet", update = TRUE)
	preview_mob.update_body(is_creating = TRUE)

/datum/species/reptile/get_species_description()
	return "A reptile-like people originating from a hot world with an arid band around the equator that gives way to more temperate poles."

/datum/species/reptile/get_species_lore()
	return list(
		"It would be a proper good idea.",

		"To put \
		something interesting.",

		"In this space.",
	)
