/obj/item/organ/tail/ob
	dna_block = /datum/dna_block/feature/accessory/ob_tail
	bodypart_overlay = /datum/bodypart_overlay/mutant/ob/tail

/datum/dna_block/feature/accessory/ob_tail
	feature_key = FEATURE_OB_TAIL

/datum/dna_block/feature/ob_tail_color
	block_length = DNA_BLOCK_SIZE_COLOR
	feature_key = FEATURE_OB_TAIL_COLOR

/datum/dna_block/feature/ob_tail_color/create_unique_block(mob/living/carbon/human/target)
	return sanitize_hexcolor(target.dna.features[feature_key], include_crunch = FALSE)

/datum/dna_block/feature/ob_tail_color/apply_to_mob(mob/living/carbon/human/target, dna_hash)
	target.dna.features[feature_key] = sanitize_hexcolor(get_block(dna_hash))
	target.update_body_parts()

/datum/bodypart_overlay/mutant/ob/tail
	layers = list(
		EXTERNAL_FRONT = BODY_FRONT_LAYER,
		EXTERNAL_BEHIND = BODY_BEHIND_LAYER,
	)
	offset_location = ENTIRE_BODY
	feature_key = FEATURE_OB_TAIL
	draw_on_husks = HUSK_OVERLAY_GRAYSCALE
	dna_color_source = FEATURE_OB_TAIL_COLOR
