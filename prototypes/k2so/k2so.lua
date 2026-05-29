if not mods["Krastorio2-spaced-out"] then return end

-- Define the loader template for the tier 5 turbo belt
local loaders = {
  
  ["superior-"] = {
    underground_name = "kr-superior-underground-belt",
    order = "06",
    tint = util.color("862f9fd1"),                                  -- Purple tint for superior tier
    prerequisite_techs = { "kr-logistic-5", "mdrn-turbo-loader" }, -- Link to logistic-5 technology
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
  -- Adjust the new K2 loaders we're adding

  loaders["superior-"].recipe_data.ingredients = {
    { type = "item", name = "kr-imersium-gear-wheel", amount = 10 },
    { type = "item", name = "turbo-transport-belt", amount = 1 },
    { type = "item", name = "mdrn-turbo-loader", amount = 2 },
    { type = "fluid", name = "lubricant", amount = 40 },
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
        { type = "fluid", name = "lubricant", amount = 40 },
      }
    }
  }
  loaders["turbo-"] = {
    recipe_data = {
      ingredients = {
        { type = "item", name = "tungsten-plate", amount = 20 },
        { type = "item", name = "express-transport-belt", amount = 1 },
        { type = "item", name = "mdrn-express-loader", amount = 2 },
        { type = "fluid", name = "lubricant", amount = 40 },
      }
    }
  }
end

MdrnLoaders.add_loaders(loaders)
