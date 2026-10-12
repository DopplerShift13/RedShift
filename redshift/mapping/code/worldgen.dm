/datum/map_generator/surface_generator
	/// Used to select "zoom" level into the perlin noise, higher numbers result in slower transitions
	var/perlin_zoom = 20

/datum/map_generator/surface_generator/generate_terrain(list/turfs, area/generate_in)
	. = ..()
	var/generator_seed = rand(0, 50000)

	for(var/t in turfs) //Go through all the turfs and generate them
		var/turf/gen_turf = t
		var/drift_x = gen_turf.x / perlin_zoom
		var/drift_y = gen_turf.y / perlin_zoom

		var/generate_closed = FALSE

		var/datum/biome/selected_biome
		var/biome_noise = text2num(rustg_noise_get_at_coordinates("[generator_seed]", "[drift_x]", "[drift_y]"))

		switch(biome_noise)
			if(0 to 0.02)
				selected_biome = /datum/biome/gateway_deep_water
			if(0.02 to 0.1)
				selected_biome = /datum/biome/gateway_water
			if(0.1 to 0.25)
				selected_biome = /datum/biome/gateway_mud
			if(0.25 to 0.75)
				selected_biome = /datum/biome/gateway_dirt
			if(0.75 to 0.85)
				selected_biome = /datum/biome/gateway_mountain
			if(0.85 to 1)
				selected_biome = /datum/biome/gateway_mountain
				generate_closed = TRUE
		selected_biome = SSmapping.biomes[selected_biome] //Get the instance of this biome from SSmapping
		selected_biome.generate_turf(gen_turf, generate_closed)
		CHECK_TICK
