/mob/living/carbon/human/species/slime
	race = /datum/species/slime

// What does he even do?

/datum/species/slime
	name = "\improper Archen"
	plural_form = "Archen"
	id = SPECIES_SLIME
	// preview_outfit =
	inherent_traits = list(
		TRAIT_MUTANT_COLORS,
	)
	inherent_biotypes = MOB_ORGANIC|MOB_HUMANOID
	/* body_markings = list(
	) */
	/* mutant_organs = list(
	) */
	// mutanttongue =
	// mutanteyes =
	// mutantbrain =
	// exotic_bloodtype =
	coldmod = 1
	heatmod = 1
	payday_modifier = 1
	changesource_flags = MIRROR_BADMIN | RACE_SWAP | ERT_SPAWN
	// species_cookie =
	// meat =
	// skinned_type =
	// species_language_holder =
	digitigrade_customization = DIGITIGRADE_OPTIONAL
	/* bodypart_overrides = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/lizard,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/lizard,
		BODY_ZONE_L_ARM = /obj/item/bodypart/arm/left/lizard,
		BODY_ZONE_R_ARM = /obj/item/bodypart/arm/right/lizard,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/lizard,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/lizard,
	) */

/datum/species/slime/prepare_human_for_preview(mob/living/carbon/human/preview_mob)
	return

/datum/species/slime/get_species_description()
	return "Slime-like people reliant on implanted technology to maintain form and function. They originate from a world that never seemed to leave a primal stage of \
		development, instead becoming a large swamp of bacterial mats, massive fungi, and prolific lichen and moss."

/datum/species/slime/get_species_lore()
	return list(
		"It would be a proper good idea.",

		"To put \
		something interesting.",

		"In this space.",
	)
