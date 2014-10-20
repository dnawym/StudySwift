// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

println(str)

var str2: String?

str2 = "Hello optional"

if let unwrappedString = str2 {
    println("\(unwrappedString.uppercaseString)")
}

println("force unwrapp \(str2!.uppercaseString)")

var str3: String! = "implicity"

if str3 != nil {
println("implicity unwrapp \(str3.uppercaseString)")
}

var maybestring: String?
let uppercase = maybestring?.uppercaseString
