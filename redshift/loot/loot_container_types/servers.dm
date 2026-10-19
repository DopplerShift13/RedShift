/obj/structure/storage_loot_spawn/server
	name = "computer rack"
	desc = "While modern production machinery can make small picometer traces for computer chips, \
		the frontier sees bulky racks such as this one instead due to the ease of manufacture for \
		larger computer componentry."
	icon_state = "server_1"
	max_integrity = 175
	loot_storage_type = /datum/storage/storage_loot/server
	weighted_loot_spawns = list()
	loot_spawn_diceroll = "1d5"

/obj/structure/storage_loot_spawn/server/Initialize(mapload)
	. = ..()
	icon_state = "server_[rand(1, 6)]"
	update_appearance()

/datum/storage/storage_loot/server
	max_slots = 5
	screen_max_columns = 1
	opening_sound = null
