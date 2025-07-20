if not data.raw["transport-belt"]["wood-transport-belt"] then
  return
end

local startup_settings = settings.startup

--- New loader
local templates = {}
templates.loaders = {
  ["wood-"] = {
    no_stack = true,
    no_filter = true,
    below_turbo = true,
    tint = util.color("a47f6de1"),
    prerequisite_techs = {"wood-logistics"},
    underground_name = "wood-underground-belt",
    previous_prefix = "chute-",
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

MdrnLoaders.make_modern_loaders(templates)

--- Change existing loaders
local chute_name = "chute-mdrn-loader"
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
  loader_tech.prerequisites = { "logistics", "wood-mdrn-loader" }
end

local loader_recipe = data.raw["recipe"][base_loader_name]
if loader_recipe then
  local inserter_count = 6
  if startup_settings["mdrn-enable-stacking"].value == "all"
  and startup_settings["mdrn-cheap-stacking"].value == false then
    inserter_count = 10
  end

  loader_recipe.ingredients = {
    { type = "item", name = "underground-belt", amount = 1 },
    { type = "item", name = "inserter", amount = inserter_count},
    { type = "item", name = "steel-plate", amount = 4 },
    { type = "item", name = "wood-mdrn-loader", amount = 1 },
  }
end