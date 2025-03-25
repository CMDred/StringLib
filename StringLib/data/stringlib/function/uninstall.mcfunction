# Check if it's installed
scoreboard objectives add StringLib.Uninstall dummy
execute if score #StringLib.Init StringLib matches 1 run scoreboard players set #StringLib.Init StringLib.Uninstall 1
execute unless score #StringLib.Init StringLib.Uninstall matches 1 run tellraw @a ["﹌ ",{text:"StringLib >> ",color:"#99EAD6"},{text:"⚠ Could not remove StringLib.\nIs it installed?",color:"red"}]
execute unless score #StringLib.Init StringLib.Uninstall matches 1 run return run scoreboard objectives remove StringLib.Uninstall
scoreboard objectives remove StringLib.Uninstall

# Tellraw
tellraw @s ["﹌ ",{text:"StringLib >> ",color:"#99EAD6"},"Uninstalled StringLib (v0.2.0)"]

# Remove scoreboards & data storages
scoreboard objectives remove StringLib

scoreboard players reset #StringLib.Init
scoreboard players reset #StringLib.ShowLoadMessage
scoreboard players reset #StringLib.c-1
scoreboard players reset #StringLib.c100
scoreboard players reset #StringLib.StringsTotal
scoreboard players reset #StringLib.CharsLeft
scoreboard players reset #StringLib.CharsTotal
scoreboard players reset #StringLib.ConcatsLeft
scoreboard players reset #StringLib.SuccessCheck
scoreboard players reset #StringLib.FindLength
scoreboard players reset #StringLib.FindAmount
scoreboard players reset #StringLib.KeepEmpty
scoreboard players reset #StringLib.SeparatorLength
scoreboard players reset #StringLib.Max
scoreboard players reset #StringLib.SplitsLeft
scoreboard players reset #StringLib.Index
scoreboard players reset #StringLib.FoundNothing
scoreboard players reset #StringLib.ReturnValue
scoreboard players reset #StringLib.CheckString.CharsLeft
scoreboard players reset #StringLib.CheckString.IsFindLength

data remove storage stringlib:zprivate data
data remove storage stringlib:input concat
data remove storage stringlib:input find
data remove storage stringlib:input replace
data remove storage stringlib:input insert
data remove storage stringlib:input split
data remove storage stringlib:output concat
data remove storage stringlib:output to_lowercase
data remove storage stringlib:output to_uppercase
data remove storage stringlib:output to_number
data remove storage stringlib:output to_string
data remove storage stringlib:output find
data remove storage stringlib:output replace
data remove storage stringlib:output insert
data remove storage stringlib:output split
