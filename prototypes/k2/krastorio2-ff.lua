-- If there is another mod that enables belt stacking and stack loaders in Krastorio 2
-- decide if we need to set up a stack loader.
local C   = require("__loaders-modernized__.constants")
local cfg = require("__loaders-modernized__.prototypes.settings-cache")
if cfg.stacking == C.STACKING.STACK_TIER then
  local loaders = {}
  -- TODO: This should probably move to the SE mod.
  if not mods["space-exploration"] then
    loaders["superior-"] = { next_upgrade = "mdrn-stack-loader" }
  end
  local superior_inserter = data.raw["inserter"]["kr-superior-inserter"]
  if settings.startup["mdrn-use-k2-recipes"].value and superior_inserter.max_belt_stack_size and superior_inserter.max_belt_stack_size > 1 then
    loaders["stack-"] = {
      recipe_data = {
        ingredients = {
          { type = "item", name = "processing-unit", amount = 1 },
          { type = "item", name = "kr-superior-inserter", amount = 6 },
          { type = "item", name = "mdrn-fast-loader", amount = 1 },
        }
      }
    }
  end

  MdrnLoaders.add_loaders(loaders)
end
