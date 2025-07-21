-- Ensure the ev-logistics mod is active
if not settings.startup["ev-belts-enabled"].value then
  return false
end

-- Define the loader template for the tier 5 turbo belt
local templates = {}
templates.loaders = {
  ["hyper-"] = {
    previous_prefix = "turbo-",
    tint = util.color("8c48dbd1"),                               -- Purple tint for hyper tier
    prerequisite_techs = { "hyper-logistics", "turbo-mdrn-loader" }, -- Link to hyper-logistics technology
    recipe_data = {
      ingredients = {
        { type = "item", name = "hyper-underground-belt", amount = 1 },
        { type = "item", name = "turbo-mdrn-loader",      amount = 1 },
        { type = "item", name = "bulk-inserter",          amount = 3 }
      }
    }
  }
}

if settings.startup["mdrn-enable-stacking"].value == "stack-tier" then
  templates.loaders["hyper-"].next_upgrade = "stack-mdrn-loader"
end

MdrnLoaders.make_modern_loaders(templates)