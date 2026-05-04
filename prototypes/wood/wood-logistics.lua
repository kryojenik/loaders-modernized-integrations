if not data.raw["transport-belt"]["wood-transport-belt"] then
  return
end

local C   = require("__loaders-modernized__.constants")
local cfg = require("__loaders-modernized__.prototypes.settings-cache")

--- New loader
local loaders = {
  ["wood-"] = {
    stacking = false,
    filter = false,
    tint = util.color("a47f6de1"),
    prerequisite_techs = {"wood-logistics"},
    underground_name = "wood-underground-belt",
    upgrade_from_tier = "chute-",
    next_upgrade = "mdrn-loader",
    order = "a-wood",
    recipe_data = {
      ingredients = {
        {type = "item", name = "wood-underground-belt", amount = 1},
        {type = "item", name = "inserter", amount = 2},
        {type = "item", name = "lumber", amount = 2}
      },
    }
  }
}

MdrnLoaders.add_loaders(loaders)

--- Change existing loaders
local chute_name = "mdrn-chute-loader"
chute_entity = data.raw["loader-1x1"][chute_name]
if chute_entity then
  local ug_entity = data.raw["underground-belt"]["wood-underground-belt"]
  chute_entity.speed = ug_entity.speed * .5
  chute_entity.dying_explosion = ug_entity.dying_explosion or "underground-belt-explosion"
  chute_entity.belt_animation_set = ug_entity.belt_animation_set
end

local base_loader_name = "mdrn-loader"
local loader_tech = data.raw["technology"][base_loader_name]
if loader_tech then
  loader_tech.prerequisites = { "logistics", "mdrn-wood-loader" }
end

local loader_recipe = data.raw["recipe"][base_loader_name]
if loader_recipe then
  local inserter_count = 6
  if cfg.stacking == C.STACKING.ALL and not cfg.cheap_stacking then
    inserter_count = 10
  end

  loader_recipe.ingredients = {
    { type = "item", name = "underground-belt", amount = 1 },
    { type = "item", name = "inserter", amount = inserter_count},
    { type = "item", name = "steel-plate", amount = 4 },
    { type = "item", name = "mdrn-wood-loader", amount = 1 },
  }
end