/obj/item/bodypart/head/avian
	icon_greyscale = 'redshift/species/species_types/avian/icons/bodyparts.dmi'
	limb_id = SPECIES_AVIAN
	is_dimorphic = FALSE
	head_flags = HEAD_DEFAULT_FEATURES
	should_draw_greyscale = TRUE
	teeth_count = 0

/obj/item/bodypart/chest/avian
	icon_greyscale = 'redshift/species/species_types/avian/icons/bodyparts.dmi'
	limb_id = SPECIES_AVIAN
	is_dimorphic = FALSE
	should_draw_greyscale = TRUE

/obj/item/bodypart/arm/left/avian
	icon_greyscale = 'redshift/species/species_types/avian/icons/bodyparts.dmi'
	limb_id = SPECIES_AVIAN
	should_draw_greyscale = TRUE
	unarmed_attack_verbs = list("slash", "scratch", "claw")
	grappled_attack_verb = "lacerate"
	grappled_attack_verb_continuous = "lacerates"
	unarmed_attack_effect = ATTACK_EFFECT_CLAW
	unarmed_attack_sound = 'sound/items/weapons/slash.ogg'
	unarmed_miss_sound = 'sound/items/weapons/slashmiss.ogg'

/obj/item/bodypart/arm/right/avian
	icon_greyscale = 'redshift/species/species_types/avian/icons/bodyparts.dmi'
	limb_id = SPECIES_AVIAN
	should_draw_greyscale = TRUE
	unarmed_attack_verbs = list("slash", "scratch", "claw")
	grappled_attack_verb = "lacerate"
	grappled_attack_verb_continuous = "lacerates"
	unarmed_attack_effect = ATTACK_EFFECT_CLAW
	unarmed_attack_sound = 'sound/items/weapons/slash.ogg'
	unarmed_miss_sound = 'sound/items/weapons/slashmiss.ogg'

/obj/item/bodypart/leg/left/avian
	icon_greyscale = 'redshift/species/species_types/avian/icons/bodyparts.dmi'
	limb_id = SPECIES_AVIAN
	should_draw_greyscale = TRUE
	footprint_sprite = FOOTPRINT_SPRITE_CLAWS
	footstep_type = FOOTSTEP_MOB_CLAW

/obj/item/bodypart/leg/right/avian
	icon_greyscale = 'redshift/species/species_types/avian/icons/bodyparts.dmi'
	limb_id = SPECIES_AVIAN
	should_draw_greyscale = TRUE
	footprint_sprite = FOOTPRINT_SPRITE_CLAWS
	footstep_type = FOOTSTEP_MOB_CLAW

/obj/item/bodypart/leg/right/avian/digitigrade
	limb_id = SPECIES_DIGI_AVIAN
	species_id = SPECIES_AVIAN
	bodyshape = BODYSHAPE_DIGITIGRADE
	footprint_sprite = FOOTPRINT_SPRITE_CLAWS
	footstep_type = FOOTSTEP_MOB_CLAW

/obj/item/bodypart/leg/right/avian/digitigrade/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/digitigrade_limb, SPECIES_AVIAN, initial(limb_id))

/obj/item/bodypart/leg/left/avian/digitigrade
	limb_id = SPECIES_DIGI_AVIAN
	species_id = SPECIES_AVIAN
	bodyshape = BODYSHAPE_DIGITIGRADE
	footprint_sprite = FOOTPRINT_SPRITE_CLAWS
	footstep_type = FOOTSTEP_MOB_CLAW

/obj/item/bodypart/leg/left/avian/digitigrade/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/digitigrade_limb, SPECIES_AVIAN, initial(limb_id))
