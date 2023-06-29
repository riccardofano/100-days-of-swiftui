import Cocoa

let opposites: [String: String] = [
    "Mario": "Wario",
    "Luigi": "Waluigi"
]

// accessing dictionaries returns an optional because a value might not be there
// this is just like Rust
// optionals are rappresented with a ? after the type like `String?`
// if there is no value there Swift says it's `nil`
let wapeach = opposites["Peach"]

// you need to unwrap the value from the optional to access it.
// the most common way is using `if let`
// inside we're inside the if let scope we know the value is not nil
// this is almost the same as Rust, Swift doesn't wrap the value in Some<> so you don't need to destruct it when using if let
// if let Some(opposite) <- Rust | if let opposite <- Swift
let character = "Mario"
if let opposite = opposites[character] {
    print("\(character)'s opposite is \(opposite)")
    // you can add an else block what will run if the value was nil
} else {
    print("There was no opposite for this character")
}

let number: Int? = nil
// you can use shadowing in if let statements
if let number = number {
    print("the number is \(number)")
}

// there's an equivalent for Rust's `let else` statement in Swift
// (which is actually what inspired devs to add it in Rust in the first place)
// it's `guard let else`
// this allows you to not have nested optional unwrappings but you must exit the function if you hit the else block
func square(_ number: Int?) -> Int {
    guard let number = number else {
        // you are not allowed to continue with the function once you're inside this block
        return 0
    }
    return number * number
}

print(square(nil))
print(square(4))

let arr = [Int]()
// you can use guard statements even without optionals
func printArray(arr: [Int]) {
    guard arr.isEmpty else {
        return
    }
    print(arr)
}

// you can also unwrap and it will crash the program at runtime if your get a nil value
let maybeString: String? = nil
// maybeString.unsafelyUnwrapped()

// Swift has the nullish coalescent operator (??) like in Typescript
let opposite = opposites["Peach"] ?? "No one"
print(opposite)

// TIP: when accessing values from dictionaries there's a `default` parameter that does the job instead of ??
// but ?? works for everything
let opposite2 = opposites["Peach", default: "No one"]
print(opposite2)
