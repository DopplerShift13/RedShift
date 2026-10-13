/obj/structure/storage_loot_spawn/boxes
	name = "goods boxes"
	desc = "Degradable plastic boxes stacked up on an equally disposable pallet. The labels are either unreadable or torn off, who knows what's inside?"
	icon_state = "boxes_big"
	max_integrity = 120
	loot_storage_type = /datum/storage/storage_loot/boxes
	weighted_loot_spawns = list()
	loot_spawn_diceroll = "1d9"
	greyscale_colors = "#ffffff"
	greyscale_config = /datum/greyscale_config/loot_boxes
	/// All of the different icon states we can pick from
	var/static/list/box_variations = list(
		"boxes_big",
		"boxes_stacked",
		"boxes_flat_messy",
		"boxes_flat_neat",
		"boxes_stacked_big",
	)

/obj/structure/storage_loot_spawn/boxes/Initialize(mapload)
	. = ..()
	icon_state = pick(box_variations)
	update_appearance()

/datum/storage/storage_loot/boxes
	max_slots = 9
	screen_max_columns = 3
	opening_sound = null
