import Cocoa

let list = ["one", "two", "one", "three", "four", "three"]
let unique = Set(list)
print("There are \(list.count) items in the array and \(unique.count) unique values.")
