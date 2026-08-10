if not mods["one-more-tier"] then return end
if not settings.startup["omt-transport-belt-enable"].value then return end

local cfg = require("__loaders-modernized__.prototypes.settings-cache")

-- OMT upgrades from turbo- with space-age, or express- without.
local top_tier   = cfg.has_space_age and "turbo-" or "express-"
local top_loader = "mdrn-" .. top_tier .. "loader"
local top_order  = string.match(data.raw.item[top_loader].order,"%]%-(%d+)%[") + 1
local top_order  = string.format("%02d", top_order)

MdrnLoaders.add_loaders{
  ["omt-"] = {
    tint = util.color("8132FAD1"),
    upgrade_from_tier = top_tier,
    prerequisite_techs = { "omt-logistics-4", top_loader },
    order = top_order,
    recipe_data = {
      ingredients = {
        { type = "item", name = "omt-underground-belt", amount = 1 },
        { type = "item", name = "bulk-inserter", amount = 6 },
        { type = "item", name = top_loader, amount = 1 },
      },
    },
  },
}
