
for _,ingredient in ipairs(data.raw["recipe"]["kj_vierling"].ingredients) do 
	if ingredient ~= nil and ingredient.amount ~= nil then
		ingredient.amount = ingredient.amount * settings.startup["kj_vierling_cost_setting_multiplicator"].value
	end
end
for _,ingredient in ipairs(data.raw["recipe"]["kj_2cmfv_normal_vierling"].ingredients) do 
	if ingredient ~= nil and ingredient.amount ~= nil then
		ingredient.amount = ingredient.amount * settings.startup["kj_vierling_cost_setting_multiplicator"].value
	end
end