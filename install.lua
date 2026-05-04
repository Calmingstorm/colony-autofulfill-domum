-- One-shot installer for Calmingstorm/colony-autofulfill-domum
-- Downloads startup.lua, blacklist.txt, and probe.lua into the current directory.
--
-- Usage on the CC computer:
--   wget https://cdn.jsdelivr.net/gh/Calmingstorm/colony-autofulfill-domum@ea49f877ff527c935a794526b269d66d3e1537e8/install.lua install.lua
--   install.lua
--   startup setup
--   reboot

local BASE = "https://cdn.jsdelivr.net/gh/Calmingstorm/colony-autofulfill-domum@ea49f877ff527c935a794526b269d66d3e1537e8/"
local FILES = { "startup.lua", "blacklist.txt", "probe.lua" }

for _, f in ipairs(FILES) do
  if fs.exists(f) then
    print("Removing existing " .. f)
    fs.delete(f)
  end
  print("Fetching " .. f)
  shell.run("wget", BASE .. f, f)
end

print("")
print("========================================")
print("Installed:")
for _, f in ipairs(FILES) do
  print("  " .. f .. (fs.exists(f) and "" or "  [MISSING - wget failed]"))
end
print("========================================")
print("Run `startup setup` to choose ME output/poll settings.")
print("Then reboot the ComputerCraft computer to start.")
print("Run `probe.lua` if you want to dump the API surface first.")
