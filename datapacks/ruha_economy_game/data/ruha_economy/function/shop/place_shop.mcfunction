function ruha_economy:shop/clear_shop

summon armor_stand 0 100 0 {Tags:["ruha_shop_station"],Invisible:1b,NoGravity:1b,Marker:1b}
summon armor_stand 0 100 0 {Tags:["ruha_shop_station"],Invisible:1b,NoGravity:1b,Marker:1b}
summon armor_stand 0 100 0 {Tags:["ruha_shop_station"],Invisible:1b,NoGravity:1b,Marker:1b}

spreadplayers 0 0 80 450 false @e[tag=ruha_shop_station]

execute at @e[tag=ruha_shop_station] run fill ~-1 ~-1 ~-1 ~1 ~-1 ~1 minecraft:gold_block
execute at @e[tag=ruha_shop_station] run setblock ~ ~ ~ minecraft:beacon

tellraw @a {"text":"ショップがランダムな場所に出現しました．金ブロックのビーコンを探してください！","color":"yellow"}