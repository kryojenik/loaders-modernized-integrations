if not mods["pycoalprocessing"] then return end

local C   = require("__loaders-modernized__.constants")
local cfg = require("__loaders-modernized__.prototypes.settings-cache")

if cfg.stacking == C.STACKING.STACK_TIER
and data.raw["inserter"]["py-stack-inserter"] then
  MdrnLoaders.add_loaders{
    ["stack-"] = {
      order = "z",
      tint = util.color("F5F5F5D1"),
      underground_name = "express-underground-belt",
      upgrade_from_tier = "express-",
      prerequisite_techs = { "py-transport-belt-capacity-1", "mdrn-fast-loader" },
      max_belt_stack_size = data.raw["utility-constants"].default.max_belt_stack_size,
      recipe_data = {
        ingredients = {
          --{type = "item", name = "express-underground-belt", amount = 1},
          {type = "item", name = "py-stack-inserter", amount = 3},
          {type = "item", name = "mdrn-fast-loader", amount = 1},
        },
      }
    },
  }
end
