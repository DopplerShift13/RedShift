/datum/lazy_template/mission_type/pirate_arms_bunker
	key = "pirate_arms_bunker"
	map_dir = "_maps/outer_bounds/missions"
	map_name = "test_end"
	mission_name = "Looter Armaments Bunker"
	mission_description = "In cooperation with Jingwei lookouts, our intelligence has tracked down the precise location of looter operations. \
		A particular area of interest has been identified, a small dockyard that sees high traffic from raider vessels. We suspect it to be a \
		munitions bunker of some form that the looters are using to resupply their vessels between attacks. Mimicing the electronic signature of \
		a raider vessel, a boarding party will be sent to this bunker to destroy the munitions and confiscate supplies for the Wanderstar Perseus mission. \
		Though little resistance is expected on approach due to electronic masking, the looters will figure out pretty quick that they have been \
		tricked once forces enter port, expect heavy resistance inside the bunker."

/datum/lazy_template/mission_type/pirate_arms_bunker/create_objectives_lists()
	objectives += new /datum/mission_objective/hunt_mob(OBJECTIVE_ONE_MARKER)
