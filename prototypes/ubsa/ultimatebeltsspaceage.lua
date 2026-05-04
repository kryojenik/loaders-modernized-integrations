-- Ultimate Belts Space Age!
---@type table<string, LMLoaderTemplate>
local loaders = {
  ["ultra-fast-"] = {
    --Ultimate belts move on passed express and ignore Space Age! Turbo belts
    next_upgrade = "mdrn-extreme-fast-loader",
    upgrade_from_tier = "express-",
    tint = util.color("00ac08d1"),
    order = "05",
    prerequisite_techs = {
      "ultra-fast-logistics",
      "mdrn-express-loader"
    },
    recipe_data = {
      ingredients = {
        { type = "item", name = "ultra-fast-underground-belt", amount = 1 },
        { type = "item", name = "bulk-inserter", amount = 3 },
        { type = "item", name = "mdrn-express-loader", amount = 1 },
      },
      stack_ingredients = {
        { type = "item", name = "ultra-fast-underground-belt", amount = 1 },
        { type = "item", name = "bulk-inserter", amount = 6 },
        { type = "item", name = "mdrn-express-loader", amount = 1 },
      }
    }
  },
  ["extreme-fast-"] = {
    next_upgrade = "mdrn-ultra-express-loader",
    tint = util.color("db071fd1"),
    order = "06",
    prerequisite_techs = { "extreme-fast-logistics", "mdrn-ultra-fast-loader" },
    recipe_data = {
      ingredients = {
        { type = "item", name = "extreme-fast-underground-belt", amount = 1 },
        { type = "item", name = "bulk-inserter", amount = 3 },
        { type = "item", name = "mdrn-ultra-fast-loader", amount = 1 },
      },
      stack_ingredients = {
        { type = "item", name = "extreme-fast-underground-belt", amount = 1 },
        { type = "item", name = "bulk-inserter", amount = 6 },
        { type = "item", name = "mdrn-ultra-fast-loader", amount = 1 },
      }
    }
  },
  ["ultra-express-"] = {
    next_upgrade = "mdrn-extreme-express-loader",
    tint = util.color("4a01d8d1"),
    order = "07",
    prerequisite_techs = {
      "ultra-express-logistics",
      "mdrn-extreme-fast-loader"
    },
    recipe_data = {
      ingredients = {
        { type = "item", name = "ultra-express-underground-belt", amount = 1 },
        { type = "item", name = "bulk-inserter", amount = 3 },
        { type = "item", name = "mdrn-extreme-fast-loader", amount = 1 },
      },
      stack_ingredients = {
        { type = "item", name = "ultra-express-underground-belt", amount = 1 },
        { type = "item", name = "bulk-inserter", amount = 6 },
        { type = "item", name = "mdrn-extreme-fast-loader", amount = 1 },
      }
    }
  },
  ["extreme-express-"] = {
    next_upgrade = "mdrn-original-ultimate-loader",
    tint = util.color("0620d6d1"),
    order = "08",
    prerequisite_techs = {
      "extreme-express-logistics",
      "mdrn-ultra-express-loader"
    },
    recipe_data = {
      ingredients = {
        { type = "item", name = "extreme-express-underground-belt", amount = 1 },
        { type = "item", name = "bulk-inserter", amount = 3 },
        { type = "item", name = "mdrn-ultra-express-loader", amount = 1 },
      },
      stack_ingredients = {
        { type = "item", name = "extreme-express-underground-belt", amount = 1 },
        { type = "item", name = "bulk-inserter", amount = 6 },
        { type = "item", name = "mdrn-ultra-express-loader", amount = 1 },
      }
    }
  },
  ["original-ultimate-"] = {
    tint = util.color("06d9c4d1"),
    order = "09",
    prerequisite_techs = {
      "ultimate-logistics",
      "mdrn-extreme-express-loader"
    },
    recipe_data = {
      ingredients = {
        { type = "item", name = "original-ultimate-underground-belt", amount = 1 },
        { type = "item", name = "bulk-inserter", amount = 3 },
        { type = "item", name = "mdrn-extreme-express-loader", amount = 1 },
      },
      stack_ingredients = {
        { type = "item", name = "original-ultimate-underground-belt", amount = 1 },
        { type = "item", name = "bulk-inserter", amount = 6 },
        { type = "item", name = "mdrn-extreme-express-loader", amount = 1 },
      }
    }
  },
}

MdrnLoaders.add_loaders(loaders)
