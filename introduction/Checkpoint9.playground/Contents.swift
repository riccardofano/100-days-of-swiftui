import Cocoa

func randomNumber(array: [Int]?) -> Int {
    array?.randomElement() ?? Int.random(in: 1...100)
}

let array = [1,2,3,4,5,6]
let nilArray: [Int]? = nil
print(randomNumber(array: array))
print(randomNumber(array: nilArray))
print(randomNumber(array: array))
print(randomNumber(array: nilArray))
print(randomNumber(array: array))
print(randomNumber(array: nilArray))
print(randomNumber(array: array))
print(randomNumber(array: nilArray))
print(randomNumber(array: array))
print(randomNumber(array: nilArray))
print(randomNumber(array: array))
print(randomNumber(array: nilArray))
