if not mods["iper-belt"] then return end

-- Iper Belt support
local C   = require("__loaders-modernized__.constants")
local cfg = require("__loaders-modernized__.prototypes.settings-cache")

---@type table<string, LMLoaderTemplate>
local loaders = {
  ["iper-"] = {
    order = "d-iper",
    tint = util.color("4a5ad2d1"),
    upgrade_from_tier = "express-",
    prerequisite_techs = { "iper-transport-belts", "mdrn-express-loader" },
    recipe_data = {
      ingredients = {
        {type = "item", name = "iper-underground-belt", amount = 1},
        {type = "item", name = "bulk-inserter", amount = 3},
        {type = "item", name = "mdrn-express-loader", amount = 1},
      },
      stack_ingredients = {
        {type = "item", name = "iper-underground-belt", amount = 1},
        {type = "item", name = "bulk-inserter", amount = 6},
        {type = "item", name = "mdrn-express-loader", amount = 1},
      }
    }
  },
}

if cfg.stacking == C.STACKING.STACK_TIER then
  loaders["iper-"].next_upgrade = "mdrn-stack-loader"
end

MdrnLoaders.add_loaders(loaders)