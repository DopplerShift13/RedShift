/obj/item/organ/tongue/get_possible_languages()
	var/list/langs = ..()
	// langs += /datum/language/crusoeslocal
	// langs += /datum/language/konjin
	// langs += /datum/language/gutter
	// langs += /datum/language/carptongue
	// langs += /datum/language/slime
	// langs += /datum/language/nambuni
	return langs

/datum/language/common
	name = "Pan-Persean"
	desc = "The language spoken most commonly between all of the members of the Associated Sophonts of the Perseus Arm. A rough \
		mixture of languages between the many dialects of the Cenerians and the Perseans from the oldest days of the first cooperative efforts of both species. \
		Though the language has been modified with loanwords and patterns from other languages as they are added to the association, the \
		language is still recognizable as mostly true to its origins."
	space_chance = 50
	syllables = list(
		"ce", "le", "est", "ial",
		"e",
		"al", "el", "af", "ef", "as", "es",
		"eol", "eul",
		"be", "re", "ke", "ca", "la", "sa",
		"het", "hel", "lak", "rek", "ret", "kes",
		"drak", "drek", "dret",
		"ath", "eth", "ekh", "skh",
		"cala", "kesa", "resa",
		"beskh", "shekk", "sha",
		"fii", "sii", "rii", "rel",
		"hil", "losk",
		"i", "vii", "vuo", "eil", "tun", "gå", "det", "att", "ok",
		"qi", "lao", "gao", "cai", "zun", "xuan", "ai", "feng",
		"l'e",
		"arf", "dråk", "xuån", "fek", "laosk",
	)
	special_characters = list("-")
	icon_state = "persean"
	icon = 'redshift/languages/icons/language.dmi'
	mutual_understanding = list(
		/datum/language/uncommon = 40,
	)

/datum/language/uncommon
	name = "Roughneck Pidgins"
	desc = "A mashed-up, heavily accented child of Pan-Persean. Often spoken by roughnecks and colonists, or any of the many \
		hard working low-brow types you find out on the frontier. While the language is still, primarily by technicality, related to \
		Pan-Persean, the differences in how it is spoken are severe enough to be classified as its own language."
	default_priority = 98
	syllables = list(
		"e",
		"al", "el", "af", "ef", "as", "es",
		"eol", "eul",
		"be", "re", "ke", "ca", "la", "sa",
		"het", "hel", "lak", "rek", "ret", "kes",
		"drak", "drek", "dret",
		"ath", "eth", "ekh", "skh",
		"cala", "kesa", "resa",
		"ri", "ha", "ho", "do",
		"rie",
		"bhe", "dha", "dhe", "cso",
		"jha", "jaho", "jhe", "kha", "khe",
		"sha", "she", "feh", "fre",
		"mazz", "mezz", "mohk", "nett", "nott", "kott",
		"takh", "tash", "tesh", "tekh", "vesh", "vekh",
		"hesh", "zekh", "rakh",
		"beskh", "shekk",
		"khet", "ghes", "ghos",
		"ar",
		"aur", "arh",
		"osh", "okh", "esh",
		"iash", "iakh", "iokh", "lahk", "lekh",
		"fii", "sii", "rii", "tol", "tok", "dia", "eres", "aere",
		"hil", "losk",
	)
	special_characters = list("-")
	mutual_understanding = list(
		/datum/language/common = 90,
	)
