/datum/lazy_template/mission_type/pirate_intercept_raider
	key = "pirate_intercept_raider"
	map_dir = "_maps/outer_bounds/missions"
	map_name = "test_start"
	mission_name = "Raider Interception"
	mission_description = "Jingwei observation posts have singled out a solo raider vessel on its way back toward the main \
		looter holdout. The Wanderstar Perseus will disable the vessel's engines with weapons fire while launching a simultaneous \
		boarding party to the vessel. Return fire from the vessel is expected to be minimal, however it is likely that at least one \
		looter boarding team will be present aboard the ship."

/datum/lazy_template/mission_type/pirate_intercept_raider/create_objectives_lists()
	objectives += new /datum/mission_objective/hunt_mob(OBJECTIVE_ONE_MARKER)
