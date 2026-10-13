/obj/structure/storage_loot_spawn/shipping
	name = "cargo shipping crate"
	desc = "Large shipping crates made of dense plastics that are used to carry all manner of things around the system, who knows what's inside?"
	icon_state = "shipping_big"
	max_integrity = 250
	loot_storage_type = /datum/storage/storage_loot/shipping
	weighted_loot_spawns = list()
	loot_spawn_diceroll = "1d11+1"
	greyscale_colors = "#ffffff#ffffff"
	greyscale_config = /datum/greyscale_config/loot_shipping
	/// Random colors the crates can be
	var/list/random_crate_colors = list(
		"#ffffff",
		"#9daca2",
		"#9c1820",
		"#e4c813",
		"#8c7457",
		"#8fa7c9",
		"#57608c",
		"#e47a13",
		"#a52f08",
		"#269584",
		"#40d08d",
		"#8c3b72",
		"#2e3132",
		"#4c4f4f",
	)
	/// All of the different icon states we can pick from
	var/static/list/shipping_variations = list(
		"shipping_big",
		"shipping_short",
		"shipping_short_stack",
		"shipping_short_stack_small",
		"shipping_small",
		"shipping_small_stack",
	)

/obj/structure/storage_loot_spawn/shipping/Initialize(mapload)
	. = ..()
	greyscale_colors = "[pick(random_crate_colors)][pick(random_crate_colors)]"
	icon_state = pick(shipping_variations)
	update_greyscale()
	update_appearance()

/datum/storage/storage_loot/shipping
	max_slots = 12
	screen_max_columns = 4
	opening_sound = null
