#!/usr/bin/env ruby

class Monster
	attr_accessor :id
	attr_accessor :name
	attr_accessor :hp
	attr_accessor :wake_count
	attr_accessor :attack
	attr_accessor :type
	attr_accessor :skills

	def initialize(id, name, hp, wake_count, attack, type, skills)
		@id = id
		@name = name
		@hp = hp
		@wake_count = wake_count
		@attack = attack
		@type = type
		@skills = skills
	end
	def is_alive()
		return @hp > 0
	end
	def is_awaked()
		return @wake_count == 0
	end
end

class MonsterTable
	def initialize()
		@entries = []
	end
	def append(monster)
		@entries.push(monster)
	end
	def find(id)
		return @entries.find { |e|
			e.id == id
		}
	end
	def make(id)
		return find(id).clone()
	end
end

class App
	def initialize()
	end
	def setup_monster_table()
		t = MonsterTable.new()
		@monster_table = t
		
		t.append(Monster.new(1, "スペルパス", 10, 1, 3, "normal", []))
		t.append(Monster.new(2, "ホネガシラ", 30, 3, 6, "fire", []))
		t.append(Monster.new(3, "ツノダンゴ", 35, 5, 9, "normal", []))
		t.append(Monster.new(4, "スノーダンサー", 40, 4, 9, "ice", []))
		t.append(Monster.new(5, "ギョック", 60, 7, 12, "fire", []))
		t.append(Monster.new(6, "グラスホーン", 80, 7, 12, "ice", []))
		t.append(Monster.new(7, "スケルトス", 40, 4, 12, "normal", []))
		t.append(Monster.new(8, "モエボン", 40, 5, 9, "fire", ["fire_guard"]))
		t.append(Monster.new(9, "シャーベラット", 30, 1, 6, "ice", []))
		t.append(Monster.new(10, "ディックペイン", 20, 5, 0, "normal", ["mood_maker"]))
	end
	def setup_parties()
		mt = @monster_table
		@friend_party = [
			mt.make(1),
			mt.make(2),
			mt.make(3),
			mt.make(4)
		]
		@enemy_party = [
			mt.make(5),
			mt.make(6),
			mt.make(7),
			mt.make(8)
		]
	end

	def get_party_of_monster(monster)
		if @friend_party.find { |e| e == monster }
			return @friend_party
		end
		return @enemy_party
	end
	def get_side_of_party(party)
		if party == @friend_party
			return "friend"
		else
			return "enemy"
		end
	end
	def get_party_with_side(side)
		if side == "friend"
			return @friend_party
		else
			return @enemy_party
		end
	end
	def get_opponent_party(party)
		side = get_side_of_party(party)
		if side == "friend"
			return @enemy_party
		else
			return @friend_party
		end
	end
	def get_attack_target(opponent_party)
		opponent_party.reverse_each do |e|
			if ! e.is_alive()
				next
			end
			return e
		end
		return nil
	end
	def get_party_alive_num(party)
		return party.select { |e| e.is_alive() }.count
	end

	def get_winner_side()
		if get_party_alive_num(@friend_party) == 0
			return "enemy"
		end
		if get_party_alive_num(@enemy_party) == 0
			return "friend"
		end
		return nil
	end

	def is_battle_finished()
		return get_winner_side() != nil
	end

	def apply_position_effect(party)
		party[1].wake_count -= 2
		party[2].wake_count -= 4
		party[3].attack *= 2
	end

	def run_battle()
		@turn_count = 0

		apply_position_effect(@friend_party)
		apply_position_effect(@enemy_party)

		run_party_turn(@friend_party, waking_turn: true)
		run_party_turn(@enemy_party, waking_turn: true)

		party = @enemy_party
		while true
			if is_battle_finished()
				break
			end
			run_party_turn(party)
			party = get_opponent_party(party)
		end

		puts "winner = #{get_winner_side()}"
		puts "friend_party = #{@friend_party}"
		puts "enemy_party = #{@enemy_party}"
	end

	def run_party_turn(party, waking_turn: false)
		side = get_side_of_party(party)
		puts "run_party_turn #{@turn_count}, #{side}"

		party.each do |m|
			if is_battle_finished()
				return
			end
			run_monster_turn(m, waking_turn: waking_turn)
		end

		@turn_count += 1
	end

	def run_monster_turn(monster, waking_turn: false)
		m = monster

		party = get_party_of_monster(m)
		opp_party = get_opponent_party(party)

		index = party.index(monster)


		if ! m.is_alive()
			return
		end

		puts "run_monster_turn #{index}, #{monster.name}"

		if ! m.is_awaked()
			m.wake_count -= 1
			puts "wake count => #{m.wake_count}"
			return
		end

		if waking_turn
			return
		end

		target = get_attack_target(opp_party)
		target.hp -= m.attack

		puts "attack to #{target.name}, hp => #{target.hp}"
	end

	def run()
		setup_monster_table()
		setup_parties()

		run_battle()
	end
end

app = App.new
app.run()

