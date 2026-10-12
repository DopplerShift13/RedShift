/mob/living/carbon/human/species/aquatic
	race = /datum/species/aquatic

/datum/species/aquatic
	name = "\improper Ordoht-like"
	plural_form = "Ordoht-alikes"
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
	return "Various humanoid species that have been modified into the general form of the Ordoht, seen as ideal for the conditions \
		on New Gibraltar and other frontier worlds with large bodies of water."

/datum/species/aquatic/get_species_lore()
	return list(
		"While increasingly rare to see the Ordoht anywhere outside of their core worlds, many of their features were seen as \
		desirable when it comes to colonization and work on frontier worlds with large bodies of water.",

		"Many species, especially Tizirans and Human frontiersmen undergo extensive modification, therapy, and training to \
		better resemble their aquatic allies.",

		"It is often the case, however, that the descendants of these original modders don't have quite as much of an affinity for \
		the sea as their ancestors.",

		"This results in third or even second generation ordoht-likes seen in odd jobs around the system, like here hunting for \
		Hark Crusoe's lost treasure.",
	)
