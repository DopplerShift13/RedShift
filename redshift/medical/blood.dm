/datum/blood_type/red
	name = BLOOD_TYPE_RED
	color = BLOOD_COLOR_IRON
	compatible_types = list(
		/datum/blood_type/red,
		/datum/blood_type/substitute,
	)

/datum/blood_type/copper
	name = BLOOD_TYPE_COPPER
	color = BLOOD_COLOR_COPPER
	compatible_types = list(
		/datum/blood_type/copper,
		/datum/blood_type/substitute,
	)

/datum/blood_type/insect
	name = BLOOD_TYPE_PURPLE
	color = BLOOD_COLOR_PURPLE
	compatible_types = list(
		/datum/blood_type/insect,
		/datum/blood_type/substitute,
	)

/datum/blood_type/substitute
	name = BLOOD_TYPE_SUBSTITUTE
	color = BLOOD_COLOR_SUBSTITUTE
	compatible_types = list(
		/datum/blood_type/insect,
		/datum/blood_type/copper,
		/datum/blood_type/red,
	)
