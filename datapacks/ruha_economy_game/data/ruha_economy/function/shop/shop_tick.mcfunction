scoreboard players enable @a ruha_buy_pickaxe
execute as @a[scores={ruha_buy_pickaxe=1..},x=10,y=70,z=65,distance=..3] run function ruha_economy:shop/buy_pickaxe
scoreboard players set @a[scores={ruha_buy_pickaxe=1..}] ruha_buy_pickaxe 0