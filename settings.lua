if mods["Krastorio2"] then
  data:extend({
    {
      type = "bool-setting",
      name = "mdrn-use-k2-recipes",
      order = "sa",
      setting_type = "startup",
      default_value = true,
    }
  })
end
if mods["Krastorio2-spaced-out"] then
  data:extend({
    {
      type = "bool-setting",
      name = "mdrn-use-k2-recipes",
      order = "sa",
      setting_type = "startup",
      default_value = true,
    }
  })
end

if mods["5dim_transport"] then
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
end
