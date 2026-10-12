/datum/lazy_template/mission_type/pirate_comms_outpost
	key = "pirate_comms_outpost"
	map_dir = "_maps/outer_bounds/missions"
	map_name = "test_mid"
	mission_name = "Looter Listening Post"
	mission_description = "Sensors aboard the Wanderstar Perseus have detected unusual communications traffic within the \
		area of interest for the looter threat. Analysis has marked smalltime looter traffic towards what local records identify \
		as an abandoned communications relay from a prior mining operation in the Midway Belt. An away team will be dispatched to the \
		outpost to investigate for looter activity and, if necessary, destruction of communications equipment."

/datum/lazy_template/mission_type/pirate_comms_outpost/create_objectives_lists()
	objectives += new /datum/mission_objective/hunt_mob(OBJECTIVE_ONE_MARKER)
