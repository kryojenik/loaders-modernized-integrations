-- Ensure the ev-logistics mod is active
if not settings.startup["ev-belts-enabled"].value then
  return false
end

local C   = require("__loaders-modernized__.constants")
local cfg = require("__loaders-modernized__.prototypes.settings-cache")

-- Define the loader template for the tier 5 turbo belt
local loaders = {
  ["hyper-"] = {
    upgrade_from_tier = "turbo-",
    tint = util.color("8c48dbd1"),                               -- Purple tint for hyper tier
    prerequisite_techs = { "hyper-logistics", "mdrn-turbo-loader" }, -- Link to hyper-logistics technology
    recipe_data = {
      ingredients = {
        { type = "item", name = "hyper-underground-belt", amount = 1 },
        { type = "item", name = "mdrn-turbo-loader",      amount = 1 },
        { type = "item", name = "bulk-inserter",          amount = 3 }
      }
    }
  }
}

if cfg.stacking == C.STACKING.STACK_TIER then
  loaders["hyper-"].next_upgrade = "mdrn-stack-loader"
end

MdrnLoaders.add_loaders(loaders)