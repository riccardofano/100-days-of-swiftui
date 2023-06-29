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
