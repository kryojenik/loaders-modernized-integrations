if not mods["UltimateBeltsSpaceAge"] then return end

local C   = require("__loaders-modernized__.constants")
local cfg = require("__loaders-modernized__.prototypes.settings-cache")

if cfg.unlock_technology == C.UNLOCK_TECH.SEPARATE then
  data.raw["technology"]["mdrn-express-loader"].unit = data.raw["technology"]["logistics-3"].unit
end