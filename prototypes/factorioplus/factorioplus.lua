if not mods["factorioplus"] then return end

local C   = require("__loaders-modernized__.constants")
local cfg = require("__loaders-modernized__.prototypes.settings-cache")

-- Mirrors Factorio+'s own per-tier inserter choice in its loader recipes (recipes.lua).
local inserters = {
  ["basic"]      = "burner-inserter",
  [""]           = "inserter",
  ["fast"]       = "long-handed-inserter",
  ["express"]    = "fast-inserter",
  ["turbo"]      = "bulk-inserter",
  ["supersonic"] = "very-long-handed-inserter",
}

---@type table<string, LMLoaderTemplate>
local loaders = {
  ["fp-basic-"] = {
    next_upgrade = "mdrn-loader",
    underground_name = "basic-underground-belt",
    below_base = false,
    order = "01",
    tint = util.color("808080d1"),
    prerequisite_techs = { "logistics-basic" },
    recipe_data = {
      energy_required = 2,
      ingredients = {
        { type = "item", name = "electronic-circuit", amount = 2 },
        { type = "item", name = "transport-belt", amount = 10 },
        { type = "item", name = inserters["basic"], amount = 8 },
      },
    },
  },
  [""] = {
    order = "02",
    prerequisite_techs = { "logistics" },
    recipe_data = {
      energy_required = 4,
      ingredients = {
        { type = "item", name = "transport-belt", amount = 10 },
        { type = "item", name = inserters[""], amount = 8 },
        { type = "item", name = "mdrn-fp-basic-loader", amount = 1 },
      },
    },
  },
  ["fast-"] = {
    order = "03",
    prerequisite_techs = { "logistics-2", "mdrn-loader" },
    recipe_data = {
      energy_required = 8,
      ingredients = {
        { type = "item", name = "transport-belt", amount = 10  },
        { type = "item", name = inserters["fast"], amount = 8 },
        { type = "item", name = "mdrn-loader", amount = 1 },
      },
    },
  },
  ["express-"] = {
    order = "04",
    prerequisite_techs = { "logistics-3", "mdrn-fast-loader" },
    recipe_data = {
      energy_required = 14,
      ingredients = {
        { type = "item", name = "express-transport-belt", amount = 10 },
        { type = "item", name = inserters["express"], amount = 8 },
        { type = "item", name = "mdrn-fast-loader", amount = 1 },
        { type = "fluid", name = "lubricant", amount = 15 },
      },
    },
  },
  ["turbo-"] = {
    upgrade_from_tier = "express-",
    order = "05",
    tint = util.color("9bb600d1"),
    prerequisite_techs = { "logistics-4", "mdrn-express-loader" },
    recipe_data = {
      energy_required = 22,
      ingredients = {
        { type = "item", name = "turbo-transport-belt", amount = 10 },
        { type = "item", name = inserters["turbo"], amount = 8 },
        { type = "item", name = "mdrn-express-loader", amount = 1 },
        { type = "fluid", name = "lubricant", amount = 30 },
      },
    },
  },
  ["supersonic-"] = {
    upgrade_from_tier = "turbo-",
    order = "06",
    tint = util.color("E025E0d1"),
    prerequisite_techs = { "logistics-5", "mdrn-turbo-loader" },
    recipe_data = {
      energy_required = 32,
      ingredients = {
        { type = "item", name = "supersonic-transport-belt", amount = 10 },
        { type = "item", name = inserters["supersonic"], amount = 8 },
        { type = "item", name = "mdrn-turbo-loader", amount = 1 },
        { type = "fluid", name = "lubricant", amount = 60 },
      },
    },
  }
}

if settings.startup["settings-loaders-cost"].value == "expensive" then
  for _, loader in pairs(loaders) do
    for _, ingredient in pairs(loader.recipe_data.ingredients) do
      if not string.find(ingredient.name, "loader") then
        ingredient.amount = ingredient.amount * 2
      end
    end
  end
end

if cfg.chute_mode ~= C.CHUTE.NONE then
  loaders["chute-"] = {
    tech_data = false,
    speed_multiplier = .5,
    underground_name = "basic-underground-belt",
    next_upgrade = "mdrn-fp-basic-loader",
    tint = util.color("000000d1"),
  }
end

if cfg.stacking == C.STACKING.STACK_TIER then
  loaders["stack-"] = {
    underground_name = "supersonic-underground-belt",
    order = "07",
  }
end

MdrnLoaders.add_loaders(loaders)
