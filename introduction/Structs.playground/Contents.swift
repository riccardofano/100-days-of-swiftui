import Cocoa

// you can create structs with the struct keyword followed by the name
// inside you can declare its properties and methods
struct Album {
    let title: String
    let artist: String
    let releaseYear: Int
    
    func printSummary() {
        print("\(title) - \(releaseYear) by \(artist)")
    }
}

// NOTE: by convention types start with a capital letter so structs, enums and so forth should should start with an uppercase letter

// creating structs sorta looks like calling a function, we've seen this with arrays before
// this is syntactic sugar, Swift silently create a method called init() that has all the properties as parameters
let red = Album(title: "Red", artist: "Taylor Swift", releaseYear: 2012)
let wings = Album.init(title: "Wings", artist: "BTS", releaseYear: 2016)

// you access their properties with .property
red.artist
wings.releaseYear

// and you call its methods like you'd imagine
red.printSummary()
wings.printSummary()

print(red, wings)

struct Employee {
    let name: String
    var vacationRemaining: Int

    // if you want to have a method mutate a property you must tell Swift with the mutating keyword
    mutating func takeVacation(days: Int) {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm going on vacation!")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("Oops! There aren't enough days remaining.")
        }
    }
}

let employee1 = Employee(name: "Billy", vacationRemaining: 10)
// you cannot use mutating methods with constants.
// if you declare a variable with let the struct and all of its properties will be constant
// this is different from Javascript/Typescript where you can modify the properties of an object but not reassign it
// employee1.takeVacation(days: 5)

var employee2 = Employee(name: "Bobby", vacationRemaining: 10)
employee2.takeVacation(days: 2)

// struct properties can have default values and when Swift creates the .init() method that will also have the default value for that property
// if that property is a constant the parameter for that value will be removed from the .init() method
struct Employee2 {
    let name: String
    var vacationRemaining = 10
}
