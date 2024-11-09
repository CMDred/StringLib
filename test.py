class asserts():
    def equal(a: any, b: any):
        try:
            assert a == b
        except AssertionError:
            print(f"AssertionError: {a} != {b}")
            raise AssertionError(f"{a} != {b}")
        try:
            assert isinstance(a, type(b))
        except AssertionError:
            print(f"AssertionError: {type(a)} != {type(b)}")
            raise AssertionError(f"{type(a)} != {type(b)}")

    def todo():
        raise NotImplementedError("Not implemented yet")

# Testing the logic of my code
class stringlib:
    def __init__(self):
        self.input: dict[str, dict[str, any]] = {}
        self.output: dict[str, any] = {}
        self.temp: dict[str, dict[str, any]] = {"data": {}}
        self.score: dict[str, int] = {}

    def find(self):
        String: str = self.input["find"]["String"]
        Find: str = self.input["find"]["Find"]
        Amount: int = self.input["find"]["Amount"]
        Amount = 0 if Amount is None else Amount

        Range = range(len(String)) if Amount >= 0 else range(len(String) - 1, -1, -1)
        Amount = abs(Amount)
        Amount = len(String) if Amount == 0 else Amount

        self.output["find"] = []

        for i in Range:
            if String[i:].startswith(Find):
                Amount -= 1
                self.output["find"].append(i)
                if Amount == 0:
                    break
        return len(self.output["find"])

    def split(self):
        # Get the position where the separator are located
        self.input["find"] = self.input["split"]
        self.input["find"]["Find"] = self.input["split"]["Separator"]
        self.score["#StringLib.SplitAmount"] = self.find()
        self.score["#StringLib.RemainingSplits"] = self.score["#StringLib.SplitAmount"]

        # Get the list of required variables
        self.temp["data"]["String"] = self.input["split"]["String"]
        self.temp["data"]["SplitIndexes"] = self.output["find"]
        # Is the list of indexes reversed?
        self.score["#StringLib.IsReversed"] = self.input["split"]["Amount"]
        self.score["#StringLib.IsReversed"] = 1 if self.score["#StringLib.IsReversed"] <= -1 else 0

        # Empty the output
        self.output["split"] = []

        # Get separator length
        self.score["#StringLib.FindLength"] = len(self.input["split"]["Separator"])

        # Split the string
        if not self.score["#StringLib.RemainingSplits"] == 0: self.zprivate_split_main()
        self.output["split"].insert(0, self.temp["data"]["String"])

        # Return
        self.score["#StringLib.SplitAmount"] += 1
        return self.score["#StringLib.SplitAmount"]

    def zprivate_split_main(self):
        # Get the start of the split
        if self.score["#StringLib.IsReversed"] == 0: self.score["#StringLib.SplitStart"] = self.temp["data"]["SplitIndexes"].pop(-1)
        if self.score["#StringLib.IsReversed"] == 1: self.score["#StringLib.SplitStart"] = self.temp["data"]["SplitIndexes"].pop(0)

        # Get the end of the split
        self.score["#StringLib.SplitStop"] = self.score["#StringLib.SplitStart"]
        self.score["#StringLib.SplitStop"] += self.score["#StringLib.FindLength"]

        # Store the scores in the temp storage
        self.temp["data"]["SplitStart"] = int(self.score["#StringLib.SplitStart"]) * 1
        self.temp["data"]["SplitStop"] = int(self.score["#StringLib.SplitStop"]) * 1

        # Split the string
        self.zprivate_split_split(self.temp["data"])

        # Loop through the split indexes
        self.score["#StringLib.RemainingSplits"] -= 1
        if self.score["#StringLib.RemainingSplits"] >= 1: self.zprivate_split_main()

    def zprivate_split_split(self, input: dict[str, any]):
        String = input["String"]
        SplitStart = input["SplitStart"]
        SplitStop = input["SplitStop"]

        self.output["split"].insert(0, String[SplitStop:])
        self.temp["data"]["String"] = String[0:SplitStart]

# Tests
lib = stringlib()
if True:  # Test - Find     // ensure my implementation works the same as the allready existing one
    print("Test - Find")
    if True:  # Test - Find - 1
        print("1 - Test - Find")
        lib.input = {"find": {"String": "Hello World!", "Find": "l", "Amount": 1}}
        asserts.equal(lib.find(), 1)
        asserts.equal(lib.output["find"], [2])
    if True:  # Test - Find - 2
        print("2 - Test - Find")
        lib.input = {"find": {"String": "Hello World!", "Find": "l", "Amount": None}}
        asserts.equal(lib.find(), 3)
        asserts.equal(lib.output["find"], [2, 3, 9])
    if True:  # Test - Find - 3
        print("3 - Test - Find")
        lib.input = {"find": {"String": "Hello World!", "Find": "l", "Amount": -2}}
        asserts.equal(lib.find(), 2)
        asserts.equal(lib.output["find"], [9, 3])
if True:  # Test - zprivate - split - split
    print("Test - zprivate - split - split")
    if True:  # Test - zprivate - split - split - 1
        print("1 - Test - zprivate - split - split")
        lib.temp["split"] = {"String": "Hello World !", "SplitStart": 5, "SplitStop": 7}
        lib.output["split"] = []
        lib.zprivate_split_split(lib.temp["split"])
        asserts.equal(lib.output["split"], ["orld !"])
        asserts.equal(lib.temp["data"]["String"], "Hello")
    if True:  # Test - zprivate - split - split - 2
        print("2 - Test - zprivate - split - split")
        lib.temp["split"] = {"String": "Hello World !", "SplitStart": 0, "SplitStop": 5}
        lib.output["split"] = []
        lib.zprivate_split_split(lib.temp["split"])
        asserts.equal(lib.output["split"], [" World !"])
        asserts.equal(lib.temp["data"]["String"], "")
    if True:  # Test - zprivate - split - split - 3
        print("3 - Test - zprivate - split - split")
        lib.temp["split"] = {"String": "Hello World !", "SplitStart": 5}
        lib.temp["split"]["SplitStop"] = len(lib.temp["split"]["String"])
        lib.output["split"] = []
        lib.zprivate_split_split(lib.temp["split"])
        asserts.equal(lib.output["split"], [""])
        asserts.equal(lib.temp["data"]["String"], "Hello")
    if True:  # Test - zprivate - split - split - 4
        print("4 - Test - zprivate - split - split")
        lib.temp["split"] = {"String": "Hello World !", "SplitStart": 5, "SplitStop": 7}
        lib.output["split"] = ["Hello"]
        lib.zprivate_split_split(lib.temp["split"])
        asserts.equal(lib.output["split"], ["orld !", "Hello"])
        asserts.equal(lib.temp["data"]["String"], "Hello")
if True:  # Test - zprivate - split - main
    print("Test - zprivate - split - main")
    if True:  # Test - zprivate - split - main - 1
        print("1 - Test - zprivate - split - main")
        lib.temp["data"] = {"String": "Hello World !", "SplitIndexes": [5]}
        lib.score = {"#StringLib.IsReversed": 0, "#StringLib.FindLength": 1, "#StringLib.RemainingSplits": len(lib.temp["data"]["SplitIndexes"])}
        lib.output["split"] = []
        lib.zprivate_split_main()
        asserts.equal(lib.output["split"], ["World !"])
    if True:  # Test - zprivate - split - main - 2
        print("2 - Test - zprivate - split - main")
        lib.temp["data"] = {"String": "Hello World !", "SplitIndexes": [11]}
        lib.score = {"#StringLib.IsReversed": 1, "#StringLib.FindLength": 1, "#StringLib.RemainingSplits": len(lib.temp["data"]["SplitIndexes"])}
        lib.output["split"] = []
        lib.zprivate_split_main()
        asserts.equal(lib.output["split"], ["!"])
    if True:  # Test - zprivate - split - main - 3
        print("3 - Test - zprivate - split - main")
        lib.temp["data"] = {"String": "Hello World !", "SplitIndexes": [5, 11]}
        lib.score = {"#StringLib.IsReversed": 0, "#StringLib.FindLength": 1, "#StringLib.RemainingSplits": len(lib.temp["data"]["SplitIndexes"])}
        lib.output["split"] = []
        lib.zprivate_split_main()
        asserts.equal(lib.output["split"], ["World", "!"])
    if True:  # Test - zprivate - split - main - 4
        print("4 - Test - zprivate - split - main")
        lib.temp["data"] = {"String": "Hello World !", "SplitIndexes": [11,5]}
        lib.score = {"#StringLib.IsReversed": 1, "#StringLib.FindLength": 1, "#StringLib.RemainingSplits": len(lib.temp["data"]["SplitIndexes"])}
        lib.output["split"] = []
        lib.zprivate_split_main()
        asserts.equal(lib.output["split"], ["World", "!"])
if True:  # Test - Split
    print("Test - Split")
    if True:  # Test - Split - 1
        print("1 - Test - Split")
        lib.input = {"split": {"String": "Hello World !", "Separator": " ", "Amount": 1}}
        asserts.equal(lib.split(), 2)
        asserts.equal(lib.output["split"], ["Hello", "World !"])
    if True:  # Test - Split - 2
        print("2 - Test - Split")
        lib.input = {"split": {"String": "Hello World !", "Separator": " ", "Amount": 0}}
        asserts.equal(lib.split(), 3)
        asserts.equal(lib.output["split"], ["Hello", "World", "!"])
    if True:  # Test - Split - 3
        print("3 - Test - Split")
        lib.input = {"split": {"String": "2 + 2 + 4 = 8", "Separator": "+", "Amount": -1}}
        asserts.equal(lib.split(), 2)
        asserts.equal(lib.output["split"], ["2 + 2 ", " 4 = 8"])
    if True:  # Test - Split - 4
        print("4 - Test - Split")
        lib.input = {"split": {"String": "2 + 2 + 4 = 8", "Separator": "$", "Amount": 1}}
        asserts.equal(lib.split(), 1)
        asserts.equal(lib.output["split"], ["2 + 2 + 4 = 8"])

# End
print("All tests passed!")

