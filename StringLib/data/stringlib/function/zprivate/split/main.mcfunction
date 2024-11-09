# get data from the macro:
# - $(String): The string to split
# - $(SplitIndexes): List of indexes where the string's split should start
# get data from scoreboards:
# - #StringLib.RemainingSplits StringLib: How many times left should the string be split
# - #StringLib.FindLength StringLib: Length of the separator (= length of the split)
# - #StringLib.IsReversed StringLib: Is the list of indexes reversed?


# Loop through the split indexes
data remove storage stringlib:temp data.SplitIndexes[-1]
scoreboard players remove #StringLib.RemainingSplits StringLib 1
execute if score #StringLib.RemainingSplits StringLib matches 1.. run function stringlib:zprivate/split/main

