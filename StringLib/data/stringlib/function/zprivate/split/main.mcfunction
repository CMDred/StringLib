# get data from the macro:
# - $(String): The string to split
# - $(SplitIndexes): List of indexes where the string's split should start
# get data from scoreboards:
# - #StringLib.RemainingSplits StringLib: How many times left should the string be split
# - #StringLib.FindLength StringLib: Length of the separator (= length of the split)
# - #StringLib.IsReversed StringLib: Is the list of indexes reversed?

# Get the start of the split
execute if score #StringLib.IsReversed StringLib matches 0 store result score #StringLib.SplitStart StringLib run data remove storage stringlib:temp data.SplitIndexes[-1]
execute if score #StringLib.IsReversed StringLib matches 1 store result score #StringLib.SplitStart StringLib run data remove storage stringlib:temp data.SplitIndexes[0]

# Get the end of the split
scoreboard players operation #StringLib.SplitStop StringLib = #StringLib.SplitStart StringLib
scoreboard players operation #StringLib.SplitStop StringLib += #StringLib.FindLength StringLib

# Store the scores in the temp storage
execute store result storage stringlib:temp data.SplitStart int 1 run scoreboard players get #StringLib.SplitStart StringLib
execute store result storage stringlib:temp data.SplitStop int 1 run scoreboard players get #StringLib.SplitStop StringLib

# Split the string
function stringlib:zprivate/split/split with storage stringlib:temp data

# Loop through the split indexes
scoreboard players remove #StringLib.RemainingSplits StringLib 1
execute if score #StringLib.RemainingSplits StringLib matches 1.. run function stringlib:zprivate/split/main

