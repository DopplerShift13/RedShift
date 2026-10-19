/obj/structure/storage_loot_spawn/hardcase
	name = "poly-hardcase"
	desc = "A poly-material hardcase made for shipping sensitive items around the local system. \
		Comes in all manner of easy-to-lose colors depending on the environment."
	icon_state = "hardcase_1"
	max_integrity = 200
	loot_storage_type = /datum/storage/storage_loot/hardcase
	weighted_loot_spawns = list()
	loot_spawn_diceroll = "1d5+1"

/obj/structure/storage_loot_spawn/hardcase/Initialize(mapload)
	. = ..()
	icon_state = "hardcase_[rand(1, 4)]"
	update_appearance()

/datum/storage/storage_loot/hardcase
	max_slots = 6
	screen_max_columns = 3
	opening_sound = null
