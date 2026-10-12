/datum/round_operation_type/pirate_first_strike

/datum/round_operation_type/pirate_first_strike/set_up_operation_presentation()
	operation_name = "Looters - [pick_list_replacements(text_replace_path, "alpha_strike")]"
	operation_description = "Local system jingwei has recorded increased looter activity within the \
		Midway Belt, and reports they are likely preparing for an attack on one of the nearby colonies. \
		Due to their lack of manpower available for an assault on the looters' gathering point, they have \
		requested our help with eliminating this threat before it becomes a danger to sophont lives."

/datum/round_operation_type/pirate_first_strike/build_mission_queue()
	missions_queue += new /datum/lazy_template/mission_type/pirate_intercept_raider
	missions_queue += new /datum/lazy_template/mission_type/pirate_comms_outpost
	missions_queue += new /datum/lazy_template/mission_type/pirate_arms_bunker
