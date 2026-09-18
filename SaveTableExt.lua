function Utils.DoSaveTable(tbl, cmp, fileName, fileIsOpen, preText)
	local file = nil
	if fileIsOpen == nil then
		file = io.open(fileName, "w")
	else
		file = fileIsOpen
	end

	cmp = cmp or {}
	if tbl and type(tbl) == "table" then
		for k, v in pairs(tbl) do
			if type(v) == "table" and not cmp[v] then
				cmp[v] = true
				if table.size(v) == 0 then
					file:write(preText .. string.format("%s = {", type(k) == "number" and tostring('[' .. k .. ']') or tostring(k)) .. "},\n")
				else
					file:write(preText .. string.format("%s = {", type(k) == "number" and tostring('[' .. k .. ']') or tostring(k)) .. "\n")
					Utils.DoSaveTable(v, cmp, fileName, file, preText .. "\t")
					file:write(preText .. "},\n")
				end
			else
				file:write(preText .. string.format("%s = %s", type(k) == "number" and tostring('[' .. k .. ']') or tostring(k), type(v) == "string" and tostring('"' .. v .. '"') or tostring(v)) .. ",\n")
			end
		end
	else
		file:write(preText .. tostring(tbl) .. ",\n")
	end

	if fileIsOpen == nil then
		file:close()
	end
end