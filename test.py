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

        # Get separator length
        self.score["#StringLib.FindLength"] = len(self.input["split"]["Separator"])

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

