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
