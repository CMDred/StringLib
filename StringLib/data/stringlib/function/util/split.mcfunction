##########################################################################################################
##                                              HOW TO USE                                              ##
##########################################################################################################
## 1. Set the following data in the 'stringlib:input split' data storage:                               ##
##    - String: Original string                                                                         ##
##    - Separator: String you want to replace                                                           ##
##    - n: How many times should the string get splited                                                 ##
##        - Unset or 0: All                                                                             ##
##        - Positive: First n                                                                           ##
##        - Negative: Last -n                                                                           ##
## 2. Run this function                                                                                 ##
##                                                                                                      ##
## Output: String with all the 'Find' instances replaced by 'Replace'                                   ##
##         Example:                                                                                     ##
##                 - String: "Hello World !"                                                            ##
##                 - Separator: " "                                                                     ##
##                 - n: 1                                                                               ##
##                 => Output: ["Hello", "World !"]                                                      ##
##                                                                                                      ##
##                 - String: "Hello World !"                                                            ##
##                 - Separator: " "                                                                     ##
##                 - n: 0                                                                               ##
##                 => Output: ["Hello", "World", "!"]                                                   ##
##                                                                                                      ##
##                 - String: "2 + 2 + 4 = 8"                                                            ##
##                 - Separator: "+"                                                                     ##
##                 - n: -1                                                                              ##
##                 => Output: ["2 + 2 ", " 4 = 8"]                                                      ##
##                                                                                                      ##
## Return value: Number of texts in the output storage                                                  ##
##                                                                                                      ##
## The output is found in the 'stringlib:output split' data storage                                     ##
##########################################################################################################

# Get the position where the separator are located
data modify storage stringlib:input find set from storage stringlib:input split
data modify storage stringlib:input find.Find set from storage stringlib:input split.Separator
execute store result score #StringLib.SplitAmount StringLib run function stringlib:util/find
scoreboard players operation #StringLib.RemainingSplits StringLib = #StringLib.SplitAmount StringLib

# Get the list of required variables
data modify storage stringlib:temp data.String set from storage stringlib:input split.String
data modify storage stringlib:temp data.SplitIndexes set from storage stringlib:output find
# Is the list of indexes reversed?
execute store result score #StringLib.IsReversed StringLib run data get storage stringlib:input split.Amount
execute store success score #StringLib.IsReversed StringLib if score #StringLib.IsReversed StringLib matches ..-1

# Empty the output
data modify storage stringlib:output split set value []

# Get separator length
execute store result score #StringLib.FindLength StringLib run data get storage stringlib:input split.Separator

# Split the string
execute unless score #StringLib.RemainingSplits StringLib matches 0 run function stringlib:zprivate/split/main
data modify storage stringlib:output split prepend from storage stringlib:temp data.String

# Return
scoreboard players add #StringLib.SplitAmount StringLib 1
return run scoreboard players get #StringLib.SplitAmount StringLib

