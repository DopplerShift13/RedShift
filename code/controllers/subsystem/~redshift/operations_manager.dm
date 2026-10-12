PROCESSING_SUBSYSTEM_DEF(operations_manager)
	name = "Operations Manager"
	ss_flags = SS_BACKGROUND
	wait = 5 SECONDS
	/// List of every possible operation we can pick from
	var/list/all_operations = list()
	/// The currently running operation for this round, if any
	var/datum/round_operation_type/running_operation
	/// How many times we get to re-roll the operations list if we don't like our options
	var/rerolls = 1
	/// How many operations should be pickable by the crew
	var/number_of_operations = 3
	/// List of operations that the crew can actually pick from
	var/choosable_operations = list()
	/// If we have already ended the current operation and are going home
	var/going_home = FALSE

/datum/controller/subsystem/processing/operations_manager/Initialize()
	collect_operations_list()
	make_choosable_operations()
	return SS_INIT_SUCCESS

/// Collects every possible operation type into one list for picking from
/datum/controller/subsystem/processing/operations_manager/proc/collect_operations_list()
	all_operations = valid_subtypesof(/datum/round_operation_type)

/// Makes a smaller list of operations that the crew can actually pick from
/datum/controller/subsystem/processing/operations_manager/proc/make_choosable_operations()
	for(var/iterator in 1 to number_of_operations)
		var/operation = pick(all_operations)
		choosable_operations += new operation

/// To be called by a control computer, rerolls the current operations list if we have any rerolls left
/datum/controller/subsystem/processing/operations_manager/proc/reroll_operations()
	if(rerolls < 1)
		return
	make_choosable_operations()

/// Takes an input of an operation datum and makes it our running operation
/datum/controller/subsystem/processing/operations_manager/proc/set_running_operation(var/datum/round_operation_type/new_operation)
	if(isnull(new_operation))
		return
	running_operation = new_operation

/datum/controller/subsystem/processing/operations_manager/fire()
	if(isnull(running_operation))
		return // If we aren't running an operation, don't bother firing
