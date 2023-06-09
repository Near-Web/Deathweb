/* Weapons
 * Contains:
 *		Banhammer
 *		Sword
 *		Classic Baton
 *		Energy Blade
 *		Energy Axe
 *		Energy Shield
 */

/*
 * Banhammer
 */
/obj/item/banhammer/attack(mob/M as mob, mob/user as mob)
	M << "<font color='red'><b> You have been banned FOR NO REISIN by [user]<b></font>"
	user << "<font color='red'> You have <b>BANNED</b> [M]</font>"

/*
 * Sword
 */
/obj/item/melee/energy/sword/IsShield()
	return 0

/obj/item/melee/energy/sword/New()
	item_color = pick("red","blue","green","purple")

/obj/item/melee/energy/sword/attack_self(mob/living/user as mob)
	if ((CLUMSY in user.mutations) && prob(50))
		user << "\red You accidentally cut yourself with [src]."
		user.take_organ_damage(5,5)
	active = !active
	if (active)
		force = 80
		force_wielded = 82
		force_unwielded = 80
		sharp = 1
		edge = 0
		if(istype(src,/obj/item/melee/energy/sword/pirate))
			icon_state = "cutlass1"
		else
			icon_state = "sword1"
		w_class = 4
		playsound(user, 'sound/weapons/saberon.ogg', 50, 1)
		user << "\blue [src] is now active."
		set_light(2, 1, "#0000CC")

	else
		force = 6
		force_wielded = 8
		force_unwielded = 6
		sharp = 0
		edge = 0
		if(istype(src,/obj/item/melee/energy/sword/pirate))
			icon_state = "cutlass0"
		else
			icon_state = "sword0"
		w_class = 2
		playsound(user, 'sound/weapons/saberoff.ogg', 50, 1)
		user << "\blue [src] can now be concealed."
		set_light(0)

	if(istype(user,/mob/living/carbon/human))
		var/mob/living/carbon/human/H = user
		H.update_inv_l_hand()
		H.update_inv_r_hand()

	add_fingerprint(user)
	return

/*
 * Classic Baton
 */
/obj/item/melee/classic_baton
	name = "baton"
	desc = "A truncheon for beating criminal scum."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "insecure_baton"
	item_state = "baton"
	flags = FPRINT | TABLEPASS
	force = 30
	force_wielded = 35
	force_unwielded = 30
	drop_sound = 'sound/items/wooden_drop.ogg'
	speciality = SKILL_SWING
	hitsound = 'sound/weapons/classic_baton.ogg'
	attack_verb = list("smashes", "bludgeons", "clubs")
	weaponteaching = "CLUB"

/obj/item/melee/classic_baton/tonfa
	name = "baton"
	desc = "A truncheon for beating criminal scum."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "insecure_baton"
	item_state = "baton"
	flags = FPRINT | TABLEPASS
	force = 30
	force_wielded = 35
	force_unwielded = 30
	drop_sound = 'sound/items/wooden_drop.ogg'
	speciality = SKILL_SWING
	slot_flags = SLOT_BELT
	hitsound = 'sound/weapons/classic_baton.ogg'
	attack_verb = list("smashes", "bludgeons", "clubs")
	weaponteaching = "CLUB"

/obj/item/melee/classic_baton/boneclub
	name = "bone club"
	desc = "A bone club."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "boneclub"
	blunt = TRUE
	item_state = "boneclub"
	flags = FPRINT | TABLEPASS
	slot_flags = SLOT_BELT
	force = 25
	force_wielded = 30
	force_unwielded = 25
	parry_chance = -5
	item_worth = 2
	hitsound= 'sound/weapons/club.ogg'
	weapon_speed_delay = 20

/obj/item/melee/classic_baton/woodenclub
	name = "wooden club"
	desc = "A wooden makeshift club."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "wclub"
	item_state = "wdclub"
	flags = FPRINT | TABLEPASS
	blunt = TRUE
	slot_flags = SLOT_BELT
	drop_sound = 'sound/items/wooden_drop.ogg'
	force = 25
	force_wielded = 30
	force_unwielded = 25
	parry_chance = 5
	item_worth = 2
	hitsound= 'sound/weapons/club.ogg'
	weapon_speed_delay = 20

