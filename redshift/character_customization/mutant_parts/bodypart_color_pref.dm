/datum/preference/color/mutant_part_color
	abstract_type = /datum/preference/color/mutant_part_color
	savefile_key = null
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_SECONDARY_FEATURES
	relevant_inherent_trait = TRAIT_MUTANT_COLORS
	priority = /datum/preference/choiced/species_feature::priority + 1
	/// The feature we seek to change in DNA when applied
	var/target_feature = FEATURE_MUTANT_COLOR

/datum/preference/color/mutant_part_color/is_accessible(datum/preferences/preferences)
	if(!..(preferences))
		return FALSE
	var/species_type = preferences.read_preference(/datum/preference/choiced/species)
	var/datum/species/species = GLOB.species_prototypes[species_type]
	return !(TRAIT_FIXED_MUTANT_COLORS in species.inherent_traits)

/datum/preference/color/mutant_part_color/create_default_value()
	return sanitize_hexcolor("[pick("7F", "FF")][pick("7F", "FF")][pick("7F", "FF")]")

/datum/preference/color/mutant_part_color/apply_to_human(mob/living/carbon/human/target, value)
	if(target_feature == FEATURE_MUTANT_COLOR)
		return // A little safety
	target.dna.features[target_feature] = value
	target.update_body_parts(TRUE)

/datum/preference/color/mutant_part_color/is_valid(value)
	if(!..(value))
		return FALSE
	if(is_color_dark(value, 10))
		return FALSE
	return TRUE

/datum/bodypart_overlay/mutant/color_image(image/overlay, obj/item/bodypart/limb, layer_index)
	overlay.color = sprite_datum.color_src ? (dye_color || draw_color) : null
