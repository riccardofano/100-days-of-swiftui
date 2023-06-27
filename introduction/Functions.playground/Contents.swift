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
    Int.random(in: 1...6)
}

// if you have not specified a return type you can use return to instantly break out of a function
func maybePrint(num: Int) {
    if num == 2 {
        return
    }
    print(num)
}

// tuples allows you to return multiple values from a function
// their values have names in Swift which seems nice, it's one of the things I wish Rust had
func getUser() -> (firstName: String, lastName: String) {
    (firstName: "Riccardo", lastName: "Fano")
}

// you don't even need to say the name of the value when returning from a function, Swift is smart enough to know what their names are supposed to be
func getUser2() -> (firstName: String, lastName: String) {
    ("Taylor", "Swift")
}

// you can access a tuple's value with .property
print(getUser().firstName)

// tuples don't *have* to have named values
func getUser3() -> (String, String) {
    ("Taylor", "Swift")
}
// when values don't have names you can access them with .index
print(getUser3().0)

// you can destruct tuples too
let (firstName, lastName) = getUser()
// the variable name can be whatever you want and you can ignore a value with an underscore
let (name, _) = getUser()

// you can overload functions with the same name but different param names
func hireEmployee(name: String) { }
func hireEmployee(title: String) { }
func hireEmployee(location: String) { }

// you can add an _ before the param name to allow the function to be called without specifying the argument name
func isUppercase(_ string: String) -> Bool {
    string == string.uppercased()
}
let string = "HELLO, WORLD"
let result = isUppercase(string)

// actually you can specify any name you want to a param so you can use a different name in the function body than the one when you call it
func printTimesTables(for number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}
printTimesTables(for: 5)

// you can specify a default value for a param with a = value after the type
// default values don't have to be at the end of the parameter list
func printTimesTables(for number: Int = 5, end: Int) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}
printTimesTables(end: 12)