/obj/item/melee/classic_baton/club
	name = "club"
	desc = "Bash over some heads."
	icon = 'icons/obj/weapons.dmi'
	blunt = TRUE
	icon_state = "club"
	item_state = "club"
	flags = FPRINT | TABLEPASS
	slot_flags = SLOT_BELT
	force = 30
	force_wielded = 40
	force_unwielded = 30
	parry_chance = 5
	item_worth = 16
	hitsound = "hitsound"
	hitsound= 'sound/weapons/club.ogg'
	weapon_speed_delay = 20
	drawsound = 'sound/weapons/mace_draw.ogg'

/obj/item/melee/classic_baton/smallclub
	name = "small club"
	desc = "Bash over some heads."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "oclub"
	item_state = "xclub"
	flags = FPRINT | TABLEPASS
	slot_flags = SLOT_BELT
	force = 15
	force_wielded = 20
	force_unwielded = 15
	parry_chance = 10
	item_worth = 8
	hitsound= 'sound/weapons/club.ogg'
	weapon_speed_delay = 12

/obj/item/melee/classic_baton/mace
	name = "\improper Mace"
	desc = "Bash over some heads."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "steelmace"
	item_state = "xmace"
	flags = FPRINT | TABLEPASS
	slot_flags = SLOT_BELT
	force = 30
	force_wielded = 35
	force_unwielded = 30
	parry_chance = 10
	item_worth = 16
	hitsound= 'sound/weapons/club.ogg'
	weapon_speed_delay = 19
	weight = 3
	drawsound = 'sound/weapons/mace_draw.ogg'

/obj/item/melee/classic_baton/iflail
	name = "\improper Mace"
	desc = "Bash over some heads."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "iflail"
	item_state = "flail"
	flags = FPRINT | TABLEPASS
	slot_flags = SLOT_BELT
	force = 30
	force_wielded = 35
	force_unwielded = 30
	parry_chance = 10
	item_worth = 16
	hitsound= 'sound/weapons/club.ogg'
	weapon_speed_delay = 19
	weight = 3
	drawsound = 'sound/weapons/mace_draw.ogg'

/obj/item/melee/classic_baton/club1
	name = "steel club"
	desc = "Bash over some heads."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "club0"
	item_state = "xmace"
	flags = FPRINT | TABLEPASS
	slot_flags = SLOT_BELT
	force = 30
	force_wielded = 35
	force_unwielded = 30
	parry_chance = 10
	item_worth = 16
	hitsound= 'sound/weapons/club.ogg'
	weapon_speed_delay = 16
	weight = 3
	drawsound = 'sound/weapons/mace_draw.ogg'

/obj/item/melee/classic_baton/club/chain
	name = "chain"
	icon_state = "chain"
	item_state = "chain"
	force = 16
	force_wielded = 20
	force_unwielded = 16
	drop_sound = 'sound/effects/chainarmor_drop.ogg'
	drawsound = 'sound/effects/chain_misc.ogg'
	parry_chance = -5
	item_worth = 16
	hitsound = "hitsound"
	weapon_speed_delay = 20

/obj/item/melee/classic_baton/sewer_hatch
	name = "sewer hatch"
	desc = ""
	icon = 'icons/obj/miscobjs.dmi'
	blunt = TRUE
	icon_state = "shatch"
	item_state = "shatch"
	flags = FPRINT | TABLEPASS
	force = 8
	force_wielded = 25
	force_unwielded = 8
	parry_chance = -20
	weight = 70
	item_worth = 5
	speciality = SKILL_FLAIL
	hitsound = "hitsound"
	hitsound= 'sound/weapons/club.ogg'
	weapon_speed_delay = 25
	smelted_return = /obj/item/ore/refined/lw/ironlw

/obj/item/melee/classic_baton/slab
	name = "slab"
	desc = "A blunt, stone sword. This weapon's clearly impractical... right?"
	icon = 'icons/obj/weapons.dmi'
	blunt = TRUE
	icon_state = "slab"
	item_state = "slab"
	flags = FPRINT | TABLEPASS
	force = 25
	force_wielded = 65
	force_unwielded = 25
	parry_chance = 10
	item_worth = 1
	weight = 40
	hitsound = "hitsound"
	hitsound= 'sound/weapons/club.ogg'
	weapon_speed_delay = 25
	drop_sound = 'sound/effects/stonestone.ogg'

