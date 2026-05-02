execute unless score @s ruha_cash matches 200.. run tellraw @s {"text":"所持金が足りません","color":"red"}
execute if score @s ruha_cash matches 200.. run function ruha_economy:shop/buy_pickaxe_success