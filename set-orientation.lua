-- Set the sexual orientation of a unit with the given ID
local utils = require 'utils'

validArgs = validArgs or utils.invert({ 'unit', 'men', 'women'})
local args = utils.processArgs({...}, validArgs)

local men = -1
local women = -1
local unit = nil

if args.unit and tonumber(args.unit) then -- Check for unit declaration !REQUIRED
	unit = df.unit.find(tonumber(args.unit))
else
	unit = dfhack.gui.getSelectedUnit()
end

if unit == nil then
	print('No unit selected')
	return
end

if unit == nil then
	print('Bad unit ID')
	return
end

if args.men and tonumber(args.men) then
	men = tonumber(args.men)
	if men < 0 or men > 2 then
		print('Bad orientation value for men (valid values: 0, 1, 2)')
		return
	end
end

if args.women and tonumber(args.women) then
	women = tonumber(args.women)
	if women < 0 or women > 2 then
		print('Bad orientation value for women (valid values: 0, 1, 2)')
		return
	end
end

if men == -1 and women == -1 then
	print('Have to specify a value for either men or women (valid values: 0, 1, 2)')
	return
end

if men == 0 then
	unit.status.current_soul.orientation_flags.romance_male = 0
	unit.status.current_soul.orientation_flags.marry_male = 0
end
if men == 1 then
	unit.status.current_soul.orientation_flags.romance_male = 1
	unit.status.current_soul.orientation_flags.marry_male = 0
end
if men == 2 then
	unit.status.current_soul.orientation_flags.romance_male = 0
	unit.status.current_soul.orientation_flags.marry_male = 1
end

if women == 0 then
	unit.status.current_soul.orientation_flags.romance_female = 0
	unit.status.current_soul.orientation_flags.marry_female = 0
end
if women == 1 then
	unit.status.current_soul.orientation_flags.romance_female = 1
	unit.status.current_soul.orientation_flags.marry_female = 0
end
if women == 2 then
	unit.status.current_soul.orientation_flags.romance_female = 0
	unit.status.current_soul.orientation_flags.marry_female = 1
end
