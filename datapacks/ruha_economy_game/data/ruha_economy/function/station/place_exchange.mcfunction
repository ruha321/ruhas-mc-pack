kill @e[tag=ruha_exchange_station]

summon armor_stand 0 100 0 {Tags:["ruha_exchange_station"],Invisible:1b,NoGravity:1b,Marker:1b}

spreadplayers 0 0 80 450 false @e[tag=ruha_exchange_station]
spreadplayers 0 0 80 450 false @e[tag=ruha_exchange_station]
spreadplayers 0 0 80 450 false @e[tag=ruha_exchange_station]
spreadplayers 0 0 80 450 false @e[tag=ruha_exchange_station]
spreadplayers 0 0 80 450 false @e[tag=ruha_exchange_station]

execute at @e[tag=ruha_exchange_station] run fill ~-1 ~-1 ~-1 ~1 ~-1 ~1 minecraft:iron_block
execute at @e[tag=ruha_exchange_station] run setblock ~ ~ ~ minecraft:beacon

tellraw @a {"text":"納品所がランダムな場所に出現しました．ビーコンを探してください！","color":"gold"}
