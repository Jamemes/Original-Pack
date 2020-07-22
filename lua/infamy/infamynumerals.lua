function ExperienceManager:rank_string(rank)
	if rank >= 26 then
		return "LOL NOOB"
	elseif rank >= 15 then
		return "TESTER"
	elseif rank == 14 then
		return "ACE"
	elseif rank == 13 then
		return "K"
	elseif rank == 12 then
		return "Q"
	elseif rank == 11 then
		return "J"
	end
	local numbers = {
		1,
		5,
		10,
		50,
		100,
		500,
		1000
	}
	local chars = {
		"I",
		"V",
		"X",
		"L",
		"C",
		"D",
		"M"
	}
	local roman = ""

	for i = #numbers, 1, -1 do
		local num = numbers[i]

		while rank - num >= 0 and rank > 0 do
			roman = roman .. chars[i]
			rank = rank - num
		end

		for j = 1, i - 1, 1 do
			local num2 = numbers[j]

			if rank - (num - num2) >= 0 and rank < num and rank > 0 and num - num2 ~= num2 then
				roman = roman .. chars[j] .. chars[i]
				rank = rank - (num - num2)

				break
			end
		end
	end

	return roman
end