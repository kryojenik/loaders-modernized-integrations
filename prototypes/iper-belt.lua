-- Iper Belt support

---@type table<string, LMLoaderTemplate>
local loaders = {
  ["iper-"] = {
    order = "d-iper",
    tint = util.color("4a5ad2d1"),
    upgrade_from_prefix = "express-",
    prerequisite_techs = { "iper-transport-belts", "express-mdrn-loader" },
    recipe_data = {
      ingredients = {
        {type = "item", name = "iper-underground-belt", amount = 1},
        {type = "item", name = "bulk-inserter", amount = 3},
        {type = "item", name = "express-mdrn-loader", amount = 1},
      },
      stack_ingredients = {
        {type = "item", name = "iper-underground-belt", amount = 1},
        {type = "item", name = "bulk-inserter", amount = 6},
        {type = "item", name = "express-mdrn-loader", amount = 1},
      }
    }
  },
}

if settings.startup["mdrn-enable-stacking"].value == "stack-tier" then
  loaders["iper-"].next_upgrade = "stack-mdrn-loader"
end

MdrnLoaders.add_loaders(loaders)