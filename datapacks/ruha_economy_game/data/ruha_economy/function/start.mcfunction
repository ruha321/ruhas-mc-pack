function ruha_economy:reset

worldborder center 0 0
worldborder set 1000

function ruha_economy:station/place_exchange
function ruha_economy:shop/place_shop

clear @a
function ruha_economy:player/init

scoreboard players set $state ruha_game 1
scoreboard players set $timer ruha_game 12000

tellraw @a {"text":"ゲーム開始！","color":"gold"}
tellraw @a {"text":"制限時間は10分!","color":"red"}
tellraw @a {"text":"終了時までに勝利ポイントを多く集めよう！","color":"yellow"}
