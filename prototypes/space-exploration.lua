-- Define the loader template for the tier 5 turbo belt
local templates = {}
local startup_settings = settings.startup
templates.loaders = {
  ["space-"] = {
    next_upgrade = "deep-space-mdrn-loader-black",
    underground_name = "se-space-underground-belt",
    order = "04",
    tint = util.color("ffffffd1"),
    prerequisite_techs = { "se-space-belt", "fast-mdrn-loader" },
    recipe_data = {
      ingredients = {
        { type = "item", name = "se-space-transport-belt", amount = 1 },
        { type = "item", name = "low-density-structure", amount = 5 },
        { type = "item", name = "electric-engine-unit", amount = 5 },
        { type = "item", name = "processing-unit", amount = 5 }
      },
      stack_ingredients = {
        { type = "item", name = "se-space-transport-belt", amount = 1 },
        { type = "item", name = "low-density-structure", amount = 10 },
        { type = "item", name = "electric-engine-unit", amount = 10 },
        { type = "item", name = "processing-unit", amount = 10 }
      }
    },
  },
  ["deep-space-"] = {
    underground_name = "se-deep-space-underground-belt-black",
    name = "deep-space-mdrn-loader-black",
    order = "05",
    tint = util.color("000000d1"),
    dark_frame = true,
    prerequisite_techs = { "se-deep-space-transport-belt", "space-mdrn-loader" },
    recipe_data = {
      ingredients = {
        { type = "item", name = "se-deep-space-transport-belt-black", amount = 1 },
        { type = "item", name = "se-nanomaterial", amount = 5 },
        { type = "item", name = "se-heavy-assembly", amount = 5 },
        { type = "item", name = "se-quantum-processor", amount = 1 },
        { type = "item", name = "se-naquium-cube", amount = 1 },
      },
      stack_ingredients = {
        { type = "item", name = "se-deep-space-transport-belt-black", amount = 1 },
        { type = "item", name = "se-nanomaterial", amount = 10 },
        { type = "item", name = "se-heavy-assembly", amount = 10 },
        { type = "item", name = "se-quantum-processor", amount = 1 },
        { type = "item", name = "se-naquium-cube", amount = 2 },
      },
    },
  }
}

-- If using special stack or chute loaders with SE, clean up a few things
if startup_settings["mdrn-enable-stacking"].value == "stack-tier"
or startup_settings["mdrn-enable-chute"].value then
  data:extend{
    {
        type = "item-subgroup",
        name = "belt-loader-special",
        group = "logistics",
        order = "b[belt-loader2]"
    }
  }

  if startup_settings["mdrn-enable-stacking"].value == "stack-tier" then
    templates.loaders["stack-"] = {
      tint = util.color("fc792fd1"),
      subgroup = "belt-loader-special",
      dark_frame = true
    }
  end

  if startup_settings["mdrn-enable-chute"].value then
    templates.loaders["chute-"] = {
      subgroup = "belt-loader-special",
    }
  end
end

MdrnLoaders.make_modern_loaders(templates)

-- Make sure our new SE loaders can be placed on space platforms
for prefix, loader in pairs(templates.loaders) do
  if prefix ~= "chute-" then
    data.raw["loader-1x1"][loader.name].se_allow_in_space = true
  end
end

-- You cannon upgrade from a land restricted loader to a space capable loader. Collision masks must match.
-- The stack loader is set to work on space platforms.  Perhaps there should be a separate land stack loader.

data.raw["loader-1x1"]["express-mdrn-loader"].next_upgrade = nil
