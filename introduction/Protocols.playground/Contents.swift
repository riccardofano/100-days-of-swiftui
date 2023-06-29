import Cocoa

// Protocols are like interfaces in other languages or Traits in Rust,
// they let you define what methods a type implementing this protocol must have
// you can use protocols with struct, classes and enums
protocol Vehicle {
    // you can also define what variables a struct should have to be compliant
    // get means that it must be readable
    var name: String { get }
    // get set means it must be readable and writable
    var currentPassangers: Int { get set }
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

struct Car: Vehicle {
    let name = "Car"
    var currentPassangers = 0
    // this struct must have an implementation for these two functions to conform to the protocol
    // the names and the types must be the same as in the protocol
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }
    func travel(distance: Int) {
        print("I'm driving \(distance)km.")
    }
    
    // but it's not restricted to only having the protocol's methods
    func openSunroof() {
        print("It's a nice day!")
    }
}

struct Bicycle: Vehicle {
    let name = "Bike"
    var currentPassangers = 0
    
    func estimateTime(for distance: Int) -> Int {
        distance / 10
    }

    func travel(distance: Int) {
        print("I'm cycling \(distance)km.")
    }
}

// setting the type of a parameter to accept a protocol means that any struct conforming to the protocol will be accepted
func commute(distance: Int, using vehicle: Vehicle) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("That's too slow! I'll try a different vehicle.")
    } else {
        vehicle.travel(distance: distance)
    }
}

let car = Car()
commute(distance: 50, using: car)

let bike = Bicycle()
commute(distance: 50, using: bike)

// now that the structs share a protocol we can put them together in an array
// and we are able to use all the methods/properties specified in the protocol
func getTravelEstimates(using vehicles: [Vehicle], distance: Int) {
    for vehicle in vehicles {
        let estimate = vehicle.estimateTime(for: distance)
        print("\(vehicle.name): \(estimate) hours to travel \(distance)km")
    }
}

getTravelEstimates(using: [car, bike], distance: 150)

// TIP: you can conform to any number of protocols by separating them with a comma
// struct Car: Vehicle, Convertible {}

// returning `some Protocol` means I want to return something that complies to the protocol
// but that Swift should figure out the actual type as opposed to it being an abstract object
func getRandomNumber() -> some Equatable {
    Int.random(in: 1...10)
}

func getRandomBool() -> some Equatable {
    Bool.random()
}

// so you can't compare the return types of a function that returns
// an Int as its `some Equatable` and one that returns a Bool as its `some Equatable`

// Error: cannot convert value of type 'some Equatable' from getRandomBool() to 'some Equatable' from getRandomNumber()
// print(getRandomBool() == getRandomNumber())

// but if you compare two calls from the same function it will work
print(getRandomBool() == getRandomBool())

// but you can return a protocol and store it in an array for example
func getRandomVehicle() -> Vehicle {
    if Bool.random() {
        return Car()
    } else {
        return Bicycle()
    }
}

var arr = [Vehicle]()
arr.append(getRandomVehicle())
arr.append(getRandomVehicle())
arr.append(getRandomVehicle())
arr.append(getRandomVehicle())
arr.append(getRandomVehicle())
print(arr)

// you can add functionality to types by using the extension keyword
// the types don't even have to be your own, here we are the modifying the default String type

// Kinda like Rust's impl which are separate from the struct/enum body
// but there you can't extend a type itself that isn't your own you need to create a trait and impl that for the type
extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    // you can also have mutating methods
    mutating func trim() {
        self = self.trimmed()
    }
    
    // you can also add computed properties
    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
}

// TIP: if you add your init function in an extension Swift don't remove the memberwise init it provides by default
struct Book {
    let name: String
    let pageCount: Int
    let readingHours: Int
}

extension Book {
    init(name: String, pageCount: Int) {
        self.name = name
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }
}
