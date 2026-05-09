if not mods["more-belts"] then return end

local C = require("__loaders-modernized__.constants")

-- more-belts overwrites the three base underground belt speeds in data-final-fixes
-- via ddi-t1/t2/t3-speed settings. Re-sync loader speeds to match.
local tiers = {
  { loader = "mdrn-loader",         ug = "underground-belt" },
  { loader = "mdrn-fast-loader",    ug = "fast-underground-belt" },
  { loader = "mdrn-express-loader", ug = "express-underground-belt" },
}

for _, tier in ipairs(tiers) do
  local ug = data.raw["underground-belt"][tier.ug]
  if ug then
    for _, sfx in ipairs(C.VARIANT_SUFFIXES) do
      local e = data.raw["loader-1x1"][tier.loader .. sfx]
      if e then e.speed = ug.speed end
    end
  end
end
