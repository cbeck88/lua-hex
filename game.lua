{ init : '
	print("game initializing")
	
	Anura.me._end_turn = function()
		local turn = Anura.me.turn

		print("turn " .. turn)
		Anura.me.turn = turn + 1

		local new_map = {}
		for loc,str in pairs(Anura.me.map) do
			if str == "blank" or str == "blue" then
				local new_loc = { loc[1]+1, loc[2] + 1}
				local new_str = "blue"
				if str == "blue" then new_str = "green" end
				new_map[new_loc] = new_str
			end
		end

		local mod = turn % 4
		new_map[{0, mod}] = "blank"
		new_map[{0, 4 + mod}] = "blank"
		new_map[{mod, 0}] = "blank"
		new_map[{4 + mod, 0}] = "blank"

		if (mod == 0) then
			new_map[{4, 5}] = "blank"
			new_map[{4, 6}] = "blank"
			new_map[{5, 5}] = "blank"
			new_map[{5, 7}] = "blank"
			new_map[{6, 6}] = "blank"
			new_map[{6, 7}] = "blank"
		end

		Anura.me.map = new_map
		
		local units = Anura.me.units
		if units and #units > 0 then
			local u = units[1]
			u.loc = { 4 + math.random(4), 4 + math.random(4) }
		end
	end
',
	debug_name: "data/game.lua"
}
