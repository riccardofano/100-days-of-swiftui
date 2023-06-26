import Cocoa

// Functions are declared with the func keyword like in Go
func showWelcome() {
    print("Welcome to my app.")
}

// you can call functions with ()
showWelcome()

// you can specify parameters with a name followed by : and then the type
func add(to: Int, amount: Int) {
    print(to + amount)
}

// something interesting is how you *have* to specify the parameters in the function call
// and you *must* specify them in the correct order,
// this is not like named parameters in other languages where you can use whatever order you want because you specified the name
add(to: 10, amount: 2)

// you can indicate you return something from a function with a skinny arrow followed by the type
// then you can use the return keyword to break out of the function with a value of the type you specified
func rollDice() -> Int {
    return Int.random(in: 1...6)
}

// if the function only contians one line you can omit the return keyword
func rollDice2() -> Int {
    Int.random(1...6)
}

// if you have not specified a return type you can use return to instantly break out of a function
func maybePrint(num: Int) {
    if num == 2 {
        return
    }
    print(num)
}
