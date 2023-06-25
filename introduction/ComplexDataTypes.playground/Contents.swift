import Cocoa

// Arrays (actually ArrayLists)
var numbers = [4, 8, 15, 16, 23, 42]

// Arrays start at index 0, thankfully
print(numbers[0])

// .append() to add an element
// The element must be of the same type
numbers.append(64)

// You can't just put an opening a closing bracket
// let empty = []
// Empty arrays can be created by calling Array<Type>()
let list = Array<Int>()
// Or with
let list2 = [Int]()

// .count also works with arrays
print(numbers.count)

// You can remove elements at a specific index with
numbers.remove(at: 3)

// you can clear the array with
numbers.removeAll()

let cities = ["London", "Tokyo", "Rome", "Budapest"]

// Check if an element is present
cities.contains("Tokyo")

// Copy the array and return a sorted version
let sortedCities = cities.sorted()

// .reversed() doesn't actually reverse the array it wraps it in a data structure which tells Swift that it's supposed to be reversed
let reversedCities = cities.reversed()
print(reversedCities)
