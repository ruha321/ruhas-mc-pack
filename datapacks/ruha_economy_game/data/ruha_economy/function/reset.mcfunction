scoreboard players set $state ruha_game 0
scoreboard players set $timer ruha_game 0
scoreboard players set @s ruha_vp 0
scoreboard objectives setdisplay sidebar

function ruha_economy:station/clear_exchange
function ruha_economy:shop/clear_shop

tellraw @a {"text":"ゲームをリセットしました","color":"gray"}