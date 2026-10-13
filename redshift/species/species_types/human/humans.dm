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
	preview_mob.dna.species.mutant_organs[/obj/item/organ/ears/ob] = "Solari - Wide Elf"
	preview_mob.dna.features[FEATURE_OB_EARS_COLOR] = "#a57a66"
	preview_mob.set_haircolor("#2c2b2a", update = FALSE)
	preview_mob.set_hairstyle("Chunky Twin Buns", update = TRUE)
	regenerate_organs(preview_mob)
	preview_mob.update_body(is_creating = TRUE)

/datum/species/human/get_species_description()
	return "Originating from Earth, spreading to many of the vast reaches of what now makes up the 4CA and then some after uplifting \
		and the great migration. Thanks to genetic modification and the great variety of environments, humanity takes on an equally \
		diverse number of forms."

/datum/species/human/get_species_lore()
	return list(
		"Humanity as it was first discovered is unrecognizable to the average human in modern day.",

		"With the spread of space-age healthcare, genetic modification, and simply the great variety of environments that humanity \
		has decided to settle in, each individual member of the species may look completely different to any other member.",

		"While certainly not the only ones to heavily modify themselves to suit their environments or self image, humans are most likely \
		to take it the furthest.",

		"Copying features from the other species in the 4CA or even from their home, it's not uncommon to see a human having completely \
		transformed themselves into another creature completely.",
	)
