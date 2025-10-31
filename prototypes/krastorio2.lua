-- Define the loader template for the tier 5 turbo belt
local templates = {}
templates.loaders = {
  ["advanced-"] = {
    previous_prefix = "express-",
    underground_name = "kr-advanced-underground-belt",
    tint = util.color("4fbf38d1"),                                 -- Green tint for Advanced tier
    prerequisite_techs = { "kr-logistic-4", "express-mdrn-loader" }, -- Link to logistic-4 technology
    recipe_data = {
      ingredients = {
        { type = "item", name = "kr-advanced-underground-belt", amount = 1 },
        { type = "item", name = "express-mdrn-loader",      amount = 1 },
        { type = "item", name = "bulk-inserter",          amount = 4 }
      }
    }
  },
  ["superior-"] = {
    previous_prefix = "advanced-",
    underground_name = "kr-superior-underground-belt",
    tint = util.color("862f9fd1"),                                  -- Purple tint for superior tier
    prerequisite_techs = { "kr-logistic-5", "advanced-mdrn-loader" }, -- Link to logistic-5 technology
    recipe_data = {
      ingredients = {
        { type = "item", name = "kr-superior-underground-belt", amount = 1 },
        { type = "item", name = "advanced-mdrn-loader",      amount = 1 },
        { type = "item", name = "kr-superior-inserter",          amount = 2 }
      }
    }
  }
}

if settings.startup["mdrn-use-k2-recipes"].value == true then
  templates.loaders[""] = {
    recipe_data = {
      ingredients = {
        { type = "item", name = "iron-gear-wheel", amount = 10 },
        { type = "item", name = "kr-iron-beam", amount = 2 },
        { type = "item", name = "transport-belt", amount = 1 }
      }
    }
  }
  templates.loaders["fast-"] = {
    recipe_data = {
      ingredients = {
        { type = "item", name = "iron-gear-wheel", amount = 10 },
        { type = "item", name = "fast-transport-belt", amount = 1 },
        { type = "item", name = "mdrn-loader", amount = 2 },
      }
    }
  }
  templates.loaders["express-"] = {
    recipe_data = {
      ingredients = {
        { type = "item", name = "kr-steel-gear-wheel", amount = 10 },
        { type = "item", name = "express-transport-belt", amount = 1 },
        { type = "item", name = "fast-mdrn-loader", amount = 2 },
      }
    }
  }
  templates.loaders["advanced-"].recipe_data.ingredients = {
    { type = "item", name = "kr-rare-metals", amount = 10 },
    { type = "item", name = "kr-advanced-transport-belt", amount = 1 },
    { type = "item", name = "express-mdrn-loader", amount = 2 },
  }
  templates.loaders["superior-"].recipe_data.ingredients = {
    { type = "item", name = "kr-imersium-gear-wheel", amount = 10 },
    { type = "item", name = "kr-superior-transport-belt", amount = 1 },
    { type = "item", name = "advanced-mdrn-loader", amount = 2 },
  }
end

MdrnLoaders.make_modern_loaders(templates)