/obj/item/organ/ears/ob
	name = "ears"
	visual = TRUE
	restyle_flags = EXTERNAL_RESTYLE_FLESH
	bodypart_overlay = /datum/bodypart_overlay/mutant/ob/ears
	dna_block = /datum/dna_block/feature/accessory/ob_ears

/datum/dna_block/feature/accessory/ob_ears
	feature_key = FEATURE_OB_EARS

/datum/dna_block/feature/ob_ears_color
	block_length = DNA_BLOCK_SIZE_COLOR
	feature_key = FEATURE_OB_EARS_COLOR

/datum/dna_block/feature/ob_ears_color/create_unique_block(mob/living/carbon/human/target)
	return sanitize_hexcolor(target.dna.features[feature_key], include_crunch = FALSE)

/datum/dna_block/feature/ob_ears_color/apply_to_mob(mob/living/carbon/human/target, dna_hash)
	target.dna.features[feature_key] = sanitize_hexcolor(get_block(dna_hash))
	target.update_body_parts()

/datum/bodypart_overlay/mutant/ob/ears
	layers = list(
		EXTERNAL_FRONT = BODY_FRONT_LAYER,
		EXTERNAL_ADJACENT = BODY_ADJ_LAYER,
	)
	feature_key = FEATURE_OB_EARS
	draw_on_husks = HUSK_OVERLAY_GRAYSCALE
	offset_location = UPPER_BODY
	dna_color_source = FEATURE_OB_EARS_COLOR

/datum/bodypart_overlay/mutant/ob/ears/can_draw_on_bodypart(obj/item/bodypart/bodypart_owner, mob/living/carbon/owner)
	return ..() && !(bodypart_owner.owner?.obscured_slots & HIDEEARS)
