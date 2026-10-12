GLOBAL_LIST_EMPTY(dungeon_entrances)

/obj/structure/dungeon_entrance
	name = "dungeon entrance that someone used by accident"
	desc = "murder every1 u kno"
	icon = 'redshift/mapping/icons/entrances.dmi'
	icon_state = "hatch"
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
	anchored = TRUE
	id_tag = "you_fucked_up"
	/// How long should it take to travel through this?
	var/travel_time = 5 SECONDS
	/// Should this be treated as an exit rather than an entrance
	var/is_an_exit = FALSE

/obj/structure/dungeon_entrance/Initialize(mapload)
	. = ..()
	log_to_global_list()

/obj/structure/dungeon_entrance/examine(mob/user)
	. = ..()
	. += span_selfwarning("Anything or anyone you are <b>pulling</b> will be taken with you when you go through this.")

/obj/structure/dungeon_entrance/Destroy()
	remove_from_global_list()
	return ..()

/// Looks for an entrance
/obj/structure/dungeon_entrance/proc/log_to_global_list()
	if(!is_an_exit)
		for(var/obj/structure/dungeon_entrance/entrance as anything in GLOB.dungeon_entrances)
			if(!entrance.is_an_exit)
				continue // We're only checking for orphaned exits
			if(entrance.id_tag != id_tag)
				continue
			GLOB.dungeon_entrances += src
			GLOB.dungeon_entrances[src] = entrance
			GLOB.dungeon_entrances -= entrance
			return
		GLOB.dungeon_entrances += src
	else
		for(var/obj/structure/dungeon_entrance/entrance as anything in GLOB.dungeon_entrances)
			if(entrance.is_an_exit)
				continue // We can only link an exit to an entrance
			if(entrance.id_tag != id_tag)
				continue
			GLOB.dungeon_entrances[entrance] = src
			return
		GLOB.dungeon_entrances += src

/// Removes the entrance from the global list of entrances
/obj/structure/dungeon_entrance/proc/remove_from_global_list()
	GLOB.dungeon_entrances -= src

/obj/structure/dungeon_entrance/attack_hand(mob/user, list/modifiers)
	. = ..()
	if(.)
		return
	enter_the_fun_zone(user)

/obj/structure/dungeon_entrance/attack_hand_secondary(mob/user, list/modifiers)
	. = ..()
	if(. == SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN)
		return
	enter_the_fun_zone(user)
	return SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN

/obj/structure/dungeon_entrance/attackby(obj/item/item, mob/user, params)
	enter_the_fun_zone(user)
	return TRUE

/obj/structure/dungeon_entrance/attackby_secondary(obj/item/item, mob/user, params)
	. = ..()
	if(. == SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN)
		return
	enter_the_fun_zone(user)
	return SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN

/// Gets where this entrance/exit should deposit its mob at, returns false if no destination
/obj/structure/dungeon_entrance/proc/get_drop_point()
	for(var/obj/structure/dungeon_entrance/entrance as anything in GLOB.dungeon_entrances)
		if(is_an_exit && (entrance == src))
			break // This means we are an exit that isn't linked to anything
		var/obj/structure/dungeon_entrance/other_entrance = GLOB.dungeon_entrances[entrance]
		if(is_an_exit && other_entrance.is_an_exit)
			continue
		else if(!is_an_exit && !other_entrance.is_an_exit)
			continue
		if(other_entrance.id_tag != id_tag)
			continue
		return other_entrance
	return FALSE

/// Finds a random ladder inside the dungeon area to send the entree to it
/obj/structure/dungeon_entrance/proc/enter_the_fun_zone(mob/user)
	if(!in_range(src, user) || DOING_INTERACTION(user, DOAFTER_SOURCE_CLIMBING_LADDER))
		return
	if(!get_drop_point())
		balloon_alert(user, "hatch is broken!")
		return
	INVOKE_ASYNC(src, PROC_REF(send_him_to_detroit), user)

/// Actually moves the entree passed to it to a random exit
/obj/structure/dungeon_entrance/proc/send_him_to_detroit(mob/living/carbon/human/user)
	if(!do_after(user, travel_time, target = src))
		return
	var/obj/destination = get_drop_point()
	if(!destination)
		balloon_alert(user, "hatch is broken!")
		return
	user.zMove(target = get_turf(destination), z_move_flags = ZMOVE_CHECK_PULLEDBY|ZMOVE_ALLOW_BUCKLED|ZMOVE_INCLUDE_PULLED)
	playsound(src, 'sound/machines/tram/tramopen.ogg', 60, TRUE, frequency = 65000)
	playsound(destination, 'sound/machines/tram/tramclose.ogg', 60, TRUE, frequency = 65000)

/obj/structure/dungeon_entrance/exit
	name = "exit ladder that someone used by accident"
	icon_state = "exit_ladder"
	travel_time = 5 SECONDS
	is_an_exit = TRUE
