if mods["aai-industry"] then
  local aai_industry = data.raw["bool-setting"]["mdrn-use-aai-recipes"]
  aai_industry.hidden = true
  aai_industry.forced_value = false
end

local chute = data.raw["bool-setting"]["mdrn-enable-chute"]
chute.hidden = true
chute.forced_value = false