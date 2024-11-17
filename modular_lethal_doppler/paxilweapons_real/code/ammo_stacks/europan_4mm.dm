/obj/item/ammo_box/magazine/ammo_stack/europan4mm
	name = "4mm Europan casings"
	desc = "A stack of 4mm Europan cartridges."
	caliber = CALIBER_4MMEUROPAN
	ammo_type = /obj/item/ammo_casing/europan4mm
	max_ammo = 25
	casing_x_positions = list(
		-6,
		-4,
		-2,
		0,
		2,
		4,
		6,
	)
	casing_y_padding = 6

/obj/item/ammo_box/magazine/ammo_stack/europan4mm/prefilled
	start_empty = FALSE

// Magazine for the Karim rifle

/obj/item/ammo_box/magazine/karim
	name = "\improper Karim pulse rifle magazine"
	desc = "A standard size magazine for Karim pulse rifles, holds fifty rounds."
	icon = 'modular_lethal_doppler/paxilweapons_real/icons/magazines_and_boxes.dmi'
	icon_state = "karim_mag"
	multiple_sprites = AMMO_BOX_FULL_EMPTY
	ammo_type = /obj/item/ammo_casing/europan4mm
	caliber = CALIBER_CESARZOWA
	max_ammo = 50
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/ammo_box/magazine/karim/spawns_empty
	start_empty = TRUE
