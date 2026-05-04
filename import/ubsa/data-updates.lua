-- Ultimate Belts Space Age adjusts logistics-3 tech cost in data-updates.
-- Adjust to unlock at same science tier
local C   = require("__loaders-modernized__.constants")
local cfg = require("__loaders-modernized__.prototypes.settings-cache")

if cfg.unlock_technology == C.UNLOCK_TECH.SEPARATE then
  data.raw["technology"]["mdrn-express-loader"].unit = data.raw["technology"]["logistics-3"].unit
end