if mods["aai-industry"] then
  local aai_industry = data.raw["bool-setting"]["mdrn-use-aai-recipes"]
  aai_industry.hidden = true
  aai_industry.forced_value = false
end
