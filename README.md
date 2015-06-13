# call_monster_plus_sim

type effect is not implemented.

# example

```
$ ./main.rb 
run_party_turn 0, friend
run_monster_turn 0, スペルパス
wake count => 0
run_monster_turn 1, ホネガシラ
wake count => 0
run_monster_turn 2, ツノダンゴ
wake count => 0
run_monster_turn 3, スノーダンサー
wake count => 3
run_party_turn 1, enemy
run_monster_turn 0, ギョック
wake count => 6
run_monster_turn 1, グラスホーン
wake count => 4
run_monster_turn 2, スケルトス
run_monster_turn 3, モエボン
wake count => 4
run_party_turn 2, enemy
run_monster_turn 0, ギョック
wake count => 5
run_monster_turn 1, グラスホーン
wake count => 3
run_monster_turn 2, スケルトス
attack to スノーダンサー, hp => 28
run_monster_turn 3, モエボン
wake count => 3
run_party_turn 3, friend
run_monster_turn 0, スペルパス
attack to モエボン, hp => 37
run_monster_turn 1, ホネガシラ
attack to モエボン, hp => 31
run_monster_turn 2, ツノダンゴ
attack to モエボン, hp => 22
run_monster_turn 3, スノーダンサー
wake count => 2
run_party_turn 4, enemy
run_monster_turn 0, ギョック
wake count => 4
run_monster_turn 1, グラスホーン
wake count => 2
run_monster_turn 2, スケルトス
attack to スノーダンサー, hp => 16
run_monster_turn 3, モエボン
wake count => 2
run_party_turn 5, friend
run_monster_turn 0, スペルパス
attack to モエボン, hp => 19
run_monster_turn 1, ホネガシラ
attack to モエボン, hp => 13
run_monster_turn 2, ツノダンゴ
attack to モエボン, hp => 4
run_monster_turn 3, スノーダンサー
wake count => 1
run_party_turn 6, enemy
run_monster_turn 0, ギョック
wake count => 3
run_monster_turn 1, グラスホーン
wake count => 1
run_monster_turn 2, スケルトス
attack to スノーダンサー, hp => 4
run_monster_turn 3, モエボン
wake count => 1
run_party_turn 7, friend
run_monster_turn 0, スペルパス
attack to モエボン, hp => 1
run_monster_turn 1, ホネガシラ
attack to モエボン, hp => -5
run_monster_turn 2, ツノダンゴ
attack to スケルトス, hp => 31
run_monster_turn 3, スノーダンサー
wake count => 0
run_party_turn 8, enemy
run_monster_turn 0, ギョック
wake count => 2
run_monster_turn 1, グラスホーン
wake count => 0
run_monster_turn 2, スケルトス
attack to スノーダンサー, hp => -8
run_party_turn 9, friend
run_monster_turn 0, スペルパス
attack to スケルトス, hp => 28
run_monster_turn 1, ホネガシラ
attack to スケルトス, hp => 22
run_monster_turn 2, ツノダンゴ
attack to スケルトス, hp => 13
run_party_turn 10, enemy
run_monster_turn 0, ギョック
wake count => 1
run_monster_turn 1, グラスホーン
attack to ツノダンゴ, hp => 23
run_monster_turn 2, スケルトス
attack to ツノダンゴ, hp => 11
run_party_turn 11, friend
run_monster_turn 0, スペルパス
attack to スケルトス, hp => 10
run_monster_turn 1, ホネガシラ
attack to スケルトス, hp => 4
run_monster_turn 2, ツノダンゴ
attack to スケルトス, hp => -5
run_party_turn 12, enemy
run_monster_turn 0, ギョック
wake count => 0
run_monster_turn 1, グラスホーン
attack to ツノダンゴ, hp => -1
run_party_turn 13, friend
run_monster_turn 0, スペルパス
attack to グラスホーン, hp => 77
run_monster_turn 1, ホネガシラ
attack to グラスホーン, hp => 71
run_party_turn 14, enemy
run_monster_turn 0, ギョック
attack to ホネガシラ, hp => 18
run_monster_turn 1, グラスホーン
attack to ホネガシラ, hp => 6
run_party_turn 15, friend
run_monster_turn 0, スペルパス
attack to グラスホーン, hp => 68
run_monster_turn 1, ホネガシラ
attack to グラスホーン, hp => 62
run_party_turn 16, enemy
run_monster_turn 0, ギョック
attack to ホネガシラ, hp => -6
run_monster_turn 1, グラスホーン
attack to スペルパス, hp => -2
winner = enemy
friend_party = [#<Monster:0x007fb8ab814438 @id=1, @name="スペルパス", @hp=-2, @wake_count=0, @attack=3, @type="normal", @skills=[]>, #<Monster:0x007fb8ab814398 @id=2, @name="ホネガシラ", @hp=-6, @wake_count=0, @attack=6, @type="fire", @skills=[]>, #<Monster:0x007fb8ab8142f8 @id=3, @name="ツノダンゴ", @hp=-1, @wake_count=0, @attack=9, @type="normal", @skills=[]>, #<Monster:0x007fb8ab814258 @id=4, @name="スノーダンサー", @hp=-8, @wake_count=0, @attack=18, @type="ice", @skills=[]>]
enemy_party = [#<Monster:0x007fb8ab814190 @id=5, @name="ギョック", @hp=60, @wake_count=0, @attack=12, @type="fire", @skills=[]>, #<Monster:0x007fb8ab8140f0 @id=6, @name="グラスホーン", @hp=62, @wake_count=0, @attack=12, @type="ice", @skills=[]>, #<Monster:0x007fb8ab814050 @id=7, @name="スケルトス", @hp=-5, @wake_count=0, @attack=12, @type="normal", @skills=[]>, #<Monster:0x007fb8aa83be58 @id=8, @name="モエボン", @hp=-5, @wake_count=1, @attack=18, @type="fire", @skills=["fire_guard"]>]
```
