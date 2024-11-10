##########################################################################################################
##                                              HOW TO USE                                              ##
##########################################################################################################
## 1. Set the following data in the 'stringlib:input replace' data storage:                             ##
##    - String: Original string                                                                         ##
##    - Find: String you want to replace                                                                ##
##    - Replace: What you replace it with                                                               ##
##    - n: How many instances you want to replace                                                       ##
##        - Unset or 0: All                                                                             ##
##        - Positive: First n                                                                           ##
##        - Negative: Last -n                                                                           ##
## 2. Run this function                                                                                 ##
##                                                                                                      ##
## Output: String with all the 'Find' instances replaced by 'Replace'                                   ##
##         Example:                                                                                     ##
##                 - String: "Hello World!"                                                             ##
##                 - Find: "World"                                                                      ##
##                 - Replace: "Everyone"                                                                ##
##                 - n: 1                                                                               ##
##                 => Output: "Hello Everyone!"                                                         ##
##                                                                                                      ##
##                 - String: "15Hello 15World!"                                                         ##
##                 - Find: "15"                                                                         ##
##                 - Replace: ""                                                                        ##
##                 - n: Unset                                                                           ##
##                 => Output: "Hello World!"                                                            ##
##                                                                                                      ##
##                 - String: "Hello World!"                                                             ##
##                 - Find: "l"                                                                          ##
##                 - Replace: ""                                                                        ##
##                 - n: -1                                                                              ##
##                 => Output: "Hello Word!"                                                             ##
##                                                                                                      ##
## Return value: Number of replacements made                                                            ##
##                                                                                                      ##
## The output is found in the 'stringlib:output replace' data storage                                   ##
##########################################################################################################

# Setup
scoreboard players set #StringLib.ReturnValue StringLib 0

data modify storage stringlib:temp data.String set from storage stringlib:input replace.String
execute store result score #StringLib.FindLength StringLib run data get storage stringlib:input replace.Find
execute store result score #StringLib.CharsTotal StringLib run data get storage stringlib:temp data.String
scoreboard players operation #StringLib.CharsTotal StringLib -= #StringLib.FindLength StringLib
execute store result score #StringLib.FindAmount StringLib run data get storage stringlib:input replace.n
execute if score #StringLib.FindAmount StringLib matches 0 run scoreboard players set #StringLib.FindAmount StringLib 2147483647

execute unless score #StringLib.FindAmount StringLib matches ..-1 run scoreboard players set #StringLib.Index StringLib 1
execute if score #StringLib.FindAmount StringLib matches ..-1 run scoreboard players operation #StringLib.Index StringLib = #StringLib.CharsTotal StringLib

data modify storage stringlib:temp data2.PrevInput set from storage stringlib:input concat
data modify storage stringlib:temp data2.PrevOutput set from storage stringlib:output concat
data modify storage stringlib:input concat set value []

# Run 'Find' and add every character to 'stringlib:input concat'
execute if score #StringLib.FindAmount StringLib matches 1 run function stringlib:zprivate/replace/check_word_start_loop
execute if score #StringLib.FindAmount StringLib matches 2.. run function stringlib:zprivate/replace/main

execute if score #StringLib.FindAmount StringLib matches -1 run function stringlib:zprivate/replace/reversed/check_word_start_loop
execute if score #StringLib.FindAmount StringLib matches ..-2 run function stringlib:zprivate/replace/reversed/main

scoreboard players set #StringLib.FoundNothing StringLib 0

# Combine the characters again
execute if score #StringLib.FindAmount StringLib matches 0.. run data modify storage stringlib:input concat append string storage stringlib:temp data.CheckString.String 1
execute if score #StringLib.FindAmount StringLib matches ..-1 run data modify storage stringlib:input concat prepend string storage stringlib:temp data.CheckString.String 0 -1

execute store success score #StringLib.SuccessCheck StringLib if data storage stringlib:input concat[1]

execute if score #StringLib.SuccessCheck StringLib matches 1 run function stringlib:util/concat
execute if score #StringLib.SuccessCheck StringLib matches 1 run data modify storage stringlib:output replace set from storage stringlib:output concat
execute if score #StringLib.SuccessCheck StringLib matches 0 run data modify storage stringlib:output replace set from storage stringlib:input replace.String

data modify storage stringlib:input concat set from storage stringlib:temp data2.PrevInput
data modify storage stringlib:output concat set from storage stringlib:temp data2.PrevOutput
execute unless data storage stringlib:temp data2.PrevInput run data remove storage stringlib:input concat
execute unless data storage stringlib:temp data2.PrevOutput run data remove storage stringlib:output concat

# Reset
data remove storage stringlib:temp data
data remove storage stringlib:temp data2

# Return Values
execute if score #StringLib.SuccessCheck StringLib matches 1 run return run scoreboard players get #StringLib.ReturnValue StringLib
return fail
