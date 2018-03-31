//Very basic escalation 1983 gamemode. has no objectives, admins have to set everything.

/datum/game_mode/wargames
	name = "Escalation 1983"
	config_tag = "wargames"
	required_players = 0
	round_description = "Teams battle for supremacy!"
	extended_round_description = "This gamemode requires admins."
	ert_disabled = 1
	addantag_allowed = ADDANTAG_ADMIN //Only admins can add antags. This should be disabled in config anyway
	wargames = 1
	autobalance = 0
	admin_enabled_joining = 0 //Has to be accepted by admins before round can start

/datum/game_mode/wargames/announce()
	to_world("<B>The current game mode is [capitalize(name)]!</B> [round_description]")
	return

/datum/game_mode/wargames/startRequirements()
	if(all_army_in_game.len < minimum_teams)
		return "Not enough fighting teams have been selected! Required teams - [minimum_teams]."

	//Add # of players joined requirements here

	return 0

/datum/game_mode/wargames/pre_setup()
	return

/datum/game_mode/wargames/post_setup()
	feedback_set_details("round_start","[time2text(world.realtime)]")
	if(ticker && ticker.mode)
		feedback_set_details("game_mode","[ticker.mode]")
	feedback_set_details("server_ip","[world.internet_address]:[world.port]")
	return 1

/datum/game_mode/wargames/announce_ert_disabled()
	return

/datum/game_mode/wargames/check_finished()
	if(station_was_nuked) return 1
	return admin_ended_round

/datum/game_mode/wargames/declare_completion()
	to_world(show_statistic())
	return 0