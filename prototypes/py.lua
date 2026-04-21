-- Py Specific loaders

if mods["pycoalprocessing"] and settings.startup["mdrn-enable-stacking"].value == "stack-tier"
and data.raw["inserter"]["py-stack-inserter"] then
  MdrnLoaders.add_loaders{
    ["stack-"] = {
      order = "z",
      tint = util.color("F5F5F5D1"),
      underground_name = "express-underground-belt",
      upgrade_from_prefix = "express-",
      prerequisite_techs = { "py-transport-belt-capacity-1", "express-mdrn-loader" },
      max_belt_stack_size = data.raw["utility-constants"].default.max_belt_stack_size,
      recipe_data = {
        ingredients = {
          --{type = "item", name = "express-underground-belt", amount = 1},
          {type = "item", name = "py-stack-inserter", amount = 3},
          {type = "item", name = "express-mdrn-loader", amount = 1},
        },
      }
    },
  }
end
