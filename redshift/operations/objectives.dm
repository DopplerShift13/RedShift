/datum/mission_objective
	abstract_type = /datum/mission_objective
	/// The name of the objective as displayed to players
	var/objective_name = "Unnamed Objective"
	/// Brief description of the objective as displayed to players
	var/objective_description = "Intelligence has no information about this objective. That can't be good."
	/// Text priority for this objective as displayed to players
	var/objective_priority
	/// The status of this objective as incomplete, complete, or failed
	var/objective_status = OBJECTIVE_INCOMPLETE

/datum/mission_objective/New(marker_id)
	if(marker_id)
		var/obj/effect/landmark/spawn_landmark
		for(var/obj/marker in GLOB.landmarks_list)
			if(marker.id_tag == marker_id)
				spawn_landmark = marker
				break
		if(isnull(spawn_landmark))
			CRASH("[src] tried to load without a valid landmark with id \"[marker_id]\" available.")
		spawn_objective_things(get_turf(spawn_landmark))

/// Used to spawn all of the things required by this objective
/datum/mission_objective/proc/spawn_objective_things(turf/spawn_location)
	SHOULD_CALL_PARENT(FALSE)
	return

/// Checks conditions for if this objective should be completed or not. Defaults to instantly completing the objective (to save against bugs)
/datum/mission_objective/proc/check_status()
	SHOULD_CALL_PARENT(FALSE)
	if(objective_status == OBJECTIVE_INCOMPLETE)
		finish_objective(TRUE)

/// Marks the objective as completed and announces it
/datum/mission_objective/proc/finish_objective(success)
	if(success)
		message_admins("Objective - [objective_name] - has been completed and marked as a success.")
		objective_status = OBJECTIVE_COMPLETE
	else
		message_admins("Objective - [objective_name] - has been completed and marked as a failure.")
		objective_status = OBJECTIVE_FAILURE

/// Objectives that spawn a mob/mobs that must be killed to complete
/datum/mission_objective/hunt_mob
	abstract_type = /datum/mission_objective/hunt_mob
	/// List of mobs we are keeping track of
	var/list/tracked_mobs = list()
	/// How many mobs we should spawn
	var/number_to_spawn = 1
	/// What type of mob should we spawn
	var/mob/mob_to_spawn = /mob/living/basic/trooper/pirate/ranged

/datum/mission_objective/hunt_mob/check_status()
	var/points_toward_completion = 0
	if(length(tracked_mobs) < number_to_spawn)
		points_toward_completion += (number_to_spawn - length(tracked_mobs))
	for(var/mob/target_mob in tracked_mobs)
		if(target_mob.stat == DEAD)
			points_toward_completion++
	if(points_toward_completion >= number_to_spawn) // no idea how this would ever be greater than but fuck it hey
		finish_objective(TRUE)

/datum/mission_objective/hunt_mob/spawn_objective_things(turf/spawn_location)
	var/spawn_radius = 1
	if(number_to_spawn > 1)
		spawn_radius = ceil(number_to_spawn * 0.75)
	var/list/valid_spawn_turfs = list()
	for(var/turf/potential_spawn_turf in range(spawn_radius, spawn_location))
		if(get_area(spawn_location) != get_area(potential_spawn_turf))
			continue
		if(potential_spawn_turf.is_blocked_turf(exclude_mobs = TRUE))
			continue
		valid_spawn_turfs += potential_spawn_turf
	for(var/iterator in 1 to number_to_spawn)
		var/turf/picked_spawn_turf = pick(valid_spawn_turfs)
		var/mob/new_mob = new mob_to_spawn(picked_spawn_turf)
		tracked_mobs += new_mob

