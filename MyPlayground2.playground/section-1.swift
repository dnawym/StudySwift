// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//define method 1
//var optInt:Int?

//define method 2
var optInt:Optional<Int>
println("\(optInt)")

if optInt != nil
{
    println("true")
}
else
{
    println("false")
}


optInt = 32
println("\(optInt!)")

if optInt != nil
{
    println("true")
}
else
{
    println("false")
}

let intvalue = 10
var sum = optInt! + intvalue


//var optStr:String!
var optStr:ImplicitlyUnwrappedOptional<String>
optStr = "10"
optStr

var intFromStr = optStr.toInt()
println("\(intFromStr)")
var intValueFromStr = intFromStr!