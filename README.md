# StringLib
A Minecraft Data Pack library that offers highly optimized implementations for many useful string manipulation utilities.\
Download: [Modrinth](https://modrinth.com/datapack/stringlib)\
For inquiries, please contact **@silicatYT** on Discord.

## Features
- `concat`: Combine an arbitrary number of strings into a single string.
  - Example: `["123","456","789]` &rarr; `"123456789"`
- `find`: Get a list of indexes for instances of a string. You can also go in reverse and limit the number of results.
  - Example: `{String:"Looking for the last 'o' in this sentence", Find:"o", n:-1}` &rarr; `[22]`
- `split`: Split a string into a list of strings based on a delimiter.
  - Example: `{String:"This is a sentence", Delimiter:" "}` &rarr; `["This","is","a","sentence"]`
- `replace`: Replace instances of a string with another string. You can also go in reverse and limit the number of replacements.
  - Example: `{String:"Bad example", Find:"Bad", Replace:"Great"}` &rarr; `"Great example"`
- `to_uppercase / to_lowercase`: Convert a string to uppercase or lowercase. Choose between a fast and a full version, the latter supporting the entire Unicode range.
  - Example: `"This is uppercase"` &rarr; `"THIS IS UPPERCASE"`
- `insert`: Insert a string at a specific index.
  - Example: `{String:"This is cool", Insertion:" really", Index:7}` &rarr; `"This is really cool"`
- `to_string`: Convert any data storage entry to a string.
  - Example: `127b` &rarr; `"127"`
- `to_number`: Convert a stringified number to a number.
  - Example: `"512"` &rarr; `512`
- and more to come!

## How to use
You can find the utility functions in `stringlib:util/...`. In each function, there is a detailed guide for how to use it, along with a list of all the parameters.

## Credit
From CMDred:
- **SilicatYT:** StringLib
Outstanding contributions:
- **Rignchen:** split

## Good to know
- If you no longer need StringLib or want to upgrade to a newer version, you can run `/function stringlib:uninstall` to remove all the data storage and scoreboard entries.

## License
As per the MIT License, you are allowed to redistribute, modify and use StringLib as long as we are credited for the original work.
