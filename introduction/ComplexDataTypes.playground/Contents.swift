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

// Dictionaries are declared with [] instead of {} like most languages
// they look like arrays but have `key: value` pairs instead of just values
// the keys are also surrounded by quotes which is unusual, this is because you can specify type you want, it's not restricted to strings and numbers like in, for example, Javascript
let employee = [
    "name": "Taylor Swift",
    "job": "Singer",
    "location": "Nashville"
]

// you can get the value by using dict["key"]
// you don't seem to be able to use dict.key
// accessing a dictionary returns an Optional, you can specify a default value in the [] after the key
print(employee["name", default: "unknown"])

// You can make an empty dictionary just like with Arrays
var heights = [String: Int]()
heights["Yao Ming"] = 229

// Dictionaries also have .count and .removeAll() like arrays

// Sets
var people = Set(["Denzel Washington", "Tom Cruise", "Nicolas Cage", "Samuel L Jackson"])
print(people)

// You use .insert() instead of .append() to add elements because the data is not ordered.
people.insert("Me")
// Sets also have .count and similar things to arrays and dictionaries
// Other information about sets is not Swift specific

// Enums
enum Weekday {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
}

var day = Weekday.monday
day = Weekday.tuesday
day = Weekday.wednesday

// You can specify each day as its own case keyword
// or you can separate them with commas in one line
enum WeekendDay {
    case saturday, sunday
}

// After Swift knows the type you can omit the enum name and just specify the variant with a dot before it
var otherDay = Weekday.friday
otherDay = .monday
