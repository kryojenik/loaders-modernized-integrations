-- SE forces AAI recipes and wins over Bob's when both are present.
if mods["space-exploration"] then
  local use_aai = data.raw["bool-setting"]["mdrn-use-aai-recipes"]
  use_aai.forced_value = true
  use_aai.hidden = true

  if mods["Krastorio2"] then
    local use_k2 = data.raw["bool-setting"]["mdrn-use-k2-recipes"]
    use_k2.forced_value = false
    use_k2.hidden = true

    local unlock = data.raw["string-setting"]["mdrn-unlock-technology"]
    unlock.allowed_values = { "separate" }
    unlock.default_value = "separate"
    unlock.hidden = true
  end
elseif mods["boblogistics"] and mods["aai-industry"] then
  local use_aai = data.raw["bool-setting"]["mdrn-use-aai-recipes"]
  use_aai.hidden = true
  use_aai.forced_value = false
end

if mods["5dim_transport"] then
  local mut = data.raw["string-setting"]["mdrn-unlock-technology"]
  mut.default_value = "belt"
  mut.allowed_values = { "belt" }
  mut.hidden = true
end

if mods["pycoalprocessing"] then
  local stacking = data.raw["string-setting"]["mdrn-enable-stacking"]
  stacking.allowed_values = { "none", "all", "stack-tier" }
  stacking.default_value = "none"
end
