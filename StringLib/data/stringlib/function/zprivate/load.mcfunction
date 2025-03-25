# Init
scoreboard objectives add StringLib dummy
execute unless score #StringLib.Init StringLib matches 1 run function stringlib:zprivate/init

# Tellraw
execute if score #StringLib.ShowLoadMessage StringLib matches 1 run tellraw @a ["﹌ ",{text:"StringLib >> ",color:"#99EAD6"},{text:"Made by CMDred",click_event:{action:"open_url",url:"https://www.youtube.com/BluesProductionTeam"},hover_event:{action:"show_text",value:[{text:"YouTube: ",color:"dark_aqua"},{text:"CMDred",color:"white"}]}},"\n﹌ ",{text:"StringLib >> ",color:"#99EAD6"},"Get the latest updates: ",{text:"Modrinth",color:"#5491F7",click_event:{action:"open_url",url:"https://modrinth.com/datapack/stringlib"},hover_event:{action:"show_text",value:["Open page"]}},", ",{text:"GitHub",color:"#5491F7",click_event:{action:"open_url",url:"https://github.com/CMDred/StringLib"},hover_event:{action:"show_text",value:["Open page"]}}]
