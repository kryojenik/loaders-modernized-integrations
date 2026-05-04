require("prototypes.py")
local C   = require("__loaders-modernized__.constants")
local cfg = require("__loaders-modernized__.prototypes.settings-cache")

if mods["pycoalprocessing"] and cfg.stacking == C.STACKING.STACK_TIER then
  local stack_tech = data.raw["technology"]["mdrn-stack-loader"]
  if not stack_tech then return end

  local prereq = data.raw["technology"][stack_tech.prerequisites[1]]
  if not prereq then
    data.raw["technology"]["mdrn-stack-loader"] = nil
    return
  end

  stack_tech.unit = prereq.unit
end
