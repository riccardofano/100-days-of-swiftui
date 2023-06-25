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
