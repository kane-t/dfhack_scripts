-- List names and unit IDs of all citizens in a fort.
-- (Code stolen from a Roses script.)
function getSexString(sex)
 local sexStr
 if sex==0 then
  sexStr=string.char(12)
 elseif sex==1 then
  sexStr=string.char(11)
 else
  return ""
 end
 return string.char(40)..sexStr..string.char(41)
end

local function nameOrSpeciesAndNumber(unit)
 if unit.name.has_name then
  return dfhack.TranslateName(dfhack.units.getVisibleName(unit))..' '..getSexString(unit.sex),true
 else
  return 'Unit #'..unit.id..' ('..df.creature_raw.find(unit.race).caste[unit.caste].caste_name[0]..' '..getSexString(unit.sex)..')',false
 end
end

for k,v in ipairs(df.global.world.units.active) do
	if dfhack.units.isCitizen(v) then
		print(nameOrSpeciesAndNumber(v) .. ": ID=" .. v.id)
	end
end
