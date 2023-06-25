import Cocoa

// If statements

let someCondition = true
// You don't need parens wrapping the condition
if someCondition {
    print("Hello")
}

// Swift supports the usual comparison operators
// == equals
// != not equals
// > greater than
// >= greater or equal than
// < less than
// <= less or equal than

// NOTE: Swift does not store the length of a string, it evaluated it when .count is called,
// checking if a string is empty is better done with the builtin .isEmpty
let word = ""
if word.isEmpty {
    print("word was empty")
}

let age = 16

// else if and else are also present, as you'd hope
if age >= 18 {
    print("You can vote at the next election")
} else if age >= 16 {
    print("You are so close to being able to vote")
} else {
    print("You'll have to wait a bit more before you'll be allowed to vote")
}

// There are the logical operators && (and) and || (or) that let you chain conditionals
let userAge = 14
let hasParentalConsent = true

if userAge >= 18 || hasParentalConsent {
    print("You can buy the game")
}

enum Weather {
    case sun, rain, wind, snow, unknown
}

let forecast = Weather.wind
// Swift has switch statements too
// cases don't fall through like in C
// switch statements have to exhaustive like with Rust match statements
switch forecast {
case .sun:
    print("It should be a nice day.")
case rain:
    print("Pack an umbrella.")
case wind:
    print("Wear something warm.")
case snow:
    print("School is cancelled.")
case unknown:
    print("Prepare for the worst.")
}

let name = "Riccardo"
// you can provide a catchall case with `default`
switch name {
case "Riccardo":
    print("Ciao Riki")
default:
    print("I don't know who you are.")
}

let day = 5
print("My true love gave to me…")

// You can have cases fall through by explicitly using the keyword `fallthrough`
switch day {
case 5:
    print("5 golden rings")
    fallthrough
case 4:
    print("4 calling birds")
    fallthrough
case 3:
    print("3 French hens")
    fallthrough
case 2:
    print("2 turtle doves")
    fallthrough
default:
    print("A partridge in a pear tree")
}
