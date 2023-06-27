import Cocoa

enum SquaringError: Error {
    case outOfBounds, noRoot
}

func integerSquareRoot(_ number: Int) throws -> Int {
    if number < 1 || number > 1000 {
        throw SquaringError.outOfBounds
    }
    
    for i in 2..<32 {
        let square = i * i
        if square > number {
            throw SquaringError.noRoot
        }
        
        if square == number {
            return i
        }
    }
    
    throw SquaringError.noRoot
}

let num = 961
do {
    let result = try integerSquareRoot(num)
    print("The square root of \(num) is \(result).")
} catch SquaringError.noRoot {
    print("\(num) does not have an integer square root.")
} catch SquaringError.outOfBounds {
    print("\(num) does not fall within the 1 to 1000 range.")
}
