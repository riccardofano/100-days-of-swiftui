import Cocoa

for i in 1...100 {
    switch (i.isMultiple(of: 3), i.isMultiple(of: 5)) {
    case (true, true):
        print("FizzBuzz")
    case(false, true):
        print("Buzz")
    case(true, false):
        print("Fizz")
    case(false, false):
        print(i)
    }
}
