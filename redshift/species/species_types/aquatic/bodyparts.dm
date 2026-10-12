/obj/item/bodypart/head/aquatic
	icon_greyscale = 'redshift/species/species_types/aquatic/icons/bodyparts.dmi'
	limb_id = SPECIES_AQUATIC
	is_dimorphic = FALSE
	head_flags = HEAD_DEFAULT_FEATURES
	should_draw_greyscale = TRUE
	teeth_count = 32

/obj/item/bodypart/chest/aquatic
	icon_greyscale = 'redshift/species/species_types/aquatic/icons/bodyparts.dmi'
	limb_id = SPECIES_AQUATIC
	is_dimorphic = FALSE
	should_draw_greyscale = TRUE

/obj/item/bodypart/arm/left/aquatic
	icon_greyscale = 'redshift/species/species_types/aquatic/icons/bodyparts.dmi'
	limb_id = SPECIES_AQUATIC
	should_draw_greyscale = TRUE
	unarmed_attack_verbs = list("slash", "scratch", "claw")
	unarmed_attack_verbs = list("slashed", "scratched", "clawed")
	grappled_attack_verb = "lacerate"
	grappled_attack_verb_continuous = "lacerates"
	unarmed_attack_effect = ATTACK_EFFECT_CLAW
	unarmed_attack_sound = 'sound/items/weapons/slash.ogg'
	unarmed_miss_sound = 'sound/items/weapons/slashmiss.ogg'

/obj/item/bodypart/arm/right/aquatic
	icon_greyscale = 'redshift/species/species_types/aquatic/icons/bodyparts.dmi'
	limb_id = SPECIES_AQUATIC
	should_draw_greyscale = TRUE
	unarmed_attack_verbs = list("slash", "scratch", "claw")
	unarmed_attack_verbs = list("slashed", "scratched", "clawed")
	grappled_attack_verb = "lacerate"
	grappled_attack_verb_continuous = "lacerates"
	unarmed_attack_effect = ATTACK_EFFECT_CLAW
	unarmed_attack_sound = 'sound/items/weapons/slash.ogg'
	unarmed_miss_sound = 'sound/items/weapons/slashmiss.ogg'

/obj/item/bodypart/leg/left/aquatic
	icon_greyscale = 'redshift/species/species_types/aquatic/icons/bodyparts.dmi'
	limb_id = SPECIES_AQUATIC
	footprint_sprite = FOOTPRINT_SPRITE_CLAWS
	footstep_type = FOOTSTEP_MOB_CLAW
	should_draw_greyscale = TRUE

/obj/item/bodypart/leg/right/aquatic
	icon_greyscale = 'redshift/species/species_types/aquatic/icons/bodyparts.dmi'
	limb_id = SPECIES_AQUATIC
	footprint_sprite = FOOTPRINT_SPRITE_CLAWS
	footstep_type = FOOTSTEP_MOB_CLAW
	should_draw_greyscale = TRUE

/obj/item/bodypart/leg/right/aquatic/digitigrade
	limb_id = SPECIES_DIGI_AQUATIC
	species_id = SPECIES_AQUATIC
	bodyshape = BODYSHAPE_HUMANOID
	footprint_sprite = FOOTPRINT_SPRITE_CLAWS
	footstep_type = FOOTSTEP_MOB_CLAW

/obj/item/bodypart/leg/right/aquatic/digitigrade/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/digitigrade_limb, SPECIES_AQUATIC, initial(limb_id))

/obj/item/bodypart/leg/left/aquatic/digitigrade
	limb_id = SPECIES_DIGI_AQUATIC
	species_id = SPECIES_AQUATIC
	bodyshape = BODYSHAPE_HUMANOID
	footprint_sprite = FOOTPRINT_SPRITE_CLAWS
	footstep_type = FOOTSTEP_MOB_CLAW

/obj/item/bodypart/leg/left/aquatic/digitigrade/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/digitigrade_limb, SPECIES_AQUATIC, initial(limb_id))
