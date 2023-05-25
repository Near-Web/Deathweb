var/list/siegerclasses = list("Peasant", "Alchemist", "Blacksmith", "Cook", "Bard")
var/list/battlesiegers = list("Swordman", "Maceman", "Spearman", "Axeman")
var/list/peasantssiegers = list("Peasant", "Alchemist", "Blacksmith", "Cook", "Bard")
var/list/builderssiegers = list("Miner")
var/list/healerssiegers = list("Healer")
var/list/scoutssiegers = list("Scout", "Hunter")


/datum/job/sieger
	title = "Sieger"
	titlebr = "Sieger"
	flag = SIEGER
	department_flag = CIVILIAN
	faction = "Siege"
	total_positions = -1
	spawn_positions = -1
	supervisors = "The God King"
	selection_color = "#dddddd"
	idtype = /obj/item/card/id/count/sieger
	thanati_chance = 0
	access = list()
	minimal_access = list()
	minimal_character_age = 21

	equip(var/mob/living/carbon/human/H)
		if(!H)
			return 0
		..()
		H.voicetype = pick("noble","strong","sketchy")
		H.stat = UNCONSCIOUS
		H.can_stand = 0
		H.sleeping = 500
		H.lying = 1
		H.add_verb(/mob/living/carbon/human/proc/siegequip)
		H.updateStatPanel()

