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
