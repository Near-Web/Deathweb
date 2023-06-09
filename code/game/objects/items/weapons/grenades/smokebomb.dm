/obj/item/grenade/smokebomb
	desc = "It is set to detonate in 2 seconds."
	name = "smoke grenade"
	icon = 'icons/obj/grenade.dmi'
	icon_state = "smokebomb"
	det_time = 20
	item_state = "flashbang"
	flags = FPRINT | TABLEPASS
	slot_flags = SLOT_BELT
	var/datum/effect/effect/system/smoke_spread/bad/smoke

	New()
		..()
		src.smoke = new /datum/effect/effect/system/smoke_spread/bad
		src.smoke.attach(src)

	prime()
		playsound(src.loc, 'sound/effects/smoke.ogg', 50, 1, -3)
		src.smoke.set_up(10, 0, usr.loc)
		spawn(0)
			src.smoke.start()
			sleep(10)
			src.smoke.start()
			sleep(10)
			src.smoke.start()
			sleep(10)
			src.smoke.start()

		sleep(80)
		qdel(src)
		return

/obj/item/grenade/smokebomb/church
	desc = "It is set to detonate in 2 seconds."
	name = "gas grenade"
	icon = 'icons/obj/grenade.dmi'
	icon_state = "churchgas"
	det_time = 20
	item_state = "flashbang"
	flags = FPRINT | TABLEPASS
	slot_flags = SLOT_BELT
	var/datum/effect/effect/system/smoke_spread/mustard/smoke2

	New()
		..()
		src.smoke2 = new /datum/effect/effect/system/smoke_spread/mustard
		src.smoke2.attach(src)

	prime()
		playsound(src.loc, 'sound/effects/bang.ogg', 25, 1)
		playsound(src.loc, 'sound/effects/smoke.ogg', 50, 1, -3)
		src.icon_state = "churchgas_active"
		src.smoke2.set_up(10, 0, usr.loc)
		spawn(0)
			src.smoke2.start()
			sleep(10)
			src.smoke2.start()
			sleep(10)
			src.smoke2.start()
			sleep(10)
			src.smoke2.start()
		sleep(80)
		qdel(src)
		return
