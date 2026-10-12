/datum/biome/gateway_deep_water
	open_turf_type = /turf/open/water/deep_beach/planetary
	flora_density = 0
	feature_density = 10
	fauna_density = 0
	flora_types = list()
	feature_types = list(
		/obj/structure/flora/rock/pile/style_random,
	)
	fauna_types = list()
	feature_exclusion_radius = 5
	mob_exclusion_radius = 12

/datum/biome/gateway_water
	open_turf_type = /turf/open/water/beach/planetary
	flora_density = 25
	feature_density = 0
	fauna_density = 0
	flora_types = list(
		/obj/structure/flora/bush/style_random,
	)
	feature_types = list()
	fauna_types = list()
	feature_exclusion_radius = 5
	mob_exclusion_radius = 12

/datum/biome/gateway_mud
	open_turf_type = /turf/open/misc/dirt/dark/jungle
	flora_density = 40
	feature_density = 0
	fauna_density = 0
	flora_types = list(
		/obj/structure/flora/grass/jungle/a/style_random = 1,
		/obj/structure/flora/grass/jungle/b/style_random = 1,
	)
	feature_types = list()
	fauna_types = list()
	feature_exclusion_radius = 5
	mob_exclusion_radius = 12

/datum/biome/gateway_dirt
	open_turf_type = /turf/open/misc/dirt/jungle
	flora_density = 60
	feature_density = 0
	fauna_density = 0
	flora_types = list(
		/obj/structure/flora/bush/style_random = 5,
		/obj/structure/flora/tree/jungle/small/style_random = 1,
	)
	feature_types = list()
	fauna_types = list()
	feature_exclusion_radius = 5
	mob_exclusion_radius = 12

/datum/biome/gateway_mountain
	open_turf_type = /turf/open/misc/asteroid
	closed_turf_type = /turf/closed/mineral
	flora_density = 0
	feature_density = 20
	fauna_density = 0
	flora_types = list()
	feature_types = list(
		/obj/structure/flora/rock/pile/style_random = 1,
	)
	fauna_types = list()
	feature_exclusion_radius = 5
	mob_exclusion_radius = 12
