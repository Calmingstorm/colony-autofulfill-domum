# Colony Autofulfill Domum

ComputerCraft / Advanced Peripherals MineColonies `<->` AE2 auto-fulfillment.

This repo is based on `TargetedEntropy/colony-autofulfill` `robust-autofulfill`, with the useful fixes from the builder-local script moved over where they fit:

- interactive `startup setup` for ME Bridge export target and poll/dashboard settings
- Domum Ornamentum component-aware matching/export for Minecraft 1.21.1 style data components
- safer Domum behavior: no display-name fallback by default, and Domum AE crafting disabled by default
- support for alternate ME Bridge method names/return shapes
- preserves colony-wide request behavior from robust-autofulfill instead of becoming builder-hut-local

This is not the builder-local script. It still polls `colony.getRequests()` and fulfills normal colony requests into the configured output/post-box lane.

## Install on a ComputerCraft computer

```lua
wget https://raw.githubusercontent.com/Calmingstorm/colony-autofulfill-domum/main/install.lua install.lua
install.lua
startup setup
```

Then restart the ComputerCraft computer.

## Update an existing install

```lua
wget https://raw.githubusercontent.com/Calmingstorm/colony-autofulfill-domum/main/install.lua install.lua
install.lua
```

Then restart the ComputerCraft computer.

Run setup again if you want to change the ME output/poll settings:

```lua
startup setup
```

Then restart it.

## Hardware

- Advanced Computer
- Advanced Peripherals Colony Integrator
- Advanced Peripherals ME Bridge
- Buffer chest/barrel/post-box lane connected to the ME Bridge export target
- Optional monitor and chat box

## Domum Ornamentum notes

Domum Ornamentum blocks can share the same item id/display name while differing by data components/texture data. This script tries to export using:

1. the Colony Integrator component filter
2. matching AE2-listed variants by Domum texture components
3. ME-side component filter
4. ME-side fingerprint filter

By default it refuses unsafe display-name fallback for Domum variants because that can ship the wrong block. If your server proves name-only export is safe, set `domum_require_components = false` in `autofulfill_config.lua`, but that is a sharp knife in a dark room.

## Config

`startup setup` writes `autofulfill_config.lua`. Useful fields:

```lua
export_side = "north"          -- ME Bridge output side/peripheral target
poll_seconds = 15
dashboard_seconds = 2
craft_only_full_amount = true
domum_match_me_variant = true
domum_require_components = true
domum_disable_crafting = true
```

`blacklist.txt` still works like upstream: one item id per line, `#` for comments.
