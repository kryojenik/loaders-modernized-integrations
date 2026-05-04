if not mods["Krastorio2"] then return end

-- Define the loader template for the tier 5 turbo belt
local loaders = {
  ["advanced-"] = {
    upgrade_from_tier = "express-",
    next_upgrade = "mdrn-superior-loader",
    underground_name = "kr-advanced-underground-belt",
    order = "05",
    tint = util.color("4fbf38d1"),                                 -- Green tint for Advanced tier
    prerequisite_techs = { "kr-logistic-4", "mdrn-express-loader" }, -- Link to logistic-4 technology
    recipe_data = {
      ingredients = {
        { type = "item", name = "kr-advanced-underground-belt", amount = 1 },
        { type = "item", name = "mdrn-express-loader",      amount = 1 },
        { type = "item", name = "bulk-inserter",          amount = 4 }
      }
    }
  },
  ["superior-"] = {
    underground_name = "kr-superior-underground-belt",
    order = "06",
    tint = util.color("862f9fd1"),                                  -- Purple tint for superior tier
    prerequisite_techs = { "kr-logistic-5", "mdrn-advanced-loader" }, -- Link to logistic-5 technology
    recipe_data = {
      ingredients = {
        { type = "item", name = "kr-superior-underground-belt", amount = 1 },
        { type = "item", name = "mdrn-advanced-loader",      amount = 1 },
        { type = "item", name = "kr-superior-inserter",          amount = 2 }
      }
    }
  }
}

if settings.startup["mdrn-use-k2-recipes"].value == true then
  -- Adjust the new K2 loaders we're adding
  loaders["advanced-"].recipe_data.ingredients = {
    { type = "item", name = "kr-rare-metals", amount = 10 },
    { type = "item", name = "kr-advanced-transport-belt", amount = 1 },
    { type = "item", name = "mdrn-express-loader", amount = 2 },
  }
  loaders["superior-"].recipe_data.ingredients = {
    { type = "item", name = "kr-imersium-gear-wheel", amount = 10 },
    { type = "item", name = "kr-superior-transport-belt", amount = 1 },
    { type = "item", name = "mdrn-advanced-loader", amount = 2 },
  }

  -- Create new template entries to modify already existing loaders from base.
  loaders[""] = {
    recipe_data = {
      ingredients = {
        { type = "item", name = "iron-gear-wheel", amount = 10 },
        { type = "item", name = "kr-iron-beam", amount = 2 },
        { type = "item", name = "transport-belt", amount = 1 }
      }
    }
  }
  loaders["fast-"] = {
    recipe_data = {
      ingredients = {
        { type = "item", name = "iron-gear-wheel", amount = 10 },
        { type = "item", name = "fast-transport-belt", amount = 1 },
        { type = "item", name = "mdrn-loader", amount = 2 },
      }
    }
  }
  loaders["express-"] = {
    recipe_data = {
      ingredients = {
        { type = "item", name = "kr-steel-gear-wheel", amount = 10 },
        { type = "item", name = "express-transport-belt", amount = 1 },
        { type = "item", name = "mdrn-fast-loader", amount = 2 },
      }
    }
  }
end

MdrnLoaders.add_loaders(loaders)
