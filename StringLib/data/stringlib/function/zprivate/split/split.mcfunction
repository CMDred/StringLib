# get data from the macro:
# - $(String): The string to split
# - $(SplitStart): Start of the split
# - $(SplitStop): End of the split
# output storage: stringlib:output split

$data modify storage stringlib:output split prepend string storage stringlib:temp data.String $(SplitStop)
$data modify storage stringlib:temp data.String set string storage stringlib:temp data.String 0 $(SplitStart)

