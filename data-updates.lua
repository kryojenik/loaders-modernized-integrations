require("prototypes.py")

if mods["pycoalprocessing"] and settings.startup["mdrn-enable-stacking"].value == "stack-tier" then
  local stack_tech = data.raw["technology"]["stack-mdrn-loader"]
  local prereq = data.raw["technology"][stack_tech.prerequisites[1]]
  if not prereq then
    data.raw["technology"]["stack-mdrn-loader"] = nil
    return
  end

  stack_tech.unit = prereq.unit
end