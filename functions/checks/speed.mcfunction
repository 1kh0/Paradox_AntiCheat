# Makes a entity and checks how far away they are from the entity

execute @s[tag=speedtest2,m=c] ~~~ tp @e[type=paradox:speedtest,name="speedtest",r=5] 999 -200 999

tag @r[tag=!flying,m=!c,tag=!speedtest,tag=!speedtest2,tag=!gliding,tag=!riding,tag=!dead,tag=ground,tag=moving] add speedtest
execute @s[tag=speedtest2] ~~~ tag @a[tag=speedtest] remove speedtest

tag @s[tag=speedtest,tag=!speedtest2] add speedtest2
tag @s[tag=speedtest,tag=speedtest2] remove speedtest

execute @s[tag=speedtest2,scores={timer=0}] ^^^ summon paradox:speedtest speedtest ^-2 ^+1 ^-1
scoreboard players add @s[tag=speedtest2] timer 1

execute @s[tag=speedtest2,tag=!sneak,tag=!right] ~~~ execute @e[type=paradox:speedtest] ~~~ tag @p[tag=speedtest2,r=6] add NoSpeed
execute @s[tag=speedtest2,tag=sneak,tag=!right] ~~~ execute @e[type=paradox:speedtest] ~~~ tag @p[tag=speedtest2,r=4] add NoSpeed
execute @s[tag=speedtest2,tag=!sneak,tag=right] ~~~ execute @e[type=paradox:speedtest] ~~~ tag @p[tag=speedtest2,r=4] add NoSpeed
execute @s[tag=speedtest2,tag=sneak,tag=right] ~~~ execute @e[type=paradox:speedtest] ~~~ tag @p[tag=speedtest2,r=3] add NoSpeed

execute @e[type=paradox:speedtest] ~~~ scoreboard players add @a[m=!c,tag=speedtest2,tag=ground,tag=!NoSpeed,tag=!riding,tag=!gliding] speedvl 1

execute @e[type=paradox:speedtest] ~~~ execute @a[m=!c,tag=speedtest2,tag=ground,tag=!NoSpeed,tag=!riding,tag=!gliding,tag=!sneak,tag=!right,tag=!dead,y=1,dy=256] ~~~ tellraw @a[tag=notify] {"rawtext":[{"text":"§r§4[§6Paradox§4]§r "},{"selector":"@s"},{"text":" §1has failed §7(Movement) §4Speed/A. VL= "},{"score":{"name":"@s","objective":"speedvl"}}]}
execute @e[type=paradox:speedtest] ~~~ execute @a[m=!c,tag=speedtest2,tag=ground,tag=!NoSpeed,tag=!riding,tag=!gliding,tag=sneak,tag=!right,tag=!dead,y=1,dy=256] ~~~ tellraw @a[tag=notify] {"rawtext":[{"text":"§r§4[§6Paradox§4]§r "},{"selector":"@s"},{"text":" §1has failed §7(Movement) §4Speed/A §7(is_sneaking)§4. VL= "},{"score":{"name":"@s","objective":"speedvl"}}]}
execute @e[type=paradox:speedtest] ~~~ execute @a[m=!c,tag=speedtest2,tag=ground,tag=!NoSpeed,tag=!riding,tag=!gliding,tag=!sneak,tag=right,tag=!dead,y=1,dy=256] ~~~ tellraw @a[tag=notify] {"rawtext":[{"text":"§r§4[§6Paradox§4]§r "},{"selector":"@s"},{"text":" §1has failed §7(Movement) §4Speed/A §7(is_using)§4. VL= "},{"score":{"name":"@s","objective":"speedvl"}}]}
execute @e[type=paradox:speedtest] ~~~ execute @a[m=!c,tag=speedtest2,tag=ground,tag=!NoSpeed,tag=!riding,tag=!gliding,tag=sneak,tag=right,tag=!dead,y=1,dy=256] ~~~ tellraw @a[tag=notify] {"rawtext":[{"text":"§r§4[§6Paradox§4]§r "},{"selector":"@s"},{"text":" §1has failed §7(Movement) §4Speed/A §7(is_using) (is_sneaking)§4. VL= "},{"score":{"name":"@s","objective":"speedvl"}}]}

execute @e[type=paradox:speedtest] ~~~ execute @a[m=!c,tag=speedtest2,tag=ground,tag=!NoSpeed,tag=!riding,tag=!gliding,tag=!dead] ~~~ tp @s[y=0,dy=256] @e[type=paradox:speedtest] true

execute @s[tag=speedtest2,scores={timer=10..}] ~~~ event entity @e[type=paradox:speedtest] paradox:despawn
tag @s[tag=speedtest2,scores={timer=..10}] remove NoSpeed
tag @s[tag=speedtest2,scores={timer=10..}] remove speedtest2

scoreboard players set @s[scores={timer=10..}] timer 0
