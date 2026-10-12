/datum/species/human
	name = "\improper Solarian"
	plural_form = "Solarians"
	id = SPECIES_HUMAN
	inherent_traits = list(
		TRAIT_USES_SKINTONES,
	)
	// preview_outfit =
	inherent_biotypes = MOB_ORGANIC|MOB_HUMANOID
	mutant_organs = list(
		/obj/item/organ/tail/ob = SPRITE_ACCESSORY_NONE,
		/obj/item/organ/horns/ob = SPRITE_ACCESSORY_NONE,
	)
	mutantears = /obj/item/organ/ears/ob
	exotic_bloodtype = /datum/blood_type/red
	coldmod = 1
	heatmod = 1
	payday_modifier = 1
	changesource_flags = MIRROR_BADMIN | RACE_SWAP | ERT_SPAWN
	species_language_holder = /datum/language_holder/crew

/datum/species/human/prepare_human_for_preview(mob/living/carbon/human/preview_mob)
	preview_mob.skin_tone = "mixed1"
	preview_mob.dna.features[FEATURE_OB_EARS] = "Solari - Wide Elf"
	preview_mob.dna.features[FEATURE_OB_EARS_COLOR] = "#a57a66"
	preview_mob.set_haircolor("#2c2b2a", update = FALSE)
	preview_mob.set_hairstyle("Chunky Twin Buns", update = TRUE)
	preview_mob.update_body(is_creating = TRUE)

/datum/species/human/get_species_description()
	return "Humanity, coming from Earth as we know it, or rather, would have known it in the year 17th century. Early exposure to the technologies of the space-faring \
		species they now call brothers has irrepairably changed the course of history."

/datum/species/human/get_species_lore()
	return list(
		"It would be a proper good idea.",

		"To put \
		something interesting.",

		"In this space.",
	)
