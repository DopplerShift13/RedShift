/datum/species
	/// The outfit to show in this species' preferences preview
	var/datum/outfit/preview_outfit = /datum/outfit
	/// Overrides the alpha of bodyparts and mutant parts
	var/body_alpha = 255

/// Returns what this species' digitgrade legs are
/datum/species/proc/get_digitgrade_for_species(not_left)
	if(not_left)
		return /obj/item/bodypart/leg/right/digitigrade
	return /obj/item/bodypart/leg/left/digitigrade
