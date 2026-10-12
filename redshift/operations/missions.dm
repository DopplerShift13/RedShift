/datum/lazy_template/mission_type
	abstract_type = /datum/lazy_template/mission_type
	key = null
	map_dir = "_maps/redshift/missions"
	map_name = null
	/// The name of the mission as described to the players
	var/mission_name = "Unnamed Mission"
	/// Brief description of the mission and what players should expect to see and do
	var/mission_description = "Intelligence has no details to note about this mission, proceed with caution."
	/// List of all mission objectives to get completed before this mission is considered a success
	var/list/objectives = list()
	/// The current status of the mission
	var/mission_status = MISSION_STATUS_LOADING

/// Deletes the map that the mission generated
/datum/lazy_template/mission_type/proc/scrub_mission_map()
	if(length(reservations))
		var/datum/turf_reservation/reservation = reservations[1]
		reservation.Release()

/// Called whenever the mission in charge of us processes, used for checking stats like mission completion
/datum/lazy_template/mission_type/proc/tick(seconds_per_tick)
	SHOULD_CALL_PARENT(TRUE)
	var/concluded_objectives = 0
	if(length(objectives))
		for(var/datum/mission_objective/objective in objectives)
			objective.check_status()
			if(objective.objective_status > OBJECTIVE_INCOMPLETE)
				concluded_objectives++
	if(length(objectives) == concluded_objectives)
		message_admins("Running mission - [mission_name] - has automatically finished due to completed objectives.")
		mission_status = MISSION_STATUS_FINISHED

/// Used to create a list of objectives related to the map
/datum/lazy_template/mission_type/proc/create_objectives_lists()
	SHOULD_CALL_PARENT(FALSE)
	CRASH("Mission type [src] has not properly implemented create_objectives_lists().")
