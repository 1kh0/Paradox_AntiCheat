scoreboard players add @s[type=player] phasevl 1
tp @s[type=player] ~~~ 0 0
tp @s[type=player] ^ ^ ^-1
execute @s[type=player] ~~~ tellraw @a[tag=notify] {"rawtext":[{"text":"§r§4[§6Paradox§4]§r "},{"selector":"@s"},{"text":" §1has failed §7(Movement) §4Phase/A. VL= "},{"score":{"name":"@s","objective":"phasevl"}}]}
