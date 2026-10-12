/datum/job/redshift/research
	title = JOB_REDSHIFT_RESEARCH
	description = "The thinking half of the Outer Bounds expedition. Doctors, scientists, lab techs, everything in between and a few things \
		more. While not usually as physically active as their engineer counterparts, they more than make up for this by being the scientific and \
		medical backbone of the colony."
	faction = FACTION_STATION
	total_positions = 20
	spawn_positions = 20
	supervisors = SUPERVISOR_COLONY_ADMIN
	config_tag = "REDSHIFT_RESEARCH"
	outfit = /datum/outfit/job/colony_researcher
	paycheck = PAYCHECK_CREW
	paycheck_department = ACCOUNT_SCI
	display_order = JOB_DISPLAY_ORDER_SCIENTIST
	departments_list = list(/datum/job_department/science)
	job_flags = STATION_JOB_FLAGS

/datum/outfit/job/colony_researcher
	name = "Colony Researcher"
	jobtype = /datum/job/redshift/research

	id_trim = /datum/id_trim/job/scientist
	uniform = /obj/item/clothing/under/rank/rnd/research_director/turtleneck
	belt = /obj/item/storage/belt/utility/full/engi
	ears = /obj/item/radio/headset/headset_sci
	head = /obj/item/clothing/head/beret/science
	shoes = /obj/item/clothing/shoes/jackboots
	l_pocket = /obj/item/modular_computer/pda/crew/science
	r_pocket = /obj/item/clipboard

	backpack = /obj/item/storage/backpack/science
	satchel = /obj/item/storage/backpack/satchel/science
	duffelbag = /obj/item/storage/backpack/duffelbag/science
	messenger = /obj/item/storage/backpack/messenger/science
	backpack_contents = list()
	box = /obj/item/storage/box/survival/engineer
	pda_slot = ITEM_SLOT_LPOCKET
	skillchips = list(/obj/item/skillchip/job/roboticist)
