# Toggle the load message
scoreboard players add #StringLib.ShowLoadMessage StringLib 1
execute unless score #StringLib.ShowLoadMessage StringLib matches 1 run scoreboard players set #StringLib.ShowLoadMessage StringLib 0

# Tellraw
execute if score #StringLib.ShowLoadMessage StringLib matches 0 run tellraw @s ["﹌ ",{text:"StringLib >> ",color:"#99EAD6"},"Disabled the load message"]
execute if score #StringLib.ShowLoadMessage StringLib matches 1 run tellraw @s ["﹌ ",{text:"StringLib >> ",color:"#99EAD6"},"Enabled the load message"]
