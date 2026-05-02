function ruha_economy:reset

worldborder center 0 0
worldborder set 1000

function ruha_economy:station/place_exchange
function ruha_economy:shop/place_shop

scoreboard players set $state ruha_game 1
scoreboard players set $timer ruha_game 12000
scoreboard objectives setdisplay sidebar ruha_total
tellraw @a {"text":"ゲーム開始！","color":"gold"}
tellraw @a {"text":"制限時間は10分!","color":"red"}

clear @a
give @a lightmanscurrency:wallet_diamond 1
give @a lightmanscurrency:coin_emerald 5