-- 5 Dim New Transport
local utils = require("__loaders-modernized__.scripts.utils")

local startup_settings = settings.startup

data:extend({
  {
    type = "item-subgroup",
    name = "transport-loader-mdrn",
    group = "transport",
    order = "jc"
  }
})

--- 5Dim integrated Mk4 items directly as turbo tier when space-age is loaded.
--- They are still Mk4 without space-age
local loader = "mdrn-loader-04"
local underground = "5d-underground-belt-04"
local belt = "5d-transport-belt-04"
if mods["space-age"] then
  loader = "turbo-mdrn-loader"
  underground = "turbo-underground-belt"
  belt = "turbo-transport-belt"
end

--- New Loaders
---@type table<string, LMLoaderTemplate>
local loaders = {
  ["01"] = {
    name = "mdrn-loader",
    localised_name = {"entity-name.mdrn-loader-01"},
    below_turbo = true,
    underground_name = "underground-belt",
    group = "transport",
    subgroup = "transport-loader-mdrn",
    next_upgrade = "fast-mdrn-loader",
    tint = util.color("ffc502d1"),
    unlocked_by = "logistics",
    recipe_data = {
      ingredients = {
        { type = "item", name = "inserter",           amount = 5 },
        { type = "item", name = "electronic-circuit", amount = 5 },
        { type = "item", name = "iron-gear-wheel",    amount = 5 },
        { type = "item", name = "iron-plate",         amount = 5 },
        { type = "item", name = "transport-belt",     amount = 5 }
      }
    }
  },
  ["02"] = {
    name = "fast-mdrn-loader",
    localised_name = {"entity-name.mdrn-loader-02"},
    below_turbo = true,
    underground_name = "fast-underground-belt",
    group = "transport",
    subgroup = "transport-loader-mdrn",
    next_upgrade = "express-mdrn-loader",
    tint = util.color("f91c0bd1"),
    unlocked_by = "logistics-2",
    recipe_data = {
      ingredients = {
        {type = "item", name = "fast-transport-belt", amount = 5},
        {type = "item", name = "mdrn-loader", amount = 1},
      }
    }
  },
  ["03"] = {
    name = "express-mdrn-loader",
    localised_name = {"entity-name.mdrn-loader-03"},
    below_turbo = true,
    underground_name = "express-underground-belt",
    group = "transport",
    subgroup = "transport-loader-mdrn",
    next_upgrade = loader,
    tint = util.color("06c2f6d1"),
    unlocked_by = "logistics-3",
    recipe_data = {
      ingredients = {
        {type = "item", name = "express-transport-belt", amount = 5},
        {type = "item", name = "fast-mdrn-loader", amount = 1},
      }
    }
  },
  ["04"] = {
    name = loader,
    underground_name = underground,
    group = "transport",
    subgroup = "transport-loader-mdrn",
    next_upgrade = "mdrn-loader-05",
    tint = util.color("fe9ef5d1"),
    unlocked_by = "logistics-4",
    recipe_data = {
      ingredients = {
        {type = "item", name = belt, amount = 5},
        {type = "item", name = "express-mdrn-loader", amount = 1},
      }
    }
  },
  ["05"] = {
    name = "mdrn-loader-05",
    underground_name = "5d-underground-belt-05",
    group = "transport",
    subgroup = "transport-loader-mdrn",
    next_upgrade = "mdrn-loader-06",
    tint = util.color("33bd2bd1"),
    unlocked_by = "logistics-5",
    recipe_data = {
      ingredients = {
        {type = "item", name = "5d-transport-belt-05", amount = 5},
        {type = "item", name = loader, amount = 1},
      }
    }
  },
  ["06"] = {
    name = "mdrn-loader-06",
    underground_name = "5d-underground-belt-06",
    group = "transport",
    subgroup = "transport-loader-mdrn",
    next_upgrade = "mdrn-loader-07",
    tint = util.color("906242d1"),
    unlocked_by = "logistics-6",
    recipe_data = {
      ingredients = {
        {type = "item", name = "5d-transport-belt-06", amount = 5},
        {type = "item", name = "mdrn-loader-05", amount = 1},
      }
    }
  },
  ["07"] = {
    name = "mdrn-loader-07",
    underground_name = "5d-underground-belt-07",
    group = "transport",
    subgroup = "transport-loader-mdrn",
    next_upgrade = "mdrn-loader-08",
    tint = util.color("743e9bd1"),
    unlocked_by = "logistics-7",
    recipe_data = {
      ingredients = {
        {type = "item", name = "5d-transport-belt-07", amount = 5},
        {type = "item", name = "mdrn-loader-06", amount = 1},
      }
    }
  },
  ["08"] = {
    name = "mdrn-loader-08",
    underground_name = "5d-underground-belt-08",
    group = "transport",
    subgroup = "transport-loader-mdrn",
    next_upgrade = "mdrn-loader-09",
    tint = util.color("dddddcd1"),
    unlocked_by = "logistics-8",
    recipe_data = {
      ingredients = {
        {type = "item", name = "5d-transport-belt-08", amount = 5},
        {type = "item", name = "mdrn-loader-07", amount = 1},
      }
    }
  },
  ["09"] = {
    name = "mdrn-loader-09",
    underground_name = "5d-underground-belt-09",
    group = "transport",
    subgroup = "transport-loader-mdrn",
    next_upgrade = "mdrn-loader-10",
    tint = util.color("f47f16d1"),
    unlocked_by = "logistics-9",
    recipe_data = {
      ingredients = {
        {type = "item", name = "5d-transport-belt-09", amount = 5},
        {type = "item", name = "mdrn-loader-08", amount = 1},
      }
    }
  },
  ["10"] = {
    name = "mdrn-loader-10",
    underground_name = "5d-underground-belt-10",
    group = "transport",
    subgroup = "transport-loader-mdrn",
    tint = util.color("6d6dffd1"),
    unlocked_by = "logistics-10",
    recipe_data = {
      ingredients = {
        {type = "item", name = "5d-transport-belt-10", amount = 5},
        {type = "item", name = "mdrn-loader-09", amount = 1},
      }
    }
  },
}

