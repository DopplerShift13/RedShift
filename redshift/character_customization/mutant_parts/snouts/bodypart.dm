/obj/item/organ/snout/ob
	name = "snout"
	dna_block = /datum/dna_block/feature/accessory/ob_snout
	bodypart_overlay = /datum/bodypart_overlay/mutant/ob/snout

/datum/dna_block/feature/accessory/ob_snout
	feature_key = FEATURE_OB_SNOUT

/datum/dna_block/feature/ob_snout_color
	block_length = DNA_BLOCK_SIZE_COLOR
	feature_key = FEATURE_OB_SNOUT_COLOR

/datum/dna_block/feature/ob_snout_color/create_unique_block(mob/living/carbon/human/target)
	return sanitize_hexcolor(target.dna.features[feature_key], include_crunch = FALSE)

/datum/dna_block/feature/ob_snout_color/apply_to_mob(mob/living/carbon/human/target, dna_hash)
	target.dna.features[feature_key] = sanitize_hexcolor(get_block(dna_hash))
	target.update_body_parts()

/datum/bodypart_overlay/mutant/ob/snout
	layers = list(EXTERNAL_ADJACENT = BODY_ADJ_LAYER)
	feature_key = FEATURE_OB_SNOUT
	draw_on_husks = HUSK_OVERLAY_GRAYSCALE
	offset_location = UPPER_BODY
	dna_color_source = FEATURE_OB_SNOUT_COLOR

/datum/bodypart_overlay/mutant/ob/snout/can_draw_on_bodypart(obj/item/bodypart/bodypart_owner, mob/living/carbon/owner)
	return ..() && !(bodypart_owner.owner?.obscured_slots & HIDESNOUT)
