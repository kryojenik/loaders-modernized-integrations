if not mods["more-belts"] then return end

local C   = require("__loaders-modernized__.constants")
local cfg = require("__loaders-modernized__.prototypes.settings-cache")

---@type table<string, LMLoaderTemplate>
local loaders = {
  ["ddi-loader-mk4-"] = {
    name              = "mdrn-ddi-loader-mk4",
    underground_name  = "ddi-underground-belt-mk4",
    order             = "05",
    tint              = util.color("29a842d1"),
    upgrade_from_tier = "express-",
    next_upgrade      = "mdrn-ddi-loader-mk5",
    prerequisite_techs = { "logistics-4", "mdrn-express-loader" },
    recipe_data = {
      ingredients = {
        { type = "item", name = "ddi-underground-belt-mk4", amount = 1 },
        { type = "item", name = "bulk-inserter",            amount = 3 },
        { type = "item", name = "mdrn-express-loader",      amount = 1 },
      },
      stack_ingredients = {
        { type = "item", name = "ddi-underground-belt-mk4", amount = 1 },
        { type = "item", name = "bulk-inserter",            amount = 6 },
        { type = "item", name = "mdrn-express-loader",      amount = 1 },
      },
    },
  },
  ["ddi-loader-mk5-"] = {
    name             = "mdrn-ddi-loader-mk5",
    underground_name = "ddi-underground-belt-mk5",
    order            = "06",
    tint             = util.color("2c30a5d1"),
    next_upgrade     = "mdrn-ddi-loader-mk6",
    prerequisite_techs = { "logistics-5", "mdrn-ddi-loader-mk4" },
    recipe_data = {
      ingredients = {
        { type = "item", name = "ddi-underground-belt-mk5", amount = 1 },
        { type = "item", name = "bulk-inserter",            amount = 3 },
        { type = "item", name = "mdrn-ddi-loader-mk4",      amount = 1 },
      },
      stack_ingredients = {
        { type = "item", name = "ddi-underground-belt-mk5", amount = 1 },
        { type = "item", name = "bulk-inserter",            amount = 6 },
        { type = "item", name = "mdrn-ddi-loader-mk4",      amount = 1 },
      },
    },
  },
  ["ddi-loader-mk6-"] = {
    name             = "mdrn-ddi-loader-mk6",
    underground_name = "ddi-underground-belt-mk6",
    order            = "07",
    tint             = util.color("ff9100d1"),
    next_upgrade     = "mdrn-ddi-loader-mk7",
    prerequisite_techs = { "logistics-6", "mdrn-ddi-loader-mk5" },
    recipe_data = {
      ingredients = {
        { type = "item", name = "ddi-underground-belt-mk6", amount = 1 },
        { type = "item", name = "bulk-inserter",            amount = 3 },
        { type = "item", name = "mdrn-ddi-loader-mk5",      amount = 1 },
      },
      stack_ingredients = {
        { type = "item", name = "ddi-underground-belt-mk6", amount = 1 },
        { type = "item", name = "bulk-inserter",            amount = 6 },
        { type = "item", name = "mdrn-ddi-loader-mk5",      amount = 1 },
      },
    },
  },
  ["ddi-loader-mk7-"] = {
    name             = "mdrn-ddi-loader-mk7",
    underground_name = "ddi-underground-belt-mk7",
    order            = "08",
    tint             = util.color("8800ffD1"),
    next_upgrade     = "mdrn-ddi-loader-mk8",
    prerequisite_techs = { "logistics-7", "mdrn-ddi-loader-mk6" },
    recipe_data = {
      ingredients = {
        { type = "item", name = "ddi-underground-belt-mk7", amount = 1 },
        { type = "item", name = "bulk-inserter",            amount = 3 },
        { type = "item", name = "mdrn-ddi-loader-mk6",      amount = 1 },
      },
      stack_ingredients = {
        { type = "item", name = "ddi-underground-belt-mk7", amount = 1 },
        { type = "item", name = "bulk-inserter",            amount = 6 },
        { type = "item", name = "mdrn-ddi-loader-mk6",      amount = 1 },
      },
    },
  },
  ["ddi-loader-mk8-"] = {
    name             = "mdrn-ddi-loader-mk8",
    underground_name = "ddi-underground-belt-mk8",
    order            = "09",
    tint             = util.color("ff00bbd1"),
    prerequisite_techs = { "logistics-8", "mdrn-ddi-loader-mk7" },
    recipe_data = {
      ingredients = {
        { type = "item", name = "ddi-underground-belt-mk8", amount = 1 },
        { type = "item", name = "bulk-inserter",            amount = 3 },
        { type = "item", name = "mdrn-ddi-loader-mk7",      amount = 1 },
      },
      stack_ingredients = {
        { type = "item", name = "ddi-underground-belt-mk8", amount = 1 },
        { type = "item", name = "bulk-inserter",            amount = 6 },
        { type = "item", name = "mdrn-ddi-loader-mk7",      amount = 1 },
      },
    },
  },
}

if cfg.stacking == C.STACKING.STACK_TIER then
  loaders["ddi-loader-mk8-"].next_upgrade = "mdrn-stack-loader"
end

MdrnLoaders.add_loaders(loaders)
