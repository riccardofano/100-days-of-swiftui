import Cocoa

class Animal {
    let legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
}

class Dog: Animal {
    init() {
        super.init(legs: 4)
    }
    
    func speak() {
        print("Bark bark")
    }
}

class Cat: Animal {
    var isTame: Bool
    
    init(isTame: Bool) {
        self.isTame = isTame
        super.init(legs: 4)
    }
    
    func speak() {
        print("Meow!")
    }
}

class Corgi: Dog {
    override func speak() {
        print("Bork bork")
    }
}

class Poodle: Dog {
    override func speak() {
        print("Bau bau")
    }
}

class Persian: Cat {
    init() {
        super.init(isTame: true)
    }
    
    override func speak() {
        print("Miao")
    }
}

class Lion: Cat {
    init() {
        super.init(isTame: false)
    }
    
    override func speak() {
        print("ROAR!")
    }
}