/mob/living/carbon/human/proc/siegequip()
	set hidden = 0
	set category = "gpc"
	set name = "ChoosesiegerClass"
	set desc="Choose your sieger class!"
	var/mob/living/carbon/human/H = src
	if(!(src.siegesoldier) || ticker.mode.config_tag != "siege")
		return
	var/datum/game_mode/siege/S = ticker.mode
	if(length(S.flag_colors) < 2)
		to_chat(H, "[pick(fnord)] Count need to decide our uniform color!")
	if(H.migclass)
		to_chat(H, "[pick(fnord)] I can't do this no more!")
		return
	H.migclass = input(H,"Select a sieger class..","SIEGERS", pick(siegerclasses)) in siegerclasses
	switch(H.migclass)
		if("Swordman")
			H.my_skills.change_skill(SKILL_MELEE,rand(2,2))
			H.my_skills.change_skill(SKILL_RANGE,rand(0,0))
			H.my_skills.change_skill(SKILL_UNARM,rand(0,2))
			H.my_skills.change_skill(SKILL_CLIMB,rand(2,2))
			H.my_skills.change_skill(SKILL_SWIM,rand(0,0))
			H.my_skills.change_skill(SKILL_OBSERV, rand(2,2))
			H.my_skills.change_skill(SKILL_SWORD,rand(0,0))
			H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/migrant(H), slot_w_uniform)
			H.equip_to_slot_or_del(new /obj/item/clothing/suit/armor/vest/iron_breastplate(H), slot_wear_suit)
			H.equip_to_slot_or_del(new /obj/item/clothing/shoes/lw/jackboots(H), slot_shoes)
			H.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/lw/siegehelmet(H), slot_head)
			H.equip_to_slot_or_del(new /obj/item/claymore/falchion(H), slot_r_hand)
			H.equip_to_slot_or_del(new /obj/item/sheath(H), slot_belt)
			H.equip_to_slot_or_del(new /obj/item/shield/wood(H), slot_l_hand)
			H.my_stats.change_stat(STAT_ST, 1)
			H.my_stats.change_stat(STAT_HT, 1)
			H.my_stats.change_stat(STAT_DX, 0)
			H.my_stats.change_stat(STAT_IN, 0)
		if("Maceman")
			H.my_skills.change_skill(SKILL_MELEE,rand(2,2))
			H.my_skills.change_skill(SKILL_RANGE,rand(0,0))
			H.my_skills.change_skill(SKILL_UNARM,rand(0,2))
			H.my_skills.change_skill(SKILL_CLIMB,rand(2,2))
			H.my_skills.change_skill(SKILL_SWIM,rand(0,0))
			H.my_skills.change_skill(SKILL_OBSERV, rand(2,2))
			H.my_skills.change_skill(SKILL_SWING,rand(0,0))
			H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/migrant(H), slot_w_uniform)
			H.equip_to_slot_or_del(new /obj/item/clothing/suit/armor/vest/iron_breastplate(H), slot_wear_suit)
			H.equip_to_slot_or_del(new /obj/item/clothing/shoes/lw/jackboots(H), slot_shoes)
			H.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/lw/siegehelmet(H), slot_head)
			H.equip_to_slot_or_del(new /obj/item/melee/classic_baton/mace(H), slot_belt)
			H.equip_to_slot_or_del(new /obj/item/shield/wood(H), slot_l_hand)
			H.my_stats.change_stat(STAT_ST, 1)
			H.my_stats.change_stat(STAT_HT, 1)
			H.my_stats.change_stat(STAT_DX, 0)
			H.my_stats.change_stat(STAT_IN, 0)
		if("Spearman")
			H.my_skills.change_skill(SKILL_MELEE,rand(2,2))
			H.my_skills.change_skill(SKILL_RANGE,rand(0,0))
			H.my_skills.change_skill(SKILL_UNARM,rand(0,2))
			H.my_skills.change_skill(SKILL_CLIMB,rand(2,2))
			H.my_skills.change_skill(SKILL_SWIM,rand(0,0))
			H.my_skills.change_skill(SKILL_OBSERV, rand(2,2))
			H.my_skills.change_skill(SKILL_STAFF,rand(0,0))
			H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/migrant(H), slot_w_uniform)
			H.equip_to_slot_or_del(new /obj/item/clothing/suit/armor/vest/iron_breastplate(H), slot_wear_suit)
			H.equip_to_slot_or_del(new /obj/item/clothing/shoes/lw/jackboots(H), slot_shoes)
			H.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/lw/siegehelmet(H), slot_head)
			H.equip_to_slot_or_del(new /obj/item/claymore/spear(H), slot_r_hand)
			H.equip_to_slot_or_del(new /obj/item/shield/wood(H), slot_l_hand)
			H.my_stats.change_stat(STAT_ST, 1)
			H.my_stats.change_stat(STAT_HT, 1)
			H.my_stats.change_stat(STAT_DX, 0)
			H.my_stats.change_stat(STAT_IN, 0)
		if("Axeman")
			H.my_skills.change_skill(SKILL_MELEE,rand(2,2))
			H.my_skills.change_skill(SKILL_RANGE,rand(0,0))
			H.my_skills.change_skill(SKILL_UNARM,rand(0,2))
			H.my_skills.change_skill(SKILL_CLIMB,rand(2,2))
			H.my_skills.change_skill(SKILL_SWIM,rand(0,0))
			H.my_skills.change_skill(SKILL_OBSERV, rand(2,2))
			H.my_skills.change_skill(SKILL_SWING,rand(0,0))
			H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/migrant(H), slot_w_uniform)
			H.equip_to_slot_or_del(new /obj/item/clothing/suit/armor/vest/iron_breastplate(H), slot_wear_suit)
			H.equip_to_slot_or_del(new /obj/item/clothing/shoes/lw/jackboots(H), slot_shoes)
			H.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/lw/siegehelmet(H), slot_head)
			H.equip_to_slot_or_del(new /obj/item/claymore/falchion(H), slot_r_hand)
			H.equip_to_slot_or_del(new /obj/item/shield/wood(H), slot_l_hand)
			H.my_stats.change_stat(STAT_ST, 1)
			H.my_stats.change_stat(STAT_HT, 1)
			H.my_stats.change_stat(STAT_DX, 0)
			H.my_stats.change_stat(STAT_IN, 0)
		if("Cook")
			H.equip_to_slot_or_del(new /obj/item/clothing/head/chefhat(H), slot_head)
			H.equip_to_slot_or_del(new /obj/item/clothing/suit/apron(H), slot_wear_suit)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/migrant(H), slot_w_uniform)
			H.equip_to_slot_or_del(new /obj/item/reagent_containers/food/snacks/grown/mushroom/plumphelmet(H), slot_r_store)
			H.equip_to_slot_or_del(new /obj/item/kitchen/utensil/knife(H), slot_l_store)
			H.equip_to_slot_or_del(new /obj/item/storage/backpack/coldpack(H), slot_back)
			H.equip_to_slot_or_del(new /obj/item/kitchen/utensil/knife(H.back), slot_in_backpack)
			H.equip_to_slot_or_del(new /obj/item/reagent_containers/food/snacks/grown/mushroom/plumphelmet(H.back), slot_in_backpack)
			H.equip_to_slot_or_del(new /obj/item/reagent_containers/food/snacks/grown/mushroom/plumphelmet(H.back), slot_in_backpack)
			H.equip_to_slot_or_del(new /obj/item/reagent_containers/food/snacks/grown/mushroom/plumphelmet(H.back), slot_in_backpack)
			H.equip_to_slot_or_del(new /obj/item/reagent_containers/glass/beaker/stewpan(H.back), slot_in_backpack)
			H.my_skills.change_skill(SKILL_CLIMB, rand(2,2))
			H.my_skills.change_skill(SKILL_MELEE, rand(0,0))
			H.my_skills.change_skill(SKILL_RANGE, rand(0,0))
			H.my_skills.change_skill(SKILL_FARM, rand(2,2))
			H.my_skills.change_skill(SKILL_COOK, rand(5,7))
			H.my_skills.change_skill(SKILL_MASON, 2)
			H.my_skills.change_skill(SKILL_CRAFT, 2)
			H.my_stats.change_stat(STAT_IN, 0)
		if("Alchemist")
			H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/migrant(H), slot_w_uniform)
			H.equip_to_slot_or_del(new /obj/item/storage/backpack/migrant(H), slot_back)
			H.equip_to_slot_or_del(new /obj/item/storage/fancy/vials(H.back), slot_in_backpack)
			H.equip_to_slot_or_del(new /obj/item/storage/fancy/vials(H.back), slot_in_backpack)
			H.equip_to_slot_or_del(new /obj/item/retort(H.back), slot_in_backpack)
			H.equip_to_slot_or_del(new /obj/item/mortar(H.back), slot_in_backpack)
			H.equip_to_slot_or_del(new /obj/item/pestle(H.back), slot_in_backpack)
			H.equip_to_slot_or_del(new /obj/item/flame/torch/migger/on(H), slot_r_hand)
			H.my_skills.change_skill(SKILL_MELEE, rand(0,0))
			H.my_skills.change_skill(SKILL_RANGE, rand(0,0))
			H.my_skills.change_skill(SKILL_COOK, rand(0,0))
			H.my_skills.change_skill(SKILL_MASON, 2)
			H.my_skills.change_skill(SKILL_CRAFT, 2)
			H.my_skills.change_skill(SKILL_SURG, rand(2,2))
			H.my_skills.change_skill(SKILL_MEDIC, rand(2,2))
			H.my_skills.change_skill(SKILL_ALCH, rand(7,10))
			H.my_skills.change_skill(SKILL_CLIMB, rand(2,2))
			H.my_stats.change_stat(STAT_ST, -1)
			H.my_stats.change_stat(STAT_HT, -1)
			H.my_stats.change_stat(STAT_IN, 4)
			H.terriblethings = TRUE
			siegerclasses -= "Alchemist"
			S.hasalchemistsiege = TRUE
		if("Peasant")
			H.equip_to_slot_or_del(new /obj/item/minihoe(H), slot_l_hand)
			H.equip_to_slot_or_del(new /obj/item/clothing/head/peasant(H), slot_head)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/migrant(H), slot_w_uniform)
			H.equip_to_slot_or_del(new /obj/item/storage/backpack/migrant(H), slot_back)
			H.equip_to_slot_or_del(new /obj/item/seeds/plumpmycelium(H.back), slot_in_backpack)
			H.equip_to_slot_or_del(new /obj/item/seeds/potatoseed(H.back), slot_in_backpack)
			H.equip_to_slot_or_del(new /obj/item/seeds/appleseed(H.back), slot_in_backpack)
			H.equip_to_slot_or_del(new /obj/item/reagent_containers/glass/bucket(H.back), slot_in_backpack)
			H.my_skills.change_skill(SKILL_MELEE, rand(2,2))
			H.my_skills.change_skill(SKILL_RANGE, rand(0,0))
			H.my_skills.change_skill(SKILL_FARM, rand(5,7))
			H.my_skills.change_skill(SKILL_CLIMB, rand(2,2))
			H.my_skills.change_skill(SKILL_RIDE, rand(3,4))
			H.my_skills.change_skill(SKILL_MASON, 2)
			H.my_skills.change_skill(SKILL_CRAFT, 2)
			H.my_skills.change_skill(SKILL_COOK, rand(2,2))
			H.my_skills.change_skill(SKILL_UNARM, rand(0,1))
			H.my_stats.change_stat(STAT_IN, -2)
			H.add_perk(/datum/perk/illiterate)
		if("Miner")
			H.equip_to_slot_or_del(new /obj/item/clothing/head/hardhat/orange(H), slot_head)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/migrant(H), slot_w_uniform)
			H.equip_to_slot_or_del(new /obj/item/clothing/mask/breath(H), slot_wear_mask)
			H.equip_to_slot_or_del(new /obj/item/pickaxe(H), slot_l_hand)
			H.equip_to_slot_or_del(new /obj/item/shovel(H), slot_belt)
			H.equip_to_slot_or_del(new /obj/item/clothing/suit/minerapron(H), slot_wear_suit)
			H.equip_to_slot_or_del(new /obj/item/storage/backpack/migrant(H), slot_back)
			H.my_skills.change_skill(SKILL_MELEE, rand(2,2))
			H.my_skills.change_skill(SKILL_RANGE, rand(0,0))
			H.my_skills.change_skill(SKILL_FARM, rand(0,0))
			H.my_skills.change_skill(SKILL_COOK, rand(0,0))
			H.my_skills.change_skill(SKILL_CLIMB, rand(2,2))
			H.my_skills.change_skill(SKILL_ENGINE, rand(0,0))
			H.my_skills.change_skill(SKILL_MASON, rand(2,2))
			H.my_skills.change_skill(SKILL_CRAFT, 2)
			H.my_skills.change_skill(SKILL_SURG, rand(0,0))
			H.my_skills.change_skill(SKILL_MEDIC, rand(0,0))
			H.my_skills.change_skill(SKILL_CLEAN, rand(0,0))
			H.my_skills.change_skill(SKILL_MINE, rand(6,8))
			H.my_stats.change_stat(STAT_ST, 2)
			H.my_stats.change_stat(STAT_HT, 1)
			H.my_stats.change_stat(STAT_DX, -2)
			H.my_stats.change_stat(STAT_IN, -1)
			H.add_perk(/datum/perk/ref/strongback)
			H.add_perk(/datum/perk/illiterate)
		if("Healer")
			H.equip_to_slot_or_del(new /obj/item/storage/firstaid/adv(H), slot_l_hand)
			H.equip_to_slot_or_del(new /obj/item/clothing/head/healer(H), slot_head)
			H.equip_to_slot_or_del(new /obj/item/clothing/mask/plaguedoctor(H), slot_wear_mask)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/migrant(H), slot_w_uniform)
			H.equip_to_slot_or_del(new /obj/item/storage/backpack/migrant(H), slot_back)
			H.my_skills.change_skill(SKILL_MELEE, rand(0,0))
			H.my_skills.change_skill(SKILL_RANGE, rand(0,0))
			H.my_skills.change_skill(SKILL_FARM, rand(0,0))
			H.my_skills.change_skill(SKILL_COOK, rand(0,0))
			H.my_skills.change_skill(SKILL_ENGINE, rand(0,0))
			H.my_skills.change_skill(SKILL_SURG, rand(6,6))
			H.my_skills.change_skill(SKILL_MEDIC, rand(6,6))
			H.my_skills.change_skill(SKILL_CLEAN, rand(0,0))
			H.my_skills.change_skill(SKILL_CLIMB, rand(2,2))
			H.my_stats.change_stat(STAT_IN, 2)
			H.terriblethings = TRUE
		if("Blacksmith")
			H.equip_to_slot_or_del(new /obj/item/clothing/suit/apron(H), slot_wear_suit)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/migrant(H), slot_w_uniform)
			H.equip_to_slot_or_del(new /obj/item/carverhammer(H), slot_l_hand)
			H.equip_to_slot_or_del(new /obj/item/alicate(H), slot_belt)
			H.equip_to_slot_or_del(new /obj/item/storage/backpack/migrant(H), slot_back)
			H.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel(H), slot_back2)
			H.my_skills.change_skill(SKILL_MELEE, rand(2,2))
			H.my_skills.change_skill(SKILL_RANGE, rand(0,0))
			H.my_skills.change_skill(SKILL_FARM, rand(0,0))
			H.my_skills.change_skill(SKILL_COOK, rand(0,0))
			H.my_skills.change_skill(SKILL_ENGINE, rand(0,0))
			H.my_skills.change_skill(SKILL_MASON, 2)
			H.my_skills.change_skill(SKILL_CRAFT, 3)
			H.my_skills.change_skill(SKILL_SURG, rand(0,0))
			H.my_skills.change_skill(SKILL_MEDIC, rand(0,0))
			H.my_skills.change_skill(SKILL_CLEAN, rand(0,0))
			H.my_skills.change_skill(SKILL_SMITH, rand(6,6))
			H.my_skills.change_skill(SKILL_CLIMB, rand(2,2))
			H.my_stats.change_stat(STAT_ST, 3)
			H.my_stats.change_stat(STAT_HT, 1)
			H.my_stats.change_stat(STAT_DX, -1)
			H.my_stats.change_stat(STAT_IN, -1)
			S.blacksmithsiege += 1
			if(S.maxblacksmithsiege <= S.blacksmithsiege)
				siegerclasses -= "Blacksmith"
				S.hasblacksmithsiege = TRUE
		if("Rifleman")
			H.my_skills.change_skill(SKILL_MELEE,rand(0,0))
			H.my_skills.change_skill(SKILL_RANGE,rand(5,8))
			H.my_skills.change_skill(SKILL_UNARM,rand(0,0))
			H.my_skills.change_skill(SKILL_CLIMB,rand(2,2))
			H.my_skills.change_skill(SKILL_SWIM,rand(3,3))
			H.my_skills.change_skill(SKILL_OBSERV, rand(2,2))
			H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/migrant(H), slot_w_uniform)
			H.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/vest/ravcoat(H), slot_wear_suit)
			H.equip_to_slot_or_del(new /obj/item/clothing/shoes/lw/jackboots(H), slot_shoes)
			H.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/lw/siegehelmet(H), slot_head)
			H.equip_to_slot_or_del(new /obj/item/gun/projectile/shotgun/princess(H), slot_r_hand)
			H.equip_to_slot_or_del(new /obj/item/storage/backpack/migrant(H), slot_back)
			H.equip_to_slot_or_del(new /obj/item/stack/bullets/rifle/nine(H.back), slot_in_backpack)
			H.equip_to_slot_or_del(new /obj/item/stack/bullets/rifle/nine(H.back), slot_in_backpack)
			H.equip_to_slot_or_del(new /obj/item/stack/bullets/rifle/nine(H), slot_l_store)
			H.my_stats.change_stat(STAT_DX, 1)
		if("Bard")
			if(prob(20))
				H.equip_to_slot_or_del(new /obj/item/musical_instrument/baliset/guitar(H), slot_l_hand)
			else
				H.equip_to_slot_or_del(new /obj/item/musical_instrument/baliset(H), slot_l_hand)
			H.equip_to_slot_or_del(new /obj/item/clothing/head/bard(H), slot_head)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/migrant(H), slot_w_uniform)
			H.equip_to_slot_or_del(new /obj/item/storage/backpack/migrant(H), slot_back)
			H.equip_to_slot_or_del(new /obj/item/storage/backpack/coinbag(H), slot_amulet)
			H.my_skills.change_skill(SKILL_MELEE, 2)
			H.my_skills.change_skill(SKILL_RANGE, 2)
			H.my_skills.change_skill(SKILL_MASON, 2)
			H.my_skills.change_skill(SKILL_CRAFT, 2)
			H.my_skills.change_skill(SKILL_MUSIC, rand(7,8))
			H.my_skills.change_skill(SKILL_CLIMB, rand(3,4))
			H.my_skills.change_skill(SKILL_COOK, rand(0,0))
			H.my_stats.change_stat(STAT_HT, -1)
			H.my_stats.change_stat(STAT_DX, 2)
			H.my_stats.change_stat(STAT_IN, 4)
			H.add_verb(list(/mob/living/carbon/human/proc/remembersong,
			/mob/living/carbon/human/proc/sing))
			H.add_perk(/datum/perk/singer)

		if("Town Guard")
			H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/migrant(H), slot_w_uniform)
			H.equip_to_slot_or_del(new /obj/item/clothing/shoes/lw/jackboots(H), slot_shoes)
			H.equip_to_slot_or_del(new /obj/item/kitchen/utensil/knife/dagger(H), slot_r_store)
			H.equip_to_slot_or_del(new /obj/item/flame/torch/migger/on(H), slot_r_hand)
			H.equip_to_slot_or_del(new /obj/item/clothing/gloves/combat/gauntlet/steel(H), slot_gloves)
			H.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/lw/siegehelmet(H), slot_head)
			H.equip_to_slot_or_del(new /obj/item/clothing/suit/armor/vest/security/hauberk(H), slot_wear_suit)
			H.equip_to_slot_or_del(new /obj/item/claymore/spear(H), slot_r_hand)
			H.equip_to_slot_or_del(new /obj/item/shield/wood(H), slot_l_hand)
			H.my_skills.change_skill(SKILL_MELEE, rand(4,4))
			H.my_skills.change_skill(SKILL_RANGE, rand(0,0))
			H.my_skills.change_skill(SKILL_COOK, rand(0,0))
			H.my_skills.change_skill(SKILL_ENGINE, rand(0,0))
			H.my_skills.change_skill(SKILL_SURG, rand(0,0))
			H.my_skills.change_skill(SKILL_MEDIC, rand(0,0))
			H.my_skills.change_skill(SKILL_CLEAN, rand(0,0))
			H.my_skills.change_skill(SKILL_CLIMB, rand(3,4))
			H.my_stats.change_stat(STAT_ST, 2)
			H.my_stats.change_stat(STAT_HT, 2)
			H.my_stats.change_stat(STAT_DX, 0)
			H.my_stats.change_stat(STAT_IN, -1)
		if("Mobster")
			H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/migrant/baroness(H), slot_w_uniform)
			H.equip_to_slot_or_del(new /obj/item/clothing/shoes/lw/boots(H), slot_shoes)
			H.equip_to_slot_or_del(new /obj/item/flame/lighter/zippo(H), slot_r_store)
			H.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/fjacket(H), slot_wear_suit)
			H.equip_to_slot_or_del(new /obj/item/clothing/mask/cigarette/weed(H), slot_wear_mask)
			H.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses(H), slot_glasses)
			switch(pick(list("screamer23", "mother", "gold", "harat", "neoclassic")))
				if("screamer23")
					H.equip_to_slot_or_del(new /obj/item/gun/projectile/automatic/pistol/magnum66/screamer23(H), slot_belt)
					H.equip_to_slot_or_del(new /obj/item/ammo_magazine/external/sm45/pusher/full(H), slot_l_store)
				if("mother")
					H.equip_to_slot_or_del(new /obj/item/gun/projectile/automatic/pistol/magnum66/mother(H), slot_belt)
					H.equip_to_slot_or_del(new /obj/item/ammo_magazine/external/m357(H), slot_l_store)
				if("gold")
					H.equip_to_slot_or_del(new /obj/item/gun/projectile/automatic/pistol/ml23/gold(H), slot_belt)
					H.equip_to_slot_or_del(new /obj/item/ammo_magazine/external/mc9mm(H), slot_l_store)
				if("harat")
					H.equip_to_slot_or_del(new /obj/item/gun/projectile/newRevolver/duelista/harat(H), slot_belt)
					H.equip_to_slot_or_del(new /obj/item/ammo_magazine/internal/cylinder/harat(H), slot_l_store)
				if("neoclassic")
					H.equip_to_slot_or_del(new /obj/item/gun/projectile/newRevolver/duelista/neoclassic(H), slot_belt)
					H.equip_to_slot_or_del(new /obj/item/ammo_magazine/internal/cylinder/rev38(H), slot_l_store)
			H.my_skills.change_skill(SKILL_MELEE, rand(0,0))
			H.my_skills.change_skill(SKILL_RANGE, rand(3,6))
			H.my_skills.change_skill(SKILL_COOK, rand(0,0))
			H.my_skills.change_skill(SKILL_MEDIC, rand(0,0))
			H.my_skills.change_skill(SKILL_CLIMB, rand(2,2))
			H.my_skills.change_skill(SKILL_SURG, rand(2,3))
			H.my_skills.change_skill(SKILL_SWIM,rand(3,3))
			H.my_stats.change_stat(STAT_ST, 0)
			H.my_stats.change_stat(STAT_HT, 2)
			H.my_stats.change_stat(STAT_DX, 3)
			H.my_stats.change_stat(STAT_IN, 0)
		if("Scout")
			H.equip_to_slot_or_del(new /obj/item/clothing/head/plebhood(H), slot_head)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/migrant(H), slot_w_uniform)
			H.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel(H), slot_back)
			H.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/vest/flakjacket(H), slot_wear_suit)
			H.equip_to_slot_or_del(new /obj/item/gun/energy/taser/leet/maulet(H), slot_belt)
			H.equip_to_slot_or_del(new /obj/item/kitchen/utensil/knife/combat(H), slot_l_store)
			H.equip_to_slot_or_del(new /obj/item/kitchen/utensil/knife/combat(H), slot_r_store)
			H.equip_to_slot_or_del(new /obj/item/cell/crap(H.back), slot_in_backpack)
			H.my_skills.change_skill(SKILL_MELEE, rand(2,2))
			H.my_skills.change_skill(SKILL_RANGE, rand(3,3))
			H.my_skills.change_skill(SKILL_UNARM, rand(0,1))
			H.my_skills.change_skill(SKILL_MASON, 2)
			H.my_skills.change_skill(SKILL_CRAFT, 2)
			H.my_skills.change_skill(SKILL_SWORD, rand(0,2))
			H.my_skills.change_skill(SKILL_CLIMB, rand(5,6))
			H.my_skills.change_skill(SKILL_COOK, rand(0,0))
			H.my_skills.change_skill(SKILL_SWIM, rand(4,5))
			H.my_stats.change_stat(STAT_DX, 1)
			H.my_stats.change_stat(STAT_IN, 1)
			H.add_perk(/datum/perk/ref/strongback)
			H.add_perk(/datum/perk/ref/cavetravel)
			H.terriblethings = TRUE
		if("Hunter")
			H.equip_to_slot_or_del(new /obj/item/kitchen/utensil/knife/combat(H), slot_l_hand)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/migrant(H), slot_w_uniform)
			H.equip_to_slot_or_del(new /obj/item/crossbow(H), slot_back2)
			H.equip_to_slot_or_del(new /obj/item/storage/backpack/migrant(H), slot_back)
			H.equip_to_slot_or_del(new /obj/item/arrow(H), slot_r_store)
			H.equip_to_slot_or_del(new /obj/item/arrow(H), slot_l_store)
			H.equip_to_slot_or_del(new /obj/item/legcuffs/bola(H), slot_belt)
			H.equip_to_slot_or_del(new /obj/item/clothing/mask/pig(H), slot_wear_mask)
			H.my_skills.change_skill(SKILL_MELEE, rand(3,3))
			H.my_skills.change_skill(SKILL_RANGE, rand(4,4))
			H.my_skills.change_skill(SKILL_FARM, rand(0,0))
			H.my_skills.change_skill(SKILL_COOK, rand(3,4))
			H.my_skills.change_skill(SKILL_MASON, 2)
			H.my_skills.change_skill(SKILL_CRAFT, 2)
			H.my_skills.change_skill(SKILL_ENGINE, rand(0,0))
			H.my_skills.change_skill(SKILL_SURG, rand(0,0))
			H.my_skills.change_skill(SKILL_MEDIC, rand(0,0))
			H.my_skills.change_skill(SKILL_CLEAN, rand(0,0))
			H.my_skills.change_skill(SKILL_CLIMB, rand(4,5))
			H.my_stats.change_stat(STAT_ST, 1)
			H.my_stats.change_stat(STAT_HT, 1)
			H.my_stats.change_stat(STAT_DX, 0)
			H.my_stats.change_stat(STAT_IN, 0)
			H.add_perk(/datum/perk/illiterate)
			H.terriblethings = TRUE
	if(!H.shoes)
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/lw/leatherboots(H), slot_shoes)
	if(H.wear_id)
		var/obj/item/card/id/R = H.wear_id
		R.registered_name = H.real_name
		if(H.migclass in battlesiegers)
			R.rank = "Grunt"
			R.assignment = "Grunt"
		else
			R.rank = H.migclass
			R.assignment = H.migclass
		R.name = "[R.registered_name]'s Ring"
	var/obj/item/device/radio/R = new /obj/item/device/radio/headset/syndicate(H)
	var/obj/item/clothing/under/rank/migrant/MIG = w_uniform
	MIG.maincolor = S.flag_colors["maincolor"]
	MIG.secondcolor = S.flag_colors["secondcolor"]
	H.update_inv_w_uniform(1)
	if(istype(H.back, /obj/item/storage/backpack/migrant))
		var/obj/item/storage/backpack/migrant/M = H.back
		M.maincolor = S.flag_colors["maincolor"]
		M.update_icon(H)
	MIG.update_icon(H)
	R.set_frequency(SYND_FREQ)
	H.equip_to_slot_or_del(R, slot_l_ear)
	H.special_load()
	if(H.ckey in patreons)
		job_master.handle_patreon(H)
	if(FAT in H.mutations)
		H.my_stats.change_stat(STAT_ST, 1)
		H.my_stats.change_stat(STAT_DX, -2)
		H.my_stats.change_stat(STAT_HT, 1)
	if(H.gender == FEMALE && !H.has_penis())
		H.my_stats.change_stat(STAT_ST, -1)
	if(H.age >= 50)
		H.my_stats.change_stat(STAT_ST, -1)
		H.my_stats.change_stat(STAT_HT, -1)
		H.my_stats.change_stat(STAT_IN, 2)
		H.my_stats.change_stat(STAT_PR, 2)
	if(H.age <= 16)
		H.my_stats.set_stat(STAT_ST, rand(7,9))
		H.my_stats.set_stat(STAT_HT, rand(8,10))
	H.terriblethings = TRUE
	H.stat = CONSCIOUS
	H.nutrition = rand(300,500)
	H.can_stand = 1
	H.sleeping = 0
	H.terriblethings = TRUE
	H.update_inv_head()
	H.update_inv_wear_suit()
	H.update_inv_gloves()
	H.update_inv_shoes()
	H.update_inv_w_uniform()
	H.update_inv_glasses()
	H.update_inv_l_hand()
	H.update_inv_r_hand()
	H.update_inv_belt()
	H.update_inv_wear_id()
	H.update_inv_ears()
	H.update_inv_s_store()
	H.update_inv_pockets()
	H.update_inv_back()
	H.update_inv_handcuffed()
	H.update_inv_wear_mask()
	H.updateStatPanel()
	H.create_kg()
	H.outsider = TRUE
	H.siegesoldier = TRUE
	S.siegerslist += H
	H.update_all_siege_icons()
	return 1