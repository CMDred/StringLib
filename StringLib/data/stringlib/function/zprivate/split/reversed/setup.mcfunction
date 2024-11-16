# Split the part in front of every instance of the separator (Do the first iteration here)
execute store result score #StringLib.CharsTotal StringLib run data get storage stringlib:input split.String
execute store result score #StringLib.SeparatorLength StringLib run data get storage stringlib:input find.Find
execute store result score #StringLib.SplitsLeft StringLib if data storage stringlib:output find[]

data modify storage stringlib:temp data.Min set value 0
execute store result storage stringlib:temp data.Max int 1 store result score #StringLib.Max StringLib run data get storage stringlib:output find[-1]
function stringlib:zprivate/split/reversed/main with storage stringlib:temp data

# Append a "" if KeepEmpty is 1b and there's a trailing separator
execute store result storage stringlib:temp data.Min int 1 run scoreboard players operation #StringLib.Max StringLib += #StringLib.SeparatorLength StringLib
execute if score #StringLib.KeepEmpty StringLib matches 1 if score #StringLib.Max StringLib = #StringLib.CharsTotal StringLib run data modify storage stringlib:output split append value ""

# Append the part after the last separator
execute unless score #StringLib.Max StringLib = #StringLib.CharsTotal StringLib run function stringlib:zprivate/split/last_segment with storage stringlib:temp data