MdrnLoaders.add_loaders(loaders)

-- 5Dim left the "turbo-transport-belt" technology laying around in addition to the logistics-4
-- technology it has now duplicated unlocks into for turbo tier.
-- Make sure the turbo-mdrn-loader can be unlocked by either tier

if mods["space-age"] then
  utils.add_recipe_to_effects(data.raw["technology"]["logistics-4"], "turbo-mdrn-loader")
end

-- Hide 5Dim 1x1 loaders
if startup_settings["mdrn-keep-5d-loaders"].value ~= "all" then
  for tier, loader in pairs(loaders) do
    local name_5d = "5d-loader-1x1-" .. tier
    data.raw["loader-1x1"][name_5d].hidden_in_factoriopedia = true
    data.raw["loader-1x1"][name_5d].minable.result = loader.name
    data.raw["loader-1x1"][name_5d].next_upgrade = nil 
    data.raw["item"][name_5d].hidden = true
    data.raw["recipe"][name_5d].hidden = true
    local tech = data.raw["technology"][loader.unlocked_by]
    utils.remove_recipe_from_effects(tech, name_5d)
  end
end

--- Hide 5Dim 1x2 loaders
if startup_settings["mdrn-keep-5d-loaders"].value == "none" then
  for tier, loader in pairs(loaders) do
    local name_5d = "5d-loader-" .. tier
    if not string.match(loader.name, "%-" .. tier .. "$") then
      name_5d = string.gsub(loader.name, "mdrn%-", "")
    end

    local ldr_entity = data.raw["loader"][name_5d]
    if not ldr_entity then
      goto continue
    end

    ldr_entity.hidden_in_factoriopedia = true
    ldr_entity.minable.result = loader.name
    ldr_entity.next_upgrade = nil
    data.raw["recipe"][name_5d].hidden = true
    data.raw["item"][name_5d].hidden = true
    local tech = data.raw["technology"][loader.unlocked_by]
    utils.remove_recipe_from_effects(tech, name_5d)
    ::continue::
  end
end

-- If the chute is enabled, move the item to the appropriate 5Dim Transport groups
local chute_item = data.raw["item"]["chute-mdrn-loader"]
if chute_item then
  chute_item.group = "transport"
  chute_item.subgroup = "transport-misc"
  chute_item.order = "z"
end

-- Make stack loader more 5Dim like
if startup_settings["mdrn-enable-stacking"].value == "stack-tier" then
  local tint = util.color("000000d1")
  local structure = utils.create_entity_structure(tint)
  local stack_item = data.raw["item"]["stack-mdrn-loader"]
  if stack_item then
    stack_item.group = "transport"
    stack_item.subgroup = "transport-misc"
    stack_item.order = "za"
    stack_item.icons = utils.create_icons(tint)
  end

  local stack_recipe = data.raw["recipe"]["stack-mdrn-loader"]
  if stack_recipe then
    stack_recipe.category = "crafting-with-fluid-or-metallurgy"
  end

  for _, name in pairs{ "stack-mdrn-loader", "stack-mdrn-loader-split" } do
    local stack_ldr = data.raw["loader-1x1"][name]
    if stack_ldr then
      stack_ldr.structure = structure
      stack_ldr.icons = utils.create_icons(tint)
      if string.find(name, "%-split$") then
        stack_ldr.icons[#stack_ldr.icons+1] = {
          icon = "__loaders-modernized__/graphics/icon/split-lane-out.png",
          icon_size = 64,
          scale = 0.18,
          shift = { -9, 9 }
        }
      end
    end
  end
end
