// Semi-Automatic Sol battle rifle

/obj/item/gun/ballistic/automatic/sol_rifle
	name = "\improper Carwo-Cawil Battle Rifle"
	desc = "A heavy battle rifle firing .40 Sol. Commonly seen in the hands of SolFed military types. \
		Accepts any standard SolFed rifle magazine."
	icon = 'modular_lethal_doppler/paxilweapons_real/icons/rifle_48.dmi'
	icon_state = "cawil"
	worn_icon = 'modular_lethal_doppler/paxilweapons_real/icons/onmob/guns_worn.dmi'
	worn_icon_state = "cawil"
	lefthand_file = 'modular_lethal_doppler/paxilweapons_real/icons/onmob/guns_inhand_left.dmi'
	righthand_file = 'modular_lethal_doppler/paxilweapons_real/icons/onmob/guns_inhand_right.dmi'
	inhand_icon_state = "cawil"
	SET_BASE_PIXEL(-8, 0)
	special_mags = TRUE
	bolt_type = BOLT_TYPE_LOCKING
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	slot_flags = ITEM_SLOT_BACK
	accepted_magazine_type = /obj/item/ammo_box/magazine/c40sol_rifle
	spawn_magazine_type = /obj/item/ammo_box/magazine/c40sol_rifle/standard
	fire_sound = 'modular_lethal_doppler/paxilweapons_real/sound/cawil/rifle_heavy.ogg'
	suppressed_sound = 'modular_lethal_doppler/paxilweapons_real/sound/cawil/suppressed_rifle.ogg'
	can_suppress = TRUE
	suppressor_x_offset = 0
	burst_size = 1
	fire_delay = 0.45 SECONDS
	actions_types = list()
	spread = 7.5
	recoil = 0.5
	pickup_sound = 'modular_lethal_doppler/paxilweapons_real/sound/pickup_sounds/drop_heavygun.wav'
	drop_sound = 'modular_lethal_doppler/paxilweapons_real/sound/pickup_sounds/drop_heavygun.wav'
	gunshot_animation_information = list(
		"pixel_x" = 35, \
		"pixel_y" = 0, \
		"inactive_wben_suppressed" = TRUE, \
	)
	recoil_animation_information = list(
		"recoil_angle_upper" = -10, \
		"recoil_angle_lower" = -20, \
		"recoil_burst_speed" = 0.5, \
		"return_burst_speed" = 0.5, \
	)

/obj/item/gun/ballistic/automatic/sol_rifle/Initialize(mapload)
	. = ..()
	give_autofire()

/// Separate proc for handling auto fire just because one of these subtypes isn't otomatica
/obj/item/gun/ballistic/automatic/sol_rifle/proc/give_autofire()
	return

/obj/item/gun/ballistic/automatic/sol_rifle/give_manufacturer_examine()
	AddElement(/datum/element/manufacturer_examine, COMPANY_CARWO)

/obj/item/gun/ballistic/automatic/sol_rifle/examine(mob/user)
	. = ..()
	. += span_notice("You can <b>examine closer</b> to learn a little more about this weapon.")

/obj/item/gun/ballistic/automatic/sol_rifle/examine_more(mob/user)
	. = ..()
	. += "The Carwo-Cawil rifles are built by Carwo for \
		use by SolFed's various infantry branches. Following the rather reasonable \
		military requirements of using the same few cartridges and magazines, \
		the lifespans of logistics coordinators and quartermasters everywhere \
		were lengthened by several years. While typically only for military sale \
		in the past, the recent collapse of certain unnamed weapons manufacturers \
		has caused Carwo to open many of its military weapons to civilian sale, \
		which includes this one."
	return .

/obj/item/gun/ballistic/automatic/sol_rifle/no_mag
	spawnwithmagazine = FALSE

// Evil version of the rifle (nothing different it's just black)

/obj/item/gun/ballistic/automatic/sol_rifle/evil
	desc = "A heavy battle rifle, this one seems to be painted tacticool black. \
		Accepts any standard SolFed rifle magazine."
	icon_state = "cawil_evil"
	worn_icon_state = "cawil_evil"
	inhand_icon_state = "cawil_evil"
	/// Is the stock extended or nah
	var/stock_extended = TRUE

/obj/item/gun/ballistic/automatic/sol_rifle/evil/Initialize(mapload)
	. = ..()
	extend_stock()

/obj/item/gun/ballistic/automatic/sol_rifle/examine(mob/user)
	. = ..()
	. += span_notice("You can <b>Alt-Click</b> to fiddle with the stock.")

/obj/item/gun/ballistic/automatic/sol_rifle/evil/click_alt(mob/user)
	stock_extended = !stock_extended
	balloon_alert(user, "stock [stock_extended ? "extended" : "retracted"]")
	if(stock_extended)
		extend_stock()
	else
		retract_stock()
	playsound(src, 'sound/items/ampoule_snap.ogg', 60, TRUE)
	update_appearance()
	return CLICK_ACTION_SUCCESS

/obj/item/gun/ballistic/automatic/sol_rifle/evil/proc/extend_stock()
	spread = initial(spread)
	recoil = initial(recoil)
	w_class = initial(w_class)
	cut_overlays()
	update_appearance()
	var/image/stock_overlay = image(icon = icon, icon_state = "[icon_state]_stock")
	add_overlay(stock_overlay)

/obj/item/gun/ballistic/automatic/sol_rifle/evil/proc/retract_stock()
	spread = 15
	recoil = 2
	w_class = WEIGHT_CLASS_NORMAL
	cut_overlays()
	update_appearance()
	var/image/stock_overlay = image(icon = icon, icon_state = "[icon_state]_stock_flat")
	add_overlay(stock_overlay)

/obj/item/gun/ballistic/automatic/sol_rifle/evil/no_mag
	spawnwithmagazine = FALSE
