---@type table<string, LMLoaderTemplate>
local startup_settings = settings.startup

local inserters = {
  [false] = {
    ["basic"] = "burner-inserter",
    [""] = "inserter",
    ["fast"] ="fast-inserter",
    ["express"] = "bulk-inserter",
    ["turbo"] = "bob-express-inserter",
    ["ultimate"] = "bob-express-bulk-inserter"
  },
  [true] = {
    ["basic"] = "burner-inserter",
    [""] = "inserter",
    ["fast"] ="long-handed-inserter",
    ["express"] = "fast-inserter",
    ["turbo"] = "bob-turbo-inserter",
    ["ultimate"] = "bob-express-inserter"
  }
}

local stack_inserters = {
  [false] = {
    ["fast"] ="fast-inserter",
    ["express"] = "bulk-inserter",
    ["turbo"] = "bob-express-inserter",
    ["ultimate"] = "bob-express-bulk-inserter"
  },
  [true] = {
    ["fast"] ="bob-red-bulk-inserter",
    ["express"] = "bulk-inserter",
    ["turbo"] = "bob-turbo-bulk-inserter",
    ["ultimate"] = "bob-express-bulk-inserter"
  }
}
local bob_inserter_overhaul = startup_settings["bobmods-logistics-inserteroverhaul"].value
local loaders = {}

loaders[""] = {
  below_turbo = true,
  subgroup = "bob-logistic-tier-1",
  order = "j[loader]-1[mdrn-loader]",
  recipe_data = {
    ingredients = {
      {type = "item", name = "underground-belt", amount = 1},
      {type = "item", name = inserters[bob_inserter_overhaul][""], amount = 6},
    },
  }
}

loaders["fast-"] = {
  below_turbo = true,
  subgroup = "bob-logistic-tier-2",
  order = "j[loader]-1[fast-mdrn-loader]",
  recipe_data = {
    surface_conditions = data.raw["recipe"]["fast-underground-belt"].surface_conditions,
    ingredients = {
      {type = "item", name = "fast-underground-belt", amount = 1},
      {type = "item", name = inserters[bob_inserter_overhaul]["fast"], amount = 6},
      {type = "item", name = "mdrn-loader", amount = 1}
    },
    stack_ingredients = {
      {type = "item", name = "fast-underground-belt", amount = 1},
      {type = "item", name = stack_inserters[bob_inserter_overhaul]["fast"], amount = 6},
      {type = "item", name = "mdrn-loader", amount = 1}
    }
  }
}

loaders["express-"] = {
  below_turbo = true,
  next_upgrade = "turbo-mdrn-loader",
  subgroup = "bob-logistic-tier-3",
  order = "j[loader]-1[express-mdrn-loader]",
  recipe_data = {
    surface_conditions = data.raw["recipe"]["express-underground-belt"].surface_conditions,
    ingredients = {
      {type = "item", name = "express-underground-belt", amount = 1},
      {type = "item", name = inserters[bob_inserter_overhaul]["express"], amount = 6},
      {type = "item", name = "fast-mdrn-loader", amount = 1}
    },
    stack_ingredients = {
      {type = "item", name = "express-underground-belt", amount = 1},
      {type = "item", name = stack_inserters[bob_inserter_overhaul]["express"], amount = 6},
      {type = "item", name = "fast-mdrn-loader", amount = 1}
    }
  }
}

loaders["turbo-"] = {
  next_upgrade = "ultimate-mdrn-loader",
  previous_prefix = "express-",
  subgroup = "bob-logistic-tier-4",
  order = "j[loader]-1[turbo-mdrn-loader]",
  underground_name = "bob-turbo-underground-belt",
  tint = util.color("9926d3e1"),
  prerequisite_techs = { "logistics-4", "express-mdrn-loader" },
  recipe_data = {
    category = "crafting",
    surface_conditions = data.raw["recipe"]["bob-turbo-underground-belt"].surface_conditions,
    ingredients = {
      {type = "item", name = "bob-turbo-underground-belt", amount = 1},
      {type = "item", name = inserters[bob_inserter_overhaul]["turbo"], amount = 6},
      {type = "item", name = "express-mdrn-loader", amount = 1}
    },
    stack_ingredients = {
      {type = "item", name = "bob-turbo-underground-belt", amount = 1},
      {type = "item", name = stack_inserters[bob_inserter_overhaul]["turbo"], amount = 6},
      {type = "item", name = "express-mdrn-loader", amount = 1}
    }
  }
}

loaders["ultimate-"] = {
  subgroup = "bob-logistic-tier-5",
  order = "j[loader]-1[ultimate-mdrn-loader]",
  underground_name = "bob-ultimate-underground-belt",
  tint = util.color("26d160e1"),
  prerequisite_techs = {"logistics-5", "turbo-mdrn-loader"},
  recipe_data = {
    ingredients = {
      {type = "item", name = "bob-ultimate-underground-belt", amount = 1},
      {type = "item", name = inserters[bob_inserter_overhaul]["ultimate"], amount = 6},
      {type = "item", name = "turbo-mdrn-loader", amount = 1}
    },
    stack_ingredients = {
      {type = "item", name = "bob-ultimate-underground-belt", amount = 1},
      {type = "item", name = stack_inserters[bob_inserter_overhaul]["ultimate"], amount = 6},
      {type = "item", name = "turbo-mdrn-loader", amount = 1}
    }
  }
}

if settings.startup["bobmods-logistics-beltoverhaul"].value == true then
  loaders["basic-"] = {
    below_turbo = true,
    no_filter = true,
    next_upgrade = "mdrn-loader",
    underground_name = "bob-basic-underground-belt",
    tint = util.color("808080d1"),
    subgroup = "bob-logistic-tier-0",
    order = "j[loader]-1[basic-mdrn-loader]",
    prerequisite_techs = {"logistics-0"},
    unit = {
      count = 10,
      ingredients = {
        { "automation-science-pack", 1 },
      },
      time = 20,
    },
    recipe_data = {
      ingredients = {
        {type = "item", name = "bob-basic-underground-belt", amount = 1},
        {type = "item", name = inserters[bob_inserter_overhaul]["basic"], amount = 3}
      },
    }
  }
  loaders[""].recipe_data.ingredients[#loaders[""].recipe_data.ingredients+1] = {
    type = "item",
    name = "basic-mdrn-loader",
    amount = 1
  }

end

if startup_settings["mdrn-enable-stacking"].value =="stack-tier" then
  loaders["stack-"] = {
    underground_name = "bob-ultimate-underground-belt",
    order = "j[loader]-1[stack-mdrn-loader]",
    subgroup = "inserter"
  }
end

MdrnLoaders.make_modern_loaders{loaders = loaders}