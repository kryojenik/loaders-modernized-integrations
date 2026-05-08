if not mods["boblogistics"] then return end

local C   = require("__loaders-modernized__.constants")
local cfg = require("__loaders-modernized__.prototypes.settings-cache")

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
  subgroup = "bob-logistic-tier-2",
  order = "j[loader]-1[mdrn-fast-loader]",
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
  next_upgrade = "mdrn-turbo-loader",
  subgroup = "bob-logistic-tier-3",
  order = "j[loader]-1[mdrn-express-loader]",
  recipe_data = {
    surface_conditions = data.raw["recipe"]["express-underground-belt"].surface_conditions,
    ingredients = {
      {type = "item", name = "express-underground-belt", amount = 1},
      {type = "item", name = inserters[bob_inserter_overhaul]["express"], amount = 6},
      {type = "item", name = "mdrn-fast-loader", amount = 1}
    },
    stack_ingredients = {
      {type = "item", name = "express-underground-belt", amount = 1},
      {type = "item", name = stack_inserters[bob_inserter_overhaul]["express"], amount = 6},
      {type = "item", name = "mdrn-fast-loader", amount = 1}
    }
  }
}

loaders["turbo-"] = {
  next_upgrade = "mdrn-ultimate-loader",
  upgrade_from_tier = "express-",
  subgroup = "bob-logistic-tier-4",
  order = "j[loader]-1[mdrn-turbo-loader]",
  underground_name = "bob-turbo-underground-belt",
  tint = util.color("9926d3e1"),
  prerequisite_techs = { "logistics-4", "mdrn-express-loader" },
  recipe_data = {
    category = data.raw["recipe"]["bob-turbo-underground-belt"].category,
    surface_conditions = data.raw["recipe"]["bob-turbo-underground-belt"].surface_conditions,
    ingredients = {
      {type = "item", name = "bob-turbo-underground-belt", amount = 1},
      {type = "item", name = inserters[bob_inserter_overhaul]["turbo"], amount = 6},
      {type = "item", name = "mdrn-express-loader", amount = 1}
    },
    stack_ingredients = {
      {type = "item", name = "bob-turbo-underground-belt", amount = 1},
      {type = "item", name = stack_inserters[bob_inserter_overhaul]["turbo"], amount = 6},
      {type = "item", name = "mdrn-express-loader", amount = 1}
    }
  }
}

loaders["ultimate-"] = {
  subgroup = "bob-logistic-tier-5",
  order = "j[loader]-1[mdrn-ultimate-loader]",
  underground_name = "bob-ultimate-underground-belt",
  tint = util.color("26d160e1"),
  prerequisite_techs = {"logistics-5", "mdrn-turbo-loader"},
  recipe_data = {
    ingredients = {
      {type = "item", name = "bob-ultimate-underground-belt", amount = 1},
      {type = "item", name = inserters[bob_inserter_overhaul]["ultimate"], amount = 6},
      {type = "item", name = "mdrn-turbo-loader", amount = 1}
    },
    stack_ingredients = {
      {type = "item", name = "bob-ultimate-underground-belt", amount = 1},
      {type = "item", name = stack_inserters[bob_inserter_overhaul]["ultimate"], amount = 6},
      {type = "item", name = "mdrn-turbo-loader", amount = 1}
    }
  }
}

if cfg.chute_mode ~= C.CHUTE.NONE then
  loaders["chute-"] = {
    tech_data = false,
    speed_multiplier = .5,
    subgroup = "bob-logistic-tier-0",
  }
end

if startup_settings["bobmods-logistics-beltoverhaul"].value == true then
  if cfg.chute_mode ~= C.CHUTE.NONE then
    local chute = loaders["chute-"]
    chute.underground_name = "bob-basic-underground-belt"
    chute.next_upgrade = "mdrn-basic-loader"
    chute.tint = util.color("000000d1")
  end

  loaders["basic-"] = {
    next_upgrade = "mdrn-loader",
    underground_name = "bob-basic-underground-belt",
    below_base = false,
    filter = cfg.chute_mode == C.CHUTE.FILTERED and true or false,
    tint = util.color("808080d1"),
    subgroup = "bob-logistic-tier-0",
    order = "j[loader]-1[mdrn-basic-loader]",
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
    name = "mdrn-basic-loader",
    amount = 1
  }

end

if cfg.stacking == C.STACKING.STACK_TIER then
  loaders["stack-"] = {
    underground_name = "bob-ultimate-underground-belt",
    order = "j[loader]-1[mdrn-stack-loader]",
    subgroup = "inserter"
  }
end

MdrnLoaders.add_loaders(loaders)
