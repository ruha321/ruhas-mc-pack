scoreboard players enable @a ruha_buy_pickaxe
execute at @e[tag=ruha_shop_station] as @a[distance=..5,scores={ruha_buy_pickaxe=1..}] run function ruha_economy:shop/buy_pickaxe
scoreboard players set @a[scores={ruha_buy_pickaxe=1..}] ruha_buy_pickaxe 0