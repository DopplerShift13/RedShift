/obj/structure/storage_loot_spawn
	abstract_type = /obj/structure/storage_loot_spawn
	icon = 'redshift/loot/icons/containers.dmi'
	density = TRUE
	anchored = TRUE
	layer = BELOW_OBJ_LAYER
	obj_flags = CAN_BE_HIT
	pass_flags_self = LETPASSTHROW|LETPASSCLICKS
	max_integrity = 200
	/// The storage datum used by this structure
	var/datum/storage/loot_storage_type = /datum/storage/storage_loot
	/// Weighted list of loot spawned inside the storage on loot refresh
	var/list/weighted_loot_spawns = list()
	/// Diceroll used to determine how much loot the container spawns with
	var/loot_spawn_diceroll = null
	/// Lower bounds for the loot respawn timer
	var/refresh_timer_lower = 10 MINUTES
	/// Upper bounds for the loot respawn timer
	var/refresh_timer_upper = 20 MINUTES
	/// If this box has been touched since the last loot respawn
	var/touched_since_refresh = FALSE

/obj/structure/storage_loot_spawn/Initialize(mapload)
	. = ..()
	create_storage(storage_type = loot_storage_type)
	refresh_loot(TRUE)

/obj/structure/storage_loot_spawn/attack_hand(mob/living/user, list/modifiers)
	if(!user.can_perform_action(src, NEED_DEXTERITY))
		return ..()
	atom_storage.open_storage(user)
	return TRUE

/// Deletes all stored items and replaces them with a new roll of loot
/obj/structure/storage_loot_spawn/proc/refresh_loot(force)
	if(touched_since_refresh || force) // Unless we force it (mapload) then the crate will not regen items if it has gone untouched
		if(length(contents))
			for(var/obj/stored_loot in contents)
				qdel(stored_loot)
		spawn_new_loot()
		touched_since_refresh = FALSE
	addtimer(CALLBACK(src, PROC_REF(refresh_loot)), rand(refresh_timer_lower, refresh_timer_upper))

/// Fills the container with loot items based on the diceroll and spawn table
/obj/structure/storage_loot_spawn/proc/spawn_new_loot()
	var/spawn_amount = roll(loot_spawn_diceroll)
	for(var/loot_spawn in 1 to spawn_amount)
		var/obj/new_loot = pick_weight(weighted_loot_spawns)
		new new_loot(src)
	Shake(1, 0, 1 SECONDS)

// Storage datum basetype for loot structures

/datum/storage/storage_loot
	// All of these will remain the same between all subtypes
	max_specific_storage = WEIGHT_CLASS_GIGANTIC
	max_total_storage = WEIGHT_CLASS_GIGANTIC * 9
	numerical_stacking = FALSE
	rustle_sound = TRUE
	insert_on_attack = FALSE
	// This is the stuff you actually change
	max_slots = 9
	screen_max_columns = 3
	/// The sound made when the storage is opened by someone
	var/opening_sound

/datum/storage/storage_loot/open_storage(mob/living/to_show)
	. = ..()
	if(!.)
		return
	if(!isnull(opening_sound))
		playsound(parent, opening_sound, 50, TRUE, MEDIUM_RANGE_SOUND_EXTRARANGE)
	var/obj/structure/storage_loot_spawn/loot_parent = parent // This will always be the case unless someone is being stupid
	loot_parent.touched_since_refresh = TRUE