/obj/item/melee/classic_baton/club/bronze
	name = "bronze mace"
	desc = "Bash over some heads."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "lclub"
	item_state = "xclub"
	flags = FPRINT | TABLEPASS
	slot_flags = SLOT_BELT
	force = 25
	force_wielded = 30
	force_unwielded = 25
	parry_chance = 5
	item_worth = 6
	hitsound = "hitsound"
	weapon_speed_delay = 20
	smelted_return = /obj/item/ore/refined/lw/copperlw

/obj/item/melee/classic_baton/club/knuckleduster
	name = "knuckle duster"
	desc = "Bash over some heads."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "knuckleduster"
	item_state = ""
	flags = FPRINT | TABLEPASS
	force = 15
	force_wielded = 15
	force_unwielded = 15
	parry_chance = 1
	w_class = 2.0
	item_worth = 0
	hitsound = "hitsound"
	speciality = SKILL_UNARM
	weapon_speed_delay = 8
	drawsound = null
	smelted_return = /obj/item/ore/refined/lw/silverlw

/obj/item/melee/classic_baton/club/knuckleduster/wield(mob/user)
	to_chat(user, "How would I wield a knuckle duster!?")
	return

/obj/item/melee/classic_baton/crossofravenheart
	name = "Enoch's Gift"
	desc = "The holy cross of Enoch's Gate, gifted to the Baron's ancestor by Enoch himself."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "icross"
	item_state = "icross"
	silver = TRUE
	flags = FPRINT | TABLEPASS
	slot_flags = SLOT_BELT
	force = 20
	force_wielded = 26
	force_unwielded = 20
	parry_chance = 15
	item_worth = 1200 // Not gonna touch this for now. But it is an artifact!
	hitsound= 'sound/weapons/club.ogg'
	weapon_speed_delay = 20
	smelted_return = /obj/item/ore/refined/lw/silverlw

/obj/item/melee/classic_baton/staff
	name = "steel staff"
	desc = "A steel quarterstaff commonly used by wandering monks"
	icon = 'icons/obj/weapons.dmi'
	icon_state = "monkstaff"
	item_state = "monkstaff"
	flags = FPRINT | TABLEPASS
	slot_flags = SLOT_BACK
	w_class = 5
	force = 20
	force_wielded = 25
	force_unwielded = 20
	parry_chance = 75
	item_worth = 30
	hitsound = "hitsound"
	speciality = SKILL_STAFF
	smelted_return = /obj/item/ore/refined/lw/steellw

/obj/item/melee/classic_baton/klevetz
	name = "steel klevetz"
	desc = "Bash over some heads."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "klevec"
	item_state = "klevec"
	hitsound= 'sound/weapons/klevec.ogg'
	flags = FPRINT | TABLEPASS
	slot_flags = SLOT_BELT
	force = 25
	force_wielded = 30
	force_unwielded = 25
	parry_chance = 2
	item_worth = 16
	weapon_speed_delay = 20
	drawsound = 'sound/weapons/mace_draw.ogg'
	smelted_return = /obj/item/ore/refined/lw/steellw

/obj/item/melee/classic_baton/becobin
	name = "steel becobin"
	desc = "Bash over some heads."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "becobin"
	item_state = "klevec"
	hitsound= 'sound/weapons/klevec.ogg'
	flags = FPRINT | TABLEPASS
	slot_flags = SLOT_BELT
	force = 30
	force_wielded = 35
	force_unwielded = 30
	parry_chance = 2
	item_worth = 20
	weapon_speed_delay = 22
	drawsound = 'sound/weapons/mace_draw.ogg'
	smelted_return = /obj/item/ore/refined/lw/steellw

/obj/item/melee/classic_baton/blackjack
	name = "blackjack"
	desc = "Bash over some heads."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "blackjack"
	item_state = "blackjack"
	hitsound = "hitsound"
	flags = FPRINT | TABLEPASS
	slot_flags = SLOT_BELT
	force = 20
	force_wielded = 20
	force_unwielded = 20
	parry_chance = 2
	item_worth = 16
	weapon_speed_delay = 12

