/obj/item/organ/horns/ob
	name = "horns"
	dna_block = /datum/dna_block/feature/accessory/ob_horns
	bodypart_overlay = /datum/bodypart_overlay/mutant/ob/horns

/datum/dna_block/feature/accessory/ob_horns
	feature_key = FEATURE_OB_HORNS

/datum/dna_block/feature/ob_horns_color
	block_length = DNA_BLOCK_SIZE_COLOR
	feature_key = FEATURE_OB_HORNS_COLOR

/datum/dna_block/feature/ob_horns_color/create_unique_block(mob/living/carbon/human/target)
	return sanitize_hexcolor(target.dna.features[feature_key], include_crunch = FALSE)

/datum/dna_block/feature/ob_horns_color/apply_to_mob(mob/living/carbon/human/target, dna_hash)
	target.dna.features[feature_key] = sanitize_hexcolor(get_block(dna_hash))
	target.update_body_parts()

/datum/bodypart_overlay/mutant/ob/horns
	layers = list(
		EXTERNAL_FRONT = BODY_FRONT_LAYER,
		EXTERNAL_ADJACENT = BODY_ADJ_LAYER,
		EXTERNAL_BEHIND = BODY_BEHIND_LAYER,
	)
	feature_key = FEATURE_OB_HORNS
	draw_on_husks = HUSK_OVERLAY_GRAYSCALE
	offset_location = UPPER_BODY
	dna_color_source = FEATURE_OB_HORNS_COLOR
