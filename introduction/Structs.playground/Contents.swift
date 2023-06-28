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
// this is called the memberwise initializer
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

struct Employee3 {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0

    // structs can have computed properties,
    // they get calculated when you access them with .property
    var vacationRemaining: Int {
        vacationAllocated - vacationTaken
    }
    
    // if you want to set computed properties you have to provide a getter and setter
    // `newValue` is the value you passed in
    // vacationRemaining2 = 5 <- newValue
    var vacationRemaining2: Int {
        get {
            vacationAllocated - vacationTaken
        }
        set {
            vacationAllocated = vacationTaken + newValue
        }
    }
}

var tommy = Employee3(name: "Tommy")
print(tommy.vacationRemaining2)
tommy.vacationRemaining2 += 5
print(tommy.vacationRemaining2)

struct Game {
    var score = 0 {
        // you can use willSet or didSet to run some code just before or after a property has been updated
        willSet {
            print("Game score was: \(score)")
            // Swift provides a `newValue` variable inside willSet too
            print("The new score is going to be \(newValue)")
        }
        // or just after
        didSet {
            print("Game score is now: \(score)")
            // and in didSet you have access to `oldValue` instead
            print("The old game score was: \(oldValue)")
        }
    }
}

var game = Game()
game.score += 10

struct Player {
    let name: String
    let number: Int

    // you can create your own initializer like this
    // note that there's no func keyword before the function
    // and the return type is always Self (whatever struct you're inside) so you don't need to specify it
    // all properties must be initialized by the end of the function for this to be valid
    // once you set a custom init function you lose access to the memberwise one Swift provides by default
    init(name: String) {
        // you use `self` to assign a value to the properties
        // so Swift is not confused between the property name and the parameter name
        self.name = name
        self.number = Int.random(in: 1...99)
    }
    
    // you can also overload initializers
    init(name: String, number: Int) {
        self.name = name
        self.number = number
    }
}

struct BankAccount {
    // making variables private makes it so you can't directly access it with .variable
    // now only methods from inside the struct can modify it
    private var funds = 10000
    
    // the access keywords are:
    // private: don't let anything outside this struct use it
    // privatefile: don't let anything outside this file use it
    // private(set): let anyone read it but only the methods are write it
    // public: let anyone do whatever
    
    mutating func deposit(amount: Int) {
        funds += amount
    }

    mutating func withdraw(amount: Int) -> Bool {
        if funds >= amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

// when a property is private you can no longer set it with the default initializer
let account = BankAccount()
// this is not allowed with a private funds property
// account.funds -= 100
