/obj/item/circuitboard/computer/operations_center
	name = "Operations Center"
	greyscale_colors = CIRCUIT_COLOR_COMMAND
	build_path = /obj/machinery/computer/operations_center

/obj/machinery/computer/operations_center
	name = "operations center control board"
	desc = "The central control board for the Wanderstar Perseus, in charge of all ground operations beginning in the ship. \
		Intelligence collected by on-board officers or by local system jingwei relayed to the ship will be presented here in the \
		form of operations packets that can be browsed through and acted upon. Due to the sensitive nature of the information on this \
		board, access is only granted to officers with intelligence access."
	icon_screen = "supply"
	circuit = /obj/item/circuitboard/computer/operations_center
	light_color = COLOR_BRIGHT_ORANGE

#define MENU_NEXT_MISSION "Begin Next Mission"
#define MENU_SURRENDER_MISSION "Surrender Current Mission"
#define MENU_CLEANUP_MISSION "Leave Current Mission Area"
#define MENU_GO_HOME "Conclude Operation"
#define MENU_PICK_OPERATION "Pick Operation"
#define MENU_REROLL_OPERATIONS "Reroll Operations"

/obj/machinery/computer/operations_center/interact(mob/user)
	. = ..()
	if(SSoperations_manager.going_home)
		balloon_alert(user, "no more operations today!")
		return
	var/list/menu_options = list()
	var/datum/round_operation_type/current_operation = SSoperations_manager.running_operation
	if(!isnull(current_operation))
		if(length(current_operation.missions_queue) && !current_operation.current_mission)
			menu_options += MENU_NEXT_MISSION
		if(current_operation.current_mission?.mission_status == MISSION_STATUS_RUNNING)
			menu_options += MENU_SURRENDER_MISSION
		if(current_operation.current_mission?.mission_status == MISSION_STATUS_FINISHED)
			menu_options += MENU_CLEANUP_MISSION
		if(!length(current_operation.missions_queue) && !current_operation.current_mission)
			menu_options += MENU_GO_HOME
	else
		menu_options += MENU_PICK_OPERATION
		if(SSoperations_manager.rerolls)
			menu_options += MENU_REROLL_OPERATIONS
	if(!length(menu_options))
		balloon_alert(user, "no menu options!")
		return

	var/menu_option = tgui_input_list(user, "Ops Center Action", "Operations Center Control Board", menu_options)
	if(!menu_option)
		balloon_alert(user, "no selection!")
		return
	if(!can_interact(user))
		return // YOU CANNOT ESCAPE

	switch(menu_option)
		if(MENU_NEXT_MISSION)
			current_operation.current_mission = current_operation.missions_queue[1]
			current_operation.start_current_mission()
		if(MENU_SURRENDER_MISSION)
			current_operation.give_up_on_mission()
		if(MENU_CLEANUP_MISSION)
			current_operation.end_current_mission(FALSE)
		if(MENU_GO_HOME)
			SSshuttle.requestEvac(user, "This rotation's operation has completed, the Wanderstar Perseus is returning to \
				the resupply ship to re-arm before the next operation begins.")
			SSoperations_manager.going_home = TRUE
		if(MENU_PICK_OPERATION)
			pick_operations(user)
		if(MENU_REROLL_OPERATIONS)
			if(SSoperations_manager.rerolls) // Just to be safe
				SSoperations_manager.reroll_operations()

/// Gives a list of available operations from SSoperations_manager and lets the user pick one
/obj/machinery/computer/operations_center/proc/pick_operations(mob/user)
	if(!can_interact(user))
		return
	var/datum/round_operation_type/picked_operation = tgui_input_list(user, "Pick Operation", "Operations Center Control Board", SSoperations_manager.choosable_operations)
	if(!picked_operation)
		balloon_alert(user, "no choice made!")
		return
	var/operation_accepted = tgui_alert(user, picked_operation.operation_description, "Operation Details", list("Accept", "Decline"))
	if(operation_accepted != "Accept")
		balloon_alert(user, "operation declined!")
		return
	SSoperations_manager.running_operation = picked_operation
	balloon_alert(user, "operation accepted")
