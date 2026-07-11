if not mods["Krastorio2-spaced-out"] then return end

-- Define the loader template for the tier 5 turbo belt
local loaders = {

  ["superior-"] = {
    upgrade_from_tier = "turbo-",
    prerequisite_techs = { "kr-logistic-5", "mdrn-turbo-loader" },
    recipe_data = {
      ingredients = {
        { type = "item", name = "turbo-underground-belt", amount = 1 },
        { type = "item", name = "mdrn-turbo-loader",      amount = 1 },
        { type = "item", name = "kr-superior-inserter",   amount = 2 },
        { type = "fluid", name = "lubricant", amount = 40 },
      }
    }
  }
}

if settings.startup["mdrn-use-k2-recipes"].value == true then
  -- Create new template entries to modify already existing loaders from base.
  -- K2SO takes advantage of lubricant
  loaders["express-"] = {
    recipe_data = {
      ingredients = {
        { type = "item", name = "kr-steel-gear-wheel", amount = 10 },
        { type = "item", name = "express-transport-belt", amount = 1 },
        { type = "item", name = "mdrn-fast-loader", amount = 2 },
        { type = "fluid", name = "lubricant", amount = 40 },
      }
    }
  }
  loaders["turbo-"] = {
    recipe_data = {
      ingredients = {
        { type = "item", name = "tungsten-plate", amount = 20 },
        { type = "item", name = "turbo-transport-belt", amount = 1 },
        { type = "item", name = "mdrn-express-loader", amount = 2 },
        { type = "fluid", name = "lubricant", amount = 40 },
      }
    }
  }
end

MdrnLoaders.add_loaders(loaders)
