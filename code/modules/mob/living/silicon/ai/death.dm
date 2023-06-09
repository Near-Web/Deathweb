/mob/living/silicon/ai/death(gibbed)
	if(stat == DEAD)	return
	stat = DEAD
	if (src.custom_sprite == 1)//check for custom AI sprite, defaulting to blue screen if no.
		icon_state = "[ckey]-ai-crash"
	else icon_state = "ai-crash"
	//update_canmove()
	if(src.eyeobj)
		src.eyeobj.setLoc(get_turf(src))
	/*
	if(blind)	blind.layer = 0
	sight |= SEE_TURFS|SEE_MOBS|SEE_OBJS
	see_in_dark = 8
	see_invisible = SEE_INVISIBLE_LEVEL_TWO
	*/
	var/callshuttle = 0

	for(var/obj/machinery/computer/communications/commconsole in world)
		if(commconsole.z == centcomm_z)
			continue
		if(istype(commconsole.loc,/turf))
			break
		callshuttle++

	for(var/obj/item/circuitboard/communications/commboard in world)
		if(commboard.z == centcomm_z)
			continue
		if(istype(commboard.loc,/turf) || istype(commboard.loc,/obj/item/storage))
			break
		callshuttle++

	for(var/mob/living/silicon/ai/shuttlecaller in player_list)
		if(shuttlecaller.z == centcomm_z)
			continue
		if(!shuttlecaller.stat && shuttlecaller.client && istype(shuttlecaller.loc,/turf))
			break
		callshuttle++

	if(sent_strike_team)
		callshuttle = 0

	if(callshuttle == 3) //if all three conditions are met
		var/obj/item/device/radio/a = new /obj/item/device/radio(null)
		emergency_shuttle.incall(2)
		log_game("All the AIs, comm consoles and boards are destroyed. Pods launched.")
		message_admins("All the AIs, comm consoles and boards are destroyed. Pods launched.", 1)
		a.autosay("Alert: The escape pods are being launched. They will launch in [round(emergency_shuttle.timeleft()/60)] minutes.", "Ulysses Console")
		world << sound('sound/AI/shuttlecalled.ogg')

	if(explosive)
		spawn(10)
			explosion(src.loc, 3, 6, 12, 15)

	for(var/obj/machinery/ai_status_display/O in world) //change status
		spawn( 0 )
		O.mode = 2
		if (istype(loc, /obj/item/device/aicard))
			loc.icon_state = "aicard-404"

	//tod = worldtime2text() //weasellos time of death patch
	//if(mind)	mind.store_memory("Time of death: [tod]", 0)

	return ..(gibbed)
