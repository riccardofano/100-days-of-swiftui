import Cocoa

struct GameStruct {
    var score: Int
    var isOver: Bool
}

var gameStruct1 = GameStruct(score: 10, isOver: false)
// struct assignments seem to be clones
var gameStruct2 = gameStruct1

gameStruct2.isOver = true
print(gameStruct1)
print(gameStruct2)

class GameClass {
    var score: Int
    var isOver: Bool
    
    // there's no default initializer in classes you have to create one yourself
    init(score: Int, isOver: Bool) {
        self.score = score
        self.isOver = isOver
    }
}

var gameClass1 = GameClass(score: 10, isOver: false)
// while class assignments seem to just be references?
// classes seem to behave like an Rc<RefCell>
var gameClass2 = gameClass1

gameClass2.isOver = true
print(gameClass1.isOver)
print(gameClass2.isOver)

// even if you declare a class with let you can still modify its properties as long as they aren't constant themselves
let gameClass3 = GameClass(score: 20, isOver: false)
print(gameClass3.score)
gameClass3.score += 5
print(gameClass3.score)

class Employee {
    let hours: Int

    init(hours: Int) {
        self.hours = hours
    }
    func printSummary() {
        print("I work \(hours) hours a day.")
    }
}

// to inherit from another class you put that class name following a colon
class Developer: Employee {
    func work() {
        // now this class also has access to the hours variable from the super class
        print("I'm writing code for \(hours) hours.")
    }
    
    // you can override a super class' methods with the override keyword
    // if your method has the same name as a super's method but accepts different params you don't need the override keyword
    override func printSummary() {
        print("I'm a developer who will sometimes work \(hours) hours a day, but other times spend hours arguing about whether code should be indented using tabs or spaces.")
    }
}

class Manager: Employee {
    func work() {
        print("I'm going to meetings for \(hours) hours.")
    }
}

let bobby = Manager(hours: 10)
// subclasses can access both variables and methods from the super class
print(bobby.hours)
bobby.printSummary()

final class Student {
    var classes = 10
}

// if a class is marked with `final` it can't be used to inherit from
// but it can inherit from other classes
// class ArtStudent: Student { }

class Vehicle {
    let isElectric: Bool

    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car: Vehicle {
    let isConvertible: Bool

    init(isConvertible: Bool, isElectric: Bool) {
        self.isConvertible = isConvertible
        // have to call super.init() *after* you initialized your own variables
        // can't do it before it seems
        super.init(isElectric: isElectric)
    }
}
