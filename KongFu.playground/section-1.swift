// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class Attribute
{
    init(attr: String, critical: [String], weak: [String], noEffect: String)
    {
        m_attr = attr
        m_critical = critical
        m_weak = weak
        m_noEffect = noEffect
    }
    
    var m_attr: String
    var m_critical: [String]
    var m_weak: [String]
    var m_noEffect: String
}

var wood = Attribute(attr: "wood", critical: ["fire", "ice"], weak: ["wood", "earth"], noEffect: "water")
var earth = Attribute(attr: "earth", critical: ["wood", "wind"], weak: ["earth", "dark"], noEffect: "light")
var fire = Attribute(attr: "fire", critical: ["earth", "water"], weak: ["fire", "wind"], noEffect: "wood")
var ice = Attribute(attr: "ice", critical: ["fire", "dark"], weak: ["ice", "light"], noEffect: "wind")
var light = Attribute(attr: "light", critical: ["earth", "ice"], weak: ["light", "water"], noEffect: "dark")
var water = Attribute(attr: "water", critical: ["wood", "light"], weak: ["water", "ice"], noEffect: "fire")
var wind = Attribute(attr: "wind", critical: ["water", "dark"], weak: ["wind", "fire"], noEffect: "earth")
var dark = Attribute(attr: "dark", critical: ["light", "wind"], weak: ["dark", "wood"], noEffect: "ice")
var universe = Attribute(attr: "universe", critical: ["universe"], weak: ["physical"], noEffect: "")

var attributesArray = [Attribute]()
attributesArray.append(wood)
attributesArray.append(earth)
attributesArray.append(fire)
attributesArray.append(ice)
attributesArray.append(light)
attributesArray.append(water)
attributesArray.append(wind)
attributesArray.append(dark)
attributesArray.append(universe)

func getCriticalForAttribute(attributeString: String) -> [String]
{
    for attr in attributesArray
    {
        if attr.m_attr == attributeString
        {
            return attr.m_critical
        }
    }
    
    return []
}

getCriticalForAttribute("wood")
getCriticalForAttribute("1")
