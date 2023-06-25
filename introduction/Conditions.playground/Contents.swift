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
