#define LANGUAGE_UNDERSTOOD	1
#define LANGUAGE_SPOKEN	2

// LANGUAGE SOURCE DEFINES
/// Use this when granting languages in special() for spawner roles, to prevent prefs from removing them
#define LANGUAGE_SPAWNER "spawner"
#define LANGUAGE_FLAGS "flags"
#define LANGUAGE_KNOWLEDGE "lang_knowledge"

/// List if all language typepaths learnable, i.e. those with keys, sorted by default_priority.
/// Used by the language menu to determine display priority.
GLOBAL_LIST_INIT(all_languages_by_priority, init_all_languages_by_priority())

/proc/init_all_languages_by_priority()
	var/list/lang_list = list()
	for(var/datum/language/lang_type as anything in typesof(/datum/language))
		if(!initial(lang_type.key))
			continue
		lang_list += lang_type
	sortTim(lang_list, cmp = GLOBAL_PROC_REF(cmp_language_priority_dsc))
	return lang_list

/// Sorts languages based on their default_priority, in descending order.
/proc/cmp_language_priority_dsc(datum/language/lang_a, datum/language/lang_b)
	return lang_b.default_priority - lang_a.default_priority