//Telescopic baton
/obj/item/melee/telebaton
	name = "telescopic staff"
	icon = 'icons/obj/weapons.dmi'
	icon_state = "t_staff0"
	item_state = "t_staff0"
	flags = FPRINT | TABLEPASS
	slot_flags = SLOT_BELT
	w_class = 2
	force = 2
	item_worth = 6
	hitsound= "crowbar_hit"
	swing_sound = "crowbar_swing"
	var/on = 0
	weapon_speed_delay = 16

/obj/item/melee/golfclub
	name = "9 Iron"
	icon = 'icons/obj/weapons.dmi'
	icon_state = "golf_club"
	item_state = "golf_club"
	flags = FPRINT | TABLEPASS
	force = 35
	force_wielded = 50
	force_unwielded = 35
	speciality = SKILL_SWING
	slot_flags = SLOT_BELT
	item_worth = 20
	hitsound = "crowbar_hit"
	attack_verb = list("drives", "bludgeons", "smacks")
	weaponteaching = "CLUB"
	weapon_speed_delay = 10


/obj/item/melee/telebaton/attack_self(mob/user as mob)
	on = !on
	if(on)
		user.visible_message("<b>[user]</b> deploys the Telescopic Staff!")
		user.sound2()
		icon_state = "t_staff1"
		item_state = "t_staff1"
		w_class = 3
		force = 25
		force_wielded = 25
		force_unwielded = 25
		attack_verb = list("smacked", "struck", "slapped")
	else
		user.sound2()
		icon_state = "t_staff0"
		item_state = "t_staff0"
		w_class = 2
		force = 2//not so robust now
		force_wielded = 4
		force_unwielded = 2
		attack_verb = list("hit", "punched")

	if(istype(user,/mob/living/carbon/human))
		var/mob/living/carbon/human/H = user
		H.update_inv_l_hand()
		H.update_inv_r_hand()

	playsound(src.loc, 'sound/webbers/weapons/jam.ogg', 50, 1)
	add_fingerprint(user)

	if(blood_overlay && blood_DNA && (blood_DNA.len >= 1)) //updates blood overlay, if any
		overlays.Cut()//this might delete other item overlays as well but eeeeeeeh

		var/icon/I = new /icon(src.icon, src.icon_state)
		I.Blend(new /icon('icons/effects/blood.dmi', rgb(255,255,255)),ICON_ADD)
		I.Blend(new /icon('icons/effects/blood.dmi', "itemblood"),ICON_MULTIPLY)
		blood_overlay = I

		overlays += blood_overlay

	return

/obj/item/melee/telebaton/attack(mob/target as mob, mob/living/user as mob)
	if(on)
		if ((CLUMSY in user.mutations) && prob(50))
			user << "\red You club yourself over the head."
			user.Weaken(6 * force)
			if(ishuman(user))
				var/mob/living/carbon/human/H = user
				H.apply_damage(6*force, BRUTE, "head")
			else
				user.take_organ_damage(6*force)
			return
		if(..())
			playsound(src.loc, "swing_hit", 50, 1, -1)
			target.Weaken(6)
			return
	else
		return ..()


/*
 *Energy Blade
 */
//Most of the other special functions are handled in their own files.

/obj/item/melee/energy/sword/green
	New()
		item_color = "green"

/obj/item/melee/energy/sword/red
	New()
		item_color = "red"

/obj/item/melee/energy/blade/New()
	spark_system = new /datum/effect/effect/system/spark_spread()
	spark_system.set_up(5, 0, src)
	spark_system.attach(src)
	return

/obj/item/melee/energy/blade/dropped()
	qdel(src)
	return

/obj/item/melee/energy/blade/proc/throw_sword()
	qdel(src)
	return

/*
 * Energy Axe
 */

/obj/item/melee/energy/axe/attack_self(mob/user as mob)
	src.active = !( src.active )
	if (src.active)
		user << "\blue The axe is now energised."
		src.force = 150
		src.icon_state = "axe1"
		src.w_class = 5
	else
		user << "\blue The axe can now be concealed."
		src.force = 40
		src.icon_state = "axe0"
		src.w_class = 5
	src.add_fingerprint(user)
	return