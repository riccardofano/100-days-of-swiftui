import Cocoa

// A property storing how many rooms it has.
// A property storing the cost as an integer (e.g. 500,000 for a building costing $500,000.)
// A property storing the name of the estate agent responsible for selling the building.
// A method for printing the sales summary of the building, describing what it is along with its other properties.

protocol Building {
    var rooms: Int { get }
    var cost: Int { get set }
    var estateAgent: String { get }
    
    func printSalesSummary()
}

extension Building {
    func printSalesSummary() {
        print("This is the default implementation for a building")
    }
}

struct House: Building {
    let rooms: Int
    var cost: Int
    let estateAgent: String
    
    func printSalesSummary() {
        print("This house has \(rooms) rooms and it costs \(cost). The estate agent is \(estateAgent).")
    }
}

struct Office: Building {
    let rooms: Int
    var cost: Int
    let estateAgent: String
    
    func printSalesSummary() {
        print("This office has \(rooms) rooms and it costs \(cost). The estate agent is \(estateAgent).")
    }
}

struct OtherBuilding: Building {
    let rooms: Int
    var cost: Int
    let estateAgent: String
}

let office = Office(rooms: 10, cost: 50000000, estateAgent: "Me")
let house = House(rooms: 5, cost: 1000000, estateAgent: "Bobby")
let other = OtherBuilding(rooms: 2, cost: 100, estateAgent: "Billy")

office.printSalesSummary()
house.printSalesSummary()
other.printSalesSummary()
