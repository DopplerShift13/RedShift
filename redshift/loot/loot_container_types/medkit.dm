/obj/structure/storage_loot_spawn/medkit
	name = "clinic box"
	desc = "A large box for carrying large quantities of medical supplies to clinics away from the major supply chain."
	icon_state = "medkit_1"
	max_integrity = 160
	loot_storage_type = /datum/storage/storage_loot/medkit
	weighted_loot_spawns = list()
	loot_spawn_diceroll = "1d5+1"

/obj/structure/storage_loot_spawn/medkit/Initialize(mapload)
	. = ..()
	icon_state = "medkit_[rand(1, 3)]"
	update_appearance()

/datum/storage/storage_loot/medkit
	max_slots = 6
	screen_max_columns = 3
	opening_sound = null
