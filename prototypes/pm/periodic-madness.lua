if not mods["periodic-madness"] and not mods["periodic-madness-test"] then return end

local C   = require("__loaders-modernized__.constants")
local cfg = require("__loaders-modernized__.prototypes.settings-cache")

---@type table<string, LMLoaderTemplate>
local loaders = {
  ["fast-"] = {
    tint               = util.color("fa8c51"),
  },
  ["pm-advanced-"] = {
    name               = "mdrn-pm-advanced-loader",
    underground_name   = "pm-advanced-underground-belt",
    tint               = util.color("ff1838d1"),
    order              = "03",
    upgrade_from_tier  = "fast-",
    next_upgrade       = "mdrn-express-loader",
    prerequisite_techs = { "logistics-3", },
    recipe_data = {
      ingredients = {
        { type = "item", name = "pm-advanced-underground-belt", amount = 1 },
        { type = "item", name = "bulk-inserter",                amount = 3 },
        { type = "item", name = "mdrn-fast-loader",             amount = 1 },
      },
      stack_ingredients = {
        { type = "item", name = "pm-advanced-underground-belt", amount = 1 },
        { type = "item", name = "bulk-inserter",                amount = 6 },
        { type = "item", name = "mdrn-fast-loader",             amount = 1 },
      },
    },
  },
  ["express-"] = {
    underground_name   = "express-underground-belt",
    order              = "04",
    upgrade_from_tier  = "pm-advanced-",
    next_upgrade       = "mdrn-pm-high-density-loader",
    prerequisite_techs = { "pm-logistics-4", "pm-express-inserters" },
    recipe_data = {
      ingredients = {
        { type = "item", name = "express-underground-belt", amount = 1 },
        { type = "item", name = "pm-express-inserter",      amount = 3 },
        { type = "item", name = "mdrn-pm-advanced-loader",  amount = 1 },
      },
      stack_ingredients = {
        { type = "item", name = "express-underground-belt", amount = 1 },
        { type = "item", name = "pm-express-inserter",      amount = 6 },
        { type = "item", name = "mdrn-pm-advanced-loader",  amount = 1 },
      },
    },
  },
  ["pm-high-density-"] = {
    name               = "mdrn-pm-high-density-loader",
    underground_name   = "pm-high-density-underground-belt",
    tint               = util.color("a386c7"),
    order              = "05",
    upgrade_from_tier  = "express-",
    prerequisite_techs = { "pm-logistics-5", "pm-express-inserters" },
    recipe_data = {
      ingredients = {
        { type = "item", name = "pm-high-density-underground-belt", amount = 1 },
        { type = "item", name = "pm-express-bulk-inserter",         amount = 3 },
        { type = "item", name = "mdrn-express-loader",              amount = 1 },
      },
      stack_ingredients = {
        { type = "item", name = "pm-high-density-underground-belt", amount = 1 },
        { type = "item", name = "pm-express-bulk-inserter",         amount = 6 },
        { type = "item", name = "mdrn-express-loader",              amount = 1 },
      },
    },
  },
}

if cfg.stacking == C.STACKING.STACK_TIER then
  loaders["pm-high-density-"].next_upgrade = "mdrn-stack-loader"
end

MdrnLoaders.add_loaders(loaders)
