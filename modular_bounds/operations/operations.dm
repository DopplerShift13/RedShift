/datum/round_operation_type
	abstract_type = /datum/round_operation_type
	/// The name of the operation as displayed to players
	var/operation_name = "Operation Untitled"
	/// A brief description of the operation and what it may contain
	var/operation_description = "Intelligence reports have no data for this operation. Proceed with caution."
	/// List of mission datums in order of when they will be run
	var/list/missions_queue = list()
	/// The mission we are currently running
	var/datum/lazy_template/mission_type/current_mission
	/// The time that the operation started in world.time
	var/operation_start_time
	/// The file path for text replacements used in operation names
	var/text_replace_path = "~redshift/operations_missions.json"

/datum/round_operation_type/New()
	set_up_operation_presentation()
	build_mission_queue()
	operation_start_time = world.time
	START_PROCESSING(SSoperations_manager, src)

/datum/round_operation_type/process(seconds_per_tick)
	if(!isnull(current_mission))
		if(current_mission.mission_status == MISSION_STATUS_RUNNING)
			current_mission.tick(seconds_per_tick)

/// Loads the current mission's map into the world and starts the mission
/datum/round_operation_type/proc/start_current_mission()
	current_mission.lazy_load()
	message_admins("New mission - [current_mission.mission_name] - has been started by the crew.")
	current_mission.create_objectives_lists()
	current_mission.mission_status = MISSION_STATUS_RUNNING

/// Instantly gives up on the current mission and allows the map to cleanup when wanted if it turns out to be too difficult
/datum/round_operation_type/proc/give_up_on_mission()
	message_admins("Running mission - [current_mission.mission_name] - has finished due to the crew surrendering the mission.")
	current_mission.mission_status = MISSION_STATUS_FINISHED

/// Sets the current mission to be ending and deletes the map after giving it time to clean up and rescue any mobs still present
/datum/round_operation_type/proc/end_current_mission(forced_instant)
	message_admins("Running mission - [current_mission.mission_name] - has begun cleanup, manually triggered by the crew.")
	current_mission.mission_status = MISSION_STATUS_CLEANING
	if(forced_instant)
		delete_current_map()
	else
		addtimer(CALLBACK(src, PROC_REF(delete_current_map)), 30 SECONDS)

/// Tells the current mission to delete itself
/datum/round_operation_type/proc/delete_current_map()
	current_mission.scrub_mission_map()
	missions_queue -= current_mission
	qdel(current_mission, TRUE)
	current_mission = null

/// Should be used for anything visual or player-facing for the operation, such as title, description, or an icon
/datum/round_operation_type/proc/set_up_operation_presentation()
	SHOULD_CALL_PARENT(FALSE)
	CRASH("Operation [src] has not properly implmeneted a set_up_operation_presentation().")

/// Constructs a list of mission type datums depending on operation length, must be overwritten by children
/datum/round_operation_type/proc/build_mission_queue()
	SHOULD_CALL_PARENT(FALSE)
	CRASH("Operation [src] has not properly implmeneted a build_mission_queue().")
