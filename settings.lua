data:extend({
  -- STARTUP SETTINGS
  {
    type = "bool-setting",
    name = "mdrn-use-se-recipes",
    order = "sa",
    setting_type = "startup",
    default_value = false
  }
})

local use_aai = data.raw["bool-setting"]["mdrn-use-aai-recipes"]
use_aai.hidden = true
use_aai.forced_value = true

if mods["Krastorio2"] then
  if mods["loaders-modernized-k2"] then
    local use_k2 = data.raw["bool-setting"]["mdrn-use-k2-recipes"]
    use_k2.forced_value = false
    use_k2.hidden = true
  end

  --[[
  local unlock = data.raw["string-setting"]["mdrn-unlock-technology"]
  unlock.hidden = true
  unlock.allowed_values = { "belt" }
  unlock.default_value = "belt"
  ]]
end