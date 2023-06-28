import Cocoa

struct Car {
    let model: String
    let numberOfSeats: Int
    private(set) var currentGear: Int = 1 {
        didSet {
            print("You're now in gear \(currentGear)")
        }
    }
    
    mutating func downShift() {
        if currentGear <= 1 {
            print("You're already in the lowest gear")
            return
        }
        currentGear -= 1
    }
    
    mutating func upShift() {
        if currentGear >= 6 {
            print("You're already in the highest gear")
            return
        }
        currentGear += 1
    }
}

var panda = Car(model: "Fiat Panda", numberOfSeats: 5)
print(panda)

panda.upShift()
panda.downShift()
panda.downShift()
