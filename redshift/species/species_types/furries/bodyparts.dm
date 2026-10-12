/obj/item/bodypart/head/furries
	icon_greyscale = 'redshift/species/species_types/furries/icons/bodyparts.dmi'
	limb_id = SPECIES_FURRIES
	is_dimorphic = FALSE
	head_flags = HEAD_DEFAULT_FEATURES
	should_draw_greyscale = TRUE
	teeth_count = 32

/obj/item/bodypart/chest/furries
	icon_greyscale = 'redshift/species/species_types/furries/icons/bodyparts.dmi'
	limb_id = SPECIES_FURRIES
	is_dimorphic = TRUE
	should_draw_greyscale = TRUE

/obj/item/bodypart/arm/left/furries
	icon_greyscale = 'redshift/species/species_types/furries/icons/bodyparts.dmi'
	limb_id = SPECIES_FURRIES
	should_draw_greyscale = TRUE
	unarmed_attack_verbs = list("slash", "scratch", "claw")
	unarmed_attack_verbs = list("slashed", "scratched", "clawed")
	grappled_attack_verb = "lacerate"
	grappled_attack_verb_continuous = "lacerates"
	unarmed_attack_effect = ATTACK_EFFECT_CLAW
	unarmed_attack_sound = 'sound/items/weapons/slash.ogg'
	unarmed_miss_sound = 'sound/items/weapons/slashmiss.ogg'

/obj/item/bodypart/arm/right/furries
	icon_greyscale = 'redshift/species/species_types/furries/icons/bodyparts.dmi'
	limb_id = SPECIES_FURRIES
	should_draw_greyscale = TRUE
	unarmed_attack_verbs = list("slash", "scratch", "claw")
	unarmed_attack_verbs = list("slashed", "scratched", "clawed")
	grappled_attack_verb = "lacerate"
	grappled_attack_verb_continuous = "lacerates"
	unarmed_attack_effect = ATTACK_EFFECT_CLAW
	unarmed_attack_sound = 'sound/items/weapons/slash.ogg'
	unarmed_miss_sound = 'sound/items/weapons/slashmiss.ogg'

/obj/item/bodypart/leg/left/furries
	icon_greyscale = 'redshift/species/species_types/furries/icons/bodyparts.dmi'
	limb_id = SPECIES_FURRIES
	footprint_sprite = FOOTPRINT_SPRITE_PAWS
	footstep_type = FOOTSTEP_MOB_CLAW
	should_draw_greyscale = TRUE

/obj/item/bodypart/leg/right/furries
	icon_greyscale = 'redshift/species/species_types/furries/icons/bodyparts.dmi'
	limb_id = SPECIES_FURRIES
	footprint_sprite = FOOTPRINT_SPRITE_PAWS
	footstep_type = FOOTSTEP_MOB_CLAW
	should_draw_greyscale = TRUE

/obj/item/bodypart/leg/right/furries/digitigrade
	limb_id = SPECIES_DIGI_FURRIES
	species_id = SPECIES_FURRIES
	bodyshape = BODYSHAPE_HUMANOID
	footprint_sprite = FOOTPRINT_SPRITE_PAWS
	footstep_type = FOOTSTEP_MOB_CLAW

/obj/item/bodypart/leg/right/furries/digitigrade/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/digitigrade_limb, SPECIES_FURRIES, initial(limb_id))

/obj/item/bodypart/leg/left/furries/digitigrade
	limb_id = SPECIES_DIGI_FURRIES
	species_id = SPECIES_FURRIES
	bodyshape = BODYSHAPE_HUMANOID
	footprint_sprite = FOOTPRINT_SPRITE_PAWS
	footstep_type = FOOTSTEP_MOB_CLAW

/obj/item/bodypart/leg/left/furries/digitigrade/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/digitigrade_limb, SPECIES_FURRIES, initial(limb_id))
