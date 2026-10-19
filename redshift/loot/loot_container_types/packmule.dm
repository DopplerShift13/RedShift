/obj/structure/storage_loot_spawn/packmule
	name = "packmule crate"
	desc = "Riding in on the backs of flatbed vehicles just about anywhere you can find them, packmule crates \
		are made to neatly stack on the backs of local vehicles for distribution to areas away from common \
		spaceports and landing pads."
	icon_state = "packmule_1"
	max_integrity = 230
	loot_storage_type = /datum/storage/storage_loot/packmule
	weighted_loot_spawns = list()
	loot_spawn_diceroll = "1d5+1"

/obj/structure/storage_loot_spawn/packmule/Initialize(mapload)
	. = ..()
	icon_state = "packmule_[rand(1, 5)]"
	update_appearance()

/datum/storage/storage_loot/packmule
	max_slots = 6
	screen_max_columns = 3
	opening_sound = null
