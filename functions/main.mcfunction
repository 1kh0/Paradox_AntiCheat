# Prevents disabler hacks from possibly disabling the anticheat
gamerule randomtickspeed 1

# Run all the checks
function checks/angle
function checks/cbe
function checks/illegalitems
function checks/others

# Specific criteria checks
execute @s[type=player,scores={attacks=1..,autoclicker=..0}] ~~~ function checks/autoclicker
execute @s[type=player,tag=isBanned] ~~~ function checks/ban
execute @e[type=ender_pearl,r=5] ~~~ function checks/epearlglitching
execute @s[type=player,tag=moving,tag=!flying,m=!c,tag=!jump,tag=!riding,tag=!gliding,tag=!levitating,tag=!vanish,scores={jesus=..0}] ~~~ function checks/jesus
execute @s[type=player,tag=moving,tag=!gliding,tag=!riding,tag=!vanish,scores={phase=..0}] ~~~ function checks/phase

# Optional checks
execute @s[type=player,tag=!op,m=a,scores={gma=1..}] ~~~ function checks/optional/gamemodeA
execute @s[type=player,tag=!op,m=c,scores={gmc=1..}] ~~~ function checks/optional/gamemodeC
execute @s[type=player,tag=!op,m=s,scores={gmc=1..}] ~~~ function checks/optional/gamemodeS
execute @s[scores={commandblocks=1..}] ~~~ function checks/optional/nocommandblocks
execute @s[scores={cmds=1..}] ~~~ function checks/optional/overridecommandblocksenabled
replaceitem entity @s[type=player,tag=!op,scores={frostwalker=1..}] slot.armor.feet 0 leather_boots 1 0 {"item_lock": {"mode": "lock_in_slot"},"keep_on_death":{}}
execute @s[type=player,scores={worldborder=1..}] ~~~ function checks/optional/worldborder

#Armor system
execute @a[scores={ench_helmet=1,encharmor=1..}] ~ ~ ~ function checks/optional/armorNBT
execute @a[scores={ench_chest=1,encharmor=1..}] ~ ~ ~ function checks/optional/armorNBT
execute @a[scores={ench_legs=1,encharmor=1..}] ~ ~ ~ function checks/optional/armorNBT
execute @a[scores={ench_boots=1,encharmor=1..}] ~ ~ ~ function checks/optional/armorNBT