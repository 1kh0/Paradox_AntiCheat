scoreboard players add @s[type=player] jesusvl 1
execute @s[type=player] ~~~ tellraw @a[tag=notify] {"rawtext":[{"text":"§r§4[§6Paradox§4]§r "},{"selector":"@s"},{"text":" §1has failed §7(Movement) §4Jesus/A. VL= "},{"score":{"name":"@s","objective":"jesusvl"}}]}
tp @s[type=player] ~~-1~
