# Check if it's installed
scoreboard objectives add StringLib.Uninstall dummy
execute if score #StringLib.Init StringLib matches 1 run scoreboard players set #StringLib.Init StringLib.Uninstall 1
execute unless score #StringLib.Init StringLib.Uninstall matches 1 run tellraw @a ["﹌ ",{"text":"StringLib >> ","color":"#99EAD6"},{"text":"⚠ Could not remove StringLib.\nIs it installed?","color":"red"}]
execute unless score #StringLib.Init StringLib.Uninstall matches 1 run return run scoreboard objectives remove StringLib.Uninstall
scoreboard objectives remove StringLib.Uninstall

# Tellraw
tellraw @s ["﹌ ",{"text":"StringLib >> ","color":"#99EAD6"},"Uninstalled StringLib (v1.0.0)"]

# Remove scoreboards & data storages
scoreboard objectives remove StringLib

scoreboard players reset #StringLib.Init
scoreboard players reset #StringLib.ShowLoadMessage
scoreboard players reset #StringLib.c100
scoreboard players reset #StringLib.StringsTotal
scoreboard players reset #StringLib.CharsLeft
scoreboard players reset #StringLib.ConcatsLeft

data remove storage stringlib:zprivate data
data remove storage stringlib:input concat
data remove storage stringlib:output concat
data remove storage stringlib:output to_lowercase
data remove storage stringlib:output to_uppercase
data remove storage stringlib:output to_number
data remove storage stringlib:output to_string
