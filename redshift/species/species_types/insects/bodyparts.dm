/obj/item/bodypart/head/insect
	icon_greyscale = 'redshift/species/species_types/insects/icons/bodyparts.dmi'
	limb_id = SPECIES_INSECT
	is_dimorphic = FALSE
	head_flags = HEAD_DEFAULT_FEATURES
	should_draw_greyscale = TRUE
	teeth_count = 32

/obj/item/bodypart/chest/insect
	icon_greyscale = 'redshift/species/species_types/insects/icons/bodyparts.dmi'
	limb_id = SPECIES_INSECT
	is_dimorphic = TRUE
	should_draw_greyscale = TRUE

/obj/item/bodypart/arm/left/insect
	icon_greyscale = 'redshift/species/species_types/insects/icons/bodyparts.dmi'
	limb_id = SPECIES_INSECT
	should_draw_greyscale = TRUE
	unarmed_attack_verbs = list("slash", "scratch", "claw")
	grappled_attack_verb = "lacerate"
	grappled_attack_verb_continuous = "lacerates"
	unarmed_attack_effect = ATTACK_EFFECT_CLAW
	unarmed_attack_sound = 'sound/items/weapons/slash.ogg'
	unarmed_miss_sound = 'sound/items/weapons/slashmiss.ogg'

/obj/item/bodypart/arm/right/insect
	icon_greyscale = 'redshift/species/species_types/insects/icons/bodyparts.dmi'
	limb_id = SPECIES_INSECT
	should_draw_greyscale = TRUE
	unarmed_attack_verbs = list("slash", "scratch", "claw")
	grappled_attack_verb = "lacerate"
	grappled_attack_verb_continuous = "lacerates"
	unarmed_attack_effect = ATTACK_EFFECT_CLAW
	unarmed_attack_sound = 'sound/items/weapons/slash.ogg'
	unarmed_miss_sound = 'sound/items/weapons/slashmiss.ogg'

/obj/item/bodypart/leg/left/insect
	icon_greyscale = 'redshift/species/species_types/insects/icons/bodyparts.dmi'
	limb_id = SPECIES_INSECT
	footprint_sprite = FOOTPRINT_SPRITE_CLAWS
	footstep_type = FOOTSTEP_MOB_CLAW
	should_draw_greyscale = TRUE

/obj/item/bodypart/leg/right/insect
	icon_greyscale = 'redshift/species/species_types/insects/icons/bodyparts.dmi'
	limb_id = SPECIES_INSECT
	footprint_sprite = FOOTPRINT_SPRITE_CLAWS
	footstep_type = FOOTSTEP_MOB_CLAW
	should_draw_greyscale = TRUE

/obj/item/bodypart/leg/right/insect/digitigrade
	limb_id = SPECIES_DIGI_INSECT
	species_id = SPECIES_INSECT
	bodyshape = BODYSHAPE_HUMANOID
	footprint_sprite = FOOTPRINT_SPRITE_CLAWS
	footstep_type = FOOTSTEP_MOB_CLAW

/obj/item/bodypart/leg/right/insect/digitigrade/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/digitigrade_limb, SPECIES_INSECT, initial(limb_id))

/obj/item/bodypart/leg/left/insect/digitigrade
	limb_id = SPECIES_DIGI_INSECT
	species_id = SPECIES_INSECT
	bodyshape = BODYSHAPE_HUMANOID
	footprint_sprite = FOOTPRINT_SPRITE_CLAWS
	footstep_type = FOOTSTEP_MOB_CLAW

/obj/item/bodypart/leg/left/insect/digitigrade/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/digitigrade_limb, SPECIES_INSECT, initial(limb_id))
