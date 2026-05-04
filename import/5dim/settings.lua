data:extend({
  {
    type = "string-setting",
    name = "mdrn-keep-5d-loaders",
    order = "sg",
    setting_type = "startup",
    default_value = "none",
    allowed_values = {"none", "1x2", "all"}
  },
})
local mut = data.raw["string-setting"]["mdrn-unlock-technology"]
mut.default_value = "belt"
mut.allowed_values = { "belt" }
mut.hidden = true
