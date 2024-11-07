# Setup (Get how many times it needs to concatenate & prepare the starting string)
scoreboard players remove #StringLib.StringsTotal StringLib 1
scoreboard players operation #StringLib.ConcatsLeft StringLib = #StringLib.StringsTotal StringLib
scoreboard players operation #StringLib.ConcatsLeft StringLib /= #StringLib.c100 StringLib
scoreboard players operation #StringLib.StringsTotal StringLib %= #StringLib.c100 StringLib
execute unless score #StringLib.StringsTotal StringLib matches 0 run scoreboard players add #StringLib.ConcatsLeft StringLib 1
execute if score #StringLib.StringsTotal StringLib matches 0 run scoreboard players set #StringLib.StringsTotal StringLib 100

execute if score #StringLib.ConcatsLeft StringLib matches 1 store result storage stringlib:temp data.Size byte 1 run scoreboard players get #StringLib.StringsTotal StringLib
execute if score #StringLib.ConcatsLeft StringLib matches 2.. run data modify storage stringlib:temp data.Size set value 100b

data modify storage stringlib:temp data.StringList set from storage stringlib:input concat
data modify storage stringlib:temp data.S1 set from storage stringlib:temp data.StringList[-1]

# Concatenate the strings
function stringlib:zprivate/concat/combine_large with storage stringlib:temp data
data modify storage stringlib:output concat set from storage stringlib:temp data.S1

# Reset
data remove storage stringlib:temp data
return 1
