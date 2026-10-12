/// Checks if a mob's name should be coloured based off the preferences of the hearer
/proc/chat_name_color_prefs_check(mob/source, mob/hearer, specific_name)
	if(hearer.client?.prefs?.read_preference(/datum/preference/toggle/chat_name_coloring))
		return "<span style='color: [source.chat_color]'><b>[specific_name ? specific_name : source]</b></span>"
	else
		return "<b>[specific_name ? specific_name : source]</b>"

/// Checks if a message should have a space in front of it or not
/proc/should_have_space_before_emote(string)
	var/static/regex/no_spacing_emote_characters = regex(@"(,|')")
	return no_spacing_emote_characters.Find(string) ? FALSE : TRUE
