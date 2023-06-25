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
