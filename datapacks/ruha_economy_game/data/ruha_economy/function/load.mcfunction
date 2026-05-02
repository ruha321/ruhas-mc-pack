scoreboard objectives add ruha_cash dummy "所持金"
scoreboard objectives add ruha_total dummy "合計獲得額"
scoreboard objectives add ruha_game dummy "ゲーム管理"
scoreboard objectives add ruha_buy_pickaxe trigger "鉄ピッケル購入"
tellraw @a {"text":"ruha_economy loaded","color":"gray"}