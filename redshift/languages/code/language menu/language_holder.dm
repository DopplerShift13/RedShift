GLOBAL_DATUM_INIT(language_holder_adjustor, /datum/language_holder_adjustor, new)

/// Language code needs to be purged. Make sure, once and for all, that we get the correct languages on spawn.
/// Every time a crew member joins the adjustor will personally fix their language, because there is too much coupling between mind and language code to do it reliably otherwise.
/// It has already needed to be fixed like 3 times. This will (hopefully) be the final time.
/datum/language_holder_adjustor/New()
	RegisterSignal(SSdcs, COMSIG_GLOB_CREWMEMBER_JOINED, PROC_REF(handle_new_player))
	RegisterSignal(SSdcs, COMSIG_GLOB_MOB_LOGGED_IN, PROC_REF(handle_new_player))

/datum/language_holder_adjustor/proc/handle_new_player(datum/source, mob/living/carbon/human/new_crewmember, rank)
	SIGNAL_HANDLER

	// sanity checking because we really do not want to be causing any runtimes
	if(!istype(new_crewmember))
		return
	if(isnull(new_crewmember.mind))
		return

	var/datum/language_holder/language_holder = new_crewmember.get_language_holder()

	if(isnull(language_holder))
		return

	language_holder.adjust_languages_to_prefs(new_crewmember.client?.prefs)

/datum/language_holder_adjustor/Destroy()
	..()
	UnregisterSignal(SSdcs, COMSIG_GLOB_CREWMEMBER_JOINED, COMSIG_GLOB_MOB_LOGGED_IN)

/datum/language_holder/proc/adjust_languages_to_prefs(datum/preferences/preferences)
	// no prefs? then don't remove any languages
	if(!preferences)
		return

	// remove the innate languages (like common, and other species languages) and instead use the language prefs
	// do not remove any languages granted by spawners, which are denoted by source = LANGUAGE_SPAWNER
	remove_languages_by_source(list(LANGUAGE_MIND, LANGUAGE_ATOM, LANGUAGE_SPECIES))

	for(var/lang_path in preferences.languages)
		grant_language(lang_path)
		var/partial_understanding_level = preferences.languages[lang_path][LANGUAGE_KNOWLEDGE]
		if (isnull(partial_understanding_level) || isnan(partial_understanding_level))
			partial_understanding_level = 100
		else if (partial_understanding_level < 100)
			remove_language(lang_path, UNDERSTOOD_LANGUAGE, LANGUAGE_MIND) // UPDATE NOTES - if the source default arg of granted_lang ever changes, change LANGUAGE_MIND
			grant_partial_language(lang_path, partial_understanding_level)

	get_selected_language()

/// Removes every language whose source(s) match the provided source list arg
/datum/language_holder/proc/remove_languages_by_source(list/sources)
	if(!length(sources))
		return
	for(var/language in understood_languages)
		for(var/source in sources)
			remove_language(language, ALL, source)
	// in most cases spoken_languages should be empty by now, but just in case we should remove what's left
	for(var/language in spoken_languages)
		for(var/source in sources)
			remove_language(language, ALL, source)
