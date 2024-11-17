// Low caliber grenade launcher (fun & games)

/obj/item/gun/ballistic/automatic/sol_grenade_launcher
	name = "\improper Kiboko Grenade Launcher"
	desc = "A unique grenade launcher firing .980 grenades. A laser sight system allows \
		its user to specify a range for the grenades it fires to detonate at."
	icon = 'modular_lethal_doppler/paxilweapons_real/icons/special_48.dmi'
	icon_state = "kiboko"
	worn_icon = 'modular_lethal_doppler/paxilweapons_real/icons/onmob/guns_worn.dmi'
	worn_icon_state = "kiboko"
	lefthand_file = 'modular_lethal_doppler/paxilweapons_real/icons/onmob/guns_inhand_left.dmi'
	righthand_file = 'modular_lethal_doppler/paxilweapons_real/icons/onmob/guns_inhand_right.dmi'
	inhand_icon_state = "kiboko"
	SET_BASE_PIXEL(-8, 0)
	special_mags = TRUE
	bolt_type = BOLT_TYPE_LOCKING
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	slot_flags = ITEM_SLOT_BACK
	accepted_magazine_type = /obj/item/ammo_box/magazine/c980_grenade
	fire_sound = 'modular_lethal_doppler/paxilweapons_real/sound/kiboko/grenade_launcher.ogg'
	can_suppress = FALSE
	burst_size = 1
	fire_delay = 5
	actions_types = list()
	pickup_sound = 'modular_lethal_doppler/paxilweapons_real/sound/pickup_sounds/drop_heavygun.wav'
	drop_sound = 'modular_lethal_doppler/paxilweapons_real/sound/pickup_sounds/drop_heavygun.wav'
	/// The currently stored range to detonate shells at
	var/target_range = 14
	/// The maximum range we can set grenades to detonate at, just to be safe
	var/maximum_target_range = 14

/obj/item/gun/ballistic/automatic/sol_grenade_launcher/give_manufacturer_examine()
	AddElement(/datum/element/manufacturer_examine, COMPANY_CARWO)

/obj/item/gun/ballistic/automatic/sol_grenade_launcher/examine(mob/user)
	. = ..()
	. += span_notice("You can <b>examine closer</b> to learn a little more about this weapon.")

/obj/item/gun/ballistic/automatic/sol_grenade_launcher/examine_more(mob/user)
	. = ..()
	. += "The Kiboko is one of the strangest weapons Carwo offers. A grenade launcher, \
		though not in the standard grenade size. The much lighter .980 Tydhouer grenades \
		developed for the weapon offered many advantages over standard grenade launching \
		ammunition. For a start, it was significantly lighter, and easier to carry large \
		amounts of. What it also offered, however, and the reason SolFed funded the \
		project: Variable time fuze. Using the large and expensive ranging sight on the \
		launcher, its user can set an exact distance for the grenade to self detonate at. \
		The dream of militaries for decades, finally realized. The smaller shells do not, \
		however, make the weapon any more enjoyable to fire. The kick is only barely \
		manageable thanks to the massive muzzle brake at the front."
	return .

/obj/item/gun/ballistic/automatic/sol_grenade_launcher/examine(mob/user)
	. = ..()
	. += span_notice("With <b>Right Click</b> you can set the range that shells will detonate at.")
	. += span_notice("A small indicator in the sight notes the current detonation range is: <b>[target_range]</b>.")

/obj/item/gun/ballistic/automatic/sol_grenade_launcher/ranged_interact_with_atom_secondary(atom/interacting_with, mob/living/user, list/modifiers)
	if(!interacting_with || !user)
		return ITEM_INTERACT_BLOCKING
	var/distance_ranged = get_dist(user, interacting_with)
	if(distance_ranged > maximum_target_range)
		user.balloon_alert(user, "out of range")
		return ITEM_INTERACT_BLOCKING
	target_range = distance_ranged
	user.balloon_alert(user, "range set: [target_range]")
	return ITEM_INTERACT_SUCCESS

/obj/item/gun/ballistic/automatic/sol_grenade_launcher/no_mag
	spawnwithmagazine = FALSE

// fun & games but evil this time

/obj/item/gun/ballistic/automatic/sol_grenade_launcher/evil
	icon_state = "kiboko_evil"
	worn_icon_state = "kiboko_evil"
	inhand_icon_state = "kiboko_evil"
	spawn_magazine_type = /obj/item/ammo_box/magazine/c980_grenade/drum

/obj/item/gun/ballistic/automatic/sol_grenade_launcher/evil/no_mag
	spawnwithmagazine = FALSE
