##################################################################################
##                                  HOW TO USE                                  ##
##################################################################################
## 1. Set the following data in the 'stringlib:input split' data storage:       ##
##    - String: Original string                                                 ##
##    - Separator: String that splits the original into multiple                ##
##        - Default: " "                                                        ##
##    - n: Up until which instance of the separator it should split             ##
##        - Unset or 0: All                                                     ##
##        - Positive: First n                                                   ##
##        - Negative: Last -n                                                   ##
##    - KeepEmpty: Boolean for whether to keep empty Strings in the output list ##
##        - Unset or 0b: Remove                                                 ##
##        - 1b: Keep                                                            ##
##                                                                              ##
## 2. Run this function                                                         ##
##                                                                              ##
## Output: List of Strings, separated by the Separator                          ##
##         Example:                                                             ##
##                 - String: "Hello World!"                                     ##
##                 - Separator: " "                                             ##
##                 - n: 1                                                       ##
##                 - KeepEmpty: Unset                                           ##
##                 => Output: ["Hello", "World!"]                               ##
##                                                                              ##
##                 - String: "Test! HelloTestWorld!"                            ##
##                 - Separator: "Test"                                          ##
##                 - n: -1                                                      ##
##                 - KeepEmpty: Unset                                           ##
##                 => Output: ["Test! Hello", "World!"]                         ##
##                                                                              ##
##                 - String: " Hello    World! "                                ##
##                 - Separator: " "                                             ##
##                 - n: Unset                                                   ##
##                 - KeepEmpty: 1b                                              ##
##                 => Output: ["", "Hello", "", "", "", "World!", ""]           ##
##                                                                              ##
##                                                                              ##
## Return value: Number of elements in the output list, or fail                 ##
##                                                                              ##
## The output is found in the 'stringlib:output split' data storage             ##
##################################################################################
# Potential optimization: Detect if the current instance of the seperator came DIRECTLY after the previous one. If yes, and if KeepEmpty is 0b, ignore it and don't run the macro
# => It's probably best to set up a recursive loop that continues the loop from main, but skips everything for as long as the separators are after each other. So it checks if the *next* one is directly after the current one

# Find all instances of the separator
data modify storage stringlib:temp data2.PrevInput set from storage stringlib:input find
data modify storage stringlib:temp data2.PrevOutput set from storage stringlib:output find

data modify storage stringlib:input find.String set from storage stringlib:input split.String
data modify storage stringlib:input find.Find set from storage stringlib:input split.Separator
execute unless data storage stringlib:input find.Find run data modify storage stringlib:input find.Find set value " "
data remove storage stringlib:input find.n
data modify storage stringlib:input find.n set from storage stringlib:input split.n
function stringlib:util/find

# Setup
data modify storage stringlib:output split set value []
execute store result score #StringLib.KeepEmpty StringLib run data get storage stringlib:input split.KeepEmpty

# Reset temporary storage & return fail if no separator was found
execute if data storage stringlib:output {find:[-1]} run return run function stringlib:zprivate/split/fail

# Split
execute store result score #StringLib.FindAmount StringLib run data get storage stringlib:input split.n
execute if score #StringLib.FindAmount StringLib matches 0.. run function stringlib:zprivate/split/setup
execute if score #StringLib.FindAmount StringLib matches ..-1 run function stringlib:zprivate/split/reversed/setup

# Reset
data modify storage stringlib:input find set from storage stringlib:temp data2.PrevInput
data modify storage stringlib:output find set from storage stringlib:temp data2.PrevOutput
execute unless data storage stringlib:temp data2.PrevInput run data remove storage stringlib:input find
execute unless data storage stringlib:temp data2.PrevOutput run data remove storage stringlib:output find
data remove storage stringlib:temp data2
data remove storage stringlib:temp data

# Return Values
return run execute if data storage stringlib:output split[]
