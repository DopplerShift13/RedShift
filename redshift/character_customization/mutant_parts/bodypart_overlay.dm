/datum/bodypart_overlay/mutant/ob
	color_source = ORGAN_COLOR_OVERRIDE
	/// If we have a dna color source to check
	var/dna_color_source

/datum/bodypart_overlay/mutant/ob/override_color(obj/item/bodypart/bodypart_owner)
	if(dna_color_source && isnull((bodypart_owner.owner?.dna.features[dna_color_source])))
		return "#FFF"
	return bodypart_owner.owner.dna.features[dna_color_source]

/* /datum/bodypart_overlay/mutant/ob/color_image(image/overlay, obj/item/bodypart/limb, layer_index)
	if(dna_color_source && !isnull((limb.owner?.dna.features[dna_color_source])))
		dye_color = limb.owner.dna.features[dna_color_source]
	overlay.color = sprite_datum.color_src ? (dye_color || draw_color) : null */
