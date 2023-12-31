import Cocoa

let platforms = ["iOS", "macOS", "tvOS", "watchOS", "visionOS"]

// for in loops
for os in platforms {
    print("Swift works great on \(os)")
}

// for range loops
// 0...5 = from 0 to and including 5
// 0..<5 = from 0 until and excluding 5
for i in 1...12 {
    print("5 x \(i) = \(5 * i)")
}

// you can use _ to ignore a variable so you don't get an unused variable warning when you don't need it.
for _ in 1...5 {
    print("Hello")
}

var countdown = 10
// while loops
while countdown > 0 {
    print("\(countdown)…")
    countdown -= 1
}

print("Blast off!")

// there's a method on numbers to generate a number in a range
let roll = Int.random(in: 1...6)
let float = Double.random(in: 0..<1)

print(float)

let filenames = ["me.jpg", "work.txt", "sophie.jpg", "logo.psd"]

// continue stops the current loop body execution and goes directly to the next iteration
for filename in filenames {
    if filename.hasSuffix(".jpg") == false {
        continue
    }

    print("Found picture: \(filename)")
}

// break breaks out of the loop entirely
// plenty of languages use these so they're nothing new
let number1 = 4
let number2 = 14
var multiples = [Int]()

for i in 1...100_000 {
    if i.isMultiple(of: number1) && i.isMultiple(of: number2) {
        multiples.append(i)

        if multiples.count == 10 {
            break
        }
    }
}

print(multiples)

