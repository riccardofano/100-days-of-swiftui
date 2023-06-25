import Cocoa

var greeting = "Hello, playground"

// var: creates a variable
var name = "Riccardo"
print(name)
name = "Another name"
print(name)

// let: creates a constant
let constant = "Something"
// constant = "Something else" // Error

// NOTE: Swift uses camelCase as a convention for variable names
// TIP: Use constants by default

// Swift uses utf-8 encoded strings so you can use emojis, kanji and other non ascii characters
let actor = "Denzel Washington ✨"

// backslash to escape quotes in strings like in every other language
let quote = "Then he tapped a sign saying \"Believe\" and walked away."

// triple quotes for multi line comments
// and that also allows you to type double quotes normally
let movie = """
A day in
the life of an
Apple engineer
"""

// .counts for length
print(movie.count)

// .uppercased() for to return an uppercased version
print(movie.uppercased())

// .hasPrefix/Suffix return a boolean if the case sensitive string matches, they're nice to have
print(movie.hasPrefix("a day"))
print(movie.hasSuffix(".engineer"))

let score = 10
// TIP: Swift ignores underscores so you can add them to make the number more readable
let reallyBig = 1_000_000

// all the standard math operators
let lowerScore = score - 2
let higherScore = score + 10
let doubledScore = score * 2
let halvedScore = score / 2
// you can't use ** to elevate to the power of a number, theres' pow() for that
let squaredScore = score * score

// there's all the math assignment operators too
var counter = 20
counter *= 2
counter /= 10
counter += 1
counter -= 3
// you can't use ++ to increment by one, use += 1 instead
// I don't mind it, but I don't know if Swift uses simple for loop like (var i = 0; i < arr.count; i++), I doubt it.
// counter++

let number = 120
// there's a method in the standard library for `number % 3 == 0`, nice
print(number.isMultiple(of: 3))
