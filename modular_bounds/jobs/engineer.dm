/datum/job/outerbounds/engineer
	title = JOB_REDSHIFT_ENGINEER
	description = "The physical half of the Outer Bounds expedition, taking roles anywhere between construction and maintenance, to \
		exploration and colony defense. What they lack in the countless degrees and years of study of the researchers, they make up for \
		in experience and build."
	faction = FACTION_STATION
	total_positions = 20
	spawn_positions = 20
	supervisors = SUPERVISOR_COLONY_ADMIN
	config_tag = "REDSHIFT_ENGINEER"
	outfit = /datum/outfit/job/colony_engineer
	paycheck = PAYCHECK_CREW
	paycheck_department = ACCOUNT_ENG
	display_order = JOB_DISPLAY_ORDER_STATION_ENGINEER
	departments_list = list(/datum/job_department/engineering)
	job_flags = STATION_JOB_FLAGS

/datum/outfit/job/colony_engineer
	name = "Colony Engineer"
	jobtype = /datum/job/outerbounds/engineer

	id_trim = /datum/id_trim/job/station_engineer
	uniform = /obj/item/clothing/under/rank/engineering/engineer/hazard
	belt = /obj/item/storage/belt/utility/full/engi
	ears = /obj/item/radio/headset/headset_eng
	head = /obj/item/clothing/head/utility/hardhat/welding/up
	shoes = /obj/item/clothing/shoes/workboots
	l_pocket = /obj/item/modular_computer/pda/crew/engineering
	r_pocket = /obj/item/t_scanner

	backpack = /obj/item/storage/backpack/industrial
	satchel = /obj/item/storage/backpack/satchel/eng
	duffelbag = /obj/item/storage/backpack/duffelbag/engineering
	messenger = /obj/item/storage/backpack/messenger/eng
	backpack_contents = list()
	box = /obj/item/storage/box/survival/engineer
	pda_slot = ITEM_SLOT_LPOCKET
	skillchips = list(/obj/item/skillchip/job/engineer)
