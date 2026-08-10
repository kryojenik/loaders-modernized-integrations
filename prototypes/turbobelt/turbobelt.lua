if not mods["TurboBelt"] then return end

local cfg = require("__loaders-modernized__.prototypes.settings-cache")

-- Shouldn't happen since TurboBelt is !space-age.  Just in case.
if cfg.has_space_age then return end

local loaders = {
  ["turbo-"] = {
    order = "04",
    tint = util.color("9bb600d1"),
    upgrade_from_tier = "express-",
    prerequisite_techs = { "turbo-transport-belt", "mdrn-express-loader" },
    recipe_data = {
      ingredients = {
        { type = "item", name = "turbo-underground-belt", amount = 1 },
        { type = "item", name = "bulk-inserter", amount = 6 },
        { type = "item", name = "mdrn-express-loader", amount = 1 },
      },
    },
  },
}

if mods["sei-turbo-belts"] then
  loaders["turbo-"].recipe_data.ingredients = {
    { type = "item", name = "electric-engine-unit", amount = 5 },
    { type = "item", name = "mdrn-express-loader", amount = 1 },
    { type = "item", name = "se-iridium-plate", amount = 4 },
    { type = "fluid", name = "lubricant", amount = 60 },
  }
end

MdrnLoaders.add_loaders(loaders)
