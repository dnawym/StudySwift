// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

println(str)

var myVariable = 42
myVariable = 50
let myConstant = 42

let implicitInteger = 70
let implicitDouble = 10.1
let explicitDouble: Double = 70

let label = "the width is"
let width = 94
let widthLabel = label + String(width)

let apples = 3
let oranges = 5

let appleSummary = "I have \(apples) apples."

var shoppingList = ["cat", "water", "tulips", "blue paint"]

for name in shoppingList
{
    println(name)
}

shoppingList[1] = "bootle of water"

var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic",
]
occupations["jayne"] = "Public Relations"

let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores
{
    if (score > 50)
    {
        teamScore += 3
    }
    else
    {
        teamScore += 1
    }
}

teamScore


var optionalString: String? = "Hello"
optionalString == nil

var optionalName: String? = "John"
optionalName = nil
var greeting = "Hello!"
if let name = optionalName
{
    greeting = "Hello, \(name)"
}

let vegetable = "red pepper"
switch vegetable
{
    case "celery":
        let vegetableComment = "Add some"
    case "cucumber", "watercress":
        let vegetableComment = "That would"
    case let x where x.hasSuffix("pepper"):
        let vegetableComment = "Is it a spicy \(x)?"
    default:
        let vegetableComment = "Everything tastes good"
}

let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]

var largest = 0
for (kind, numbers) in interestingNumbers{
    for number in numbers{
        if (number > largest)
        {
            largest = number
        }
    }
}

largest

var n = 2
while n < 100 {
    n = n * 2
}
n

var m = 2
do {
    m = m * 2
} while m < 100
m

//var firstForLoop = 0
//for var i in 0..3{
//    firstForLoop += i
//}
//firstForLoop

var secondForLoop = 0
for var i = 0; i < 3; ++i{
    secondForLoop += 1
}
secondForLoop

func greet(name: String, day: String) ->String{
    return "Hello \(name), today is \(day)."
}

greet("bob", "Tue.")

func getGasPrices()->(Double, Double, Double)
{
    return (3.59, 3.69, 3.79)
}
getGasPrices()

func sumOf(numbers: Int...)->Int{
    var sum = 0
    for number in numbers{
        sum+=number
    }
    return sum
}

sumOf()

sumOf(42, 597, 12)

func returnFifteen()->Int{
    var y = 10
    func add(){
        y += 5
    }
    add()
    return y
}

returnFifteen()

func hasAnyMatchs(list: [Int], condition: Int->Bool) ->Bool{
    for item in list{
        if condition(item) {
            return true
        }
    }
    return false
}

func lessThanTen(number: Int) -> Bool
{
    return number < 10
}

var numbers = [20, 19, 7, 12]
hasAnyMatchs(numbers, lessThanTen)

class Shape{
    var numberOfSides = 0
    var name: String
    
    init(name:String)
    {
        self.name = name
    }
    func simpleDescription() -> String{
        return "A shape with \(numberOfSides) sides."
    }
}

var shape = Shape(name: "cicle")
shape.numberOfSides = 7
shape.simpleDescription()

class Square: Shape{
    var sideLength: Double
    init(sideLength: Double, name: String){
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    func area()->Double{
        return sideLength * sideLength
    }
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)"
    }
}

let test = Square(sideLength: 5.2, name: "my test square")
test.area()
test.simpleDescription()

for index in 1...5
{
    println("\(index) * 5 = \(index * 5)")
}

var answer = 1
var base = 3
var power = 10
for _ in 1...power
{
    answer *= base
}

answer

var someC:Character = "c"

switch someC
{
case "a", "c":
    println("a to c")
    fallthrough
case "e":
    println("fall to e")
case	"f", "g":
    println("f to g")
default:
    break
}

let count = 3_000_000_000_000


let somePoint = (1, 1)
switch somePoint{
case (0, 0):
    println("(0, 0)")
case (_, 0):
    println("(X, 0)")
case (0, _):
    println("(0, X)")
default:
    println("default")
}

let anotherPoint = (2, 1)
switch anotherPoint{
case (let x, 2):
    println("(\(x), 2)")
case (-2...2, -2...2):
    println("inside -2...2")
case (let x, let y):
    println("(\(x), \(y))")
default:
    break
}

let aPoint = (-1, 1)

switch aPoint{
case (let x, let y) where x == y:
    println("x == y")
    break
case (let x, let y) where x == -y:
    println("x == -y")
default:
    break
}























