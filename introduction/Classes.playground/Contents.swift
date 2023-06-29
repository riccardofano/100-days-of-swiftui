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
