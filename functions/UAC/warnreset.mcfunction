# Penguins Admin Giver runs this function, we override this and revert all of its effects
scoreboard players add @s disablervl 1

tellraw @a[tag=notify] {"rawtext":[{"text":"§r§6[§aParadox§6]§r "},{"selector":"@s"},{"text":" §1has failed §7(Exploit) §4Disabler/A §7(This check should not be used as proof)§4. VL= "},{"score":{"name":"@s","objective":"disablervl"}}]}
effect @s clear
tag @s remove admin
tag @s remove Admin
tag @s remove ADMIN
tag @s remove staff
tag @s remove Staff
tag @s remove STAFF
tag @s remove mod
tag @s remove Mod
tag @s remove MOD
tag @s remove moderator
tag @s remove Moderator
tag @s remove MODERATOR
tag @s remove owner
tag @s remove Owner
tag @s remove OWNER
tag @s remove helper
tag @s remove Helper
tag @s remove HELPER
tag @s remove staffstatus
gamemode 2 @s
fill ~-3 -64 ~-3 ~+3 319 ~+3 air 0 replace allow -1

gamerule sendcommandfeedback true