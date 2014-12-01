// Playground - noun: a place where people can play

import UIKit

let canvas = UIView(frame: CGRectMake(0, 0, 200, 200))
canvas.backgroundColor = UIColor.blueColor()

let title = UILabel(frame: CGRectMake(50, 50, 100, 20))
title.text = "My Label"
title.textColor = UIColor.whiteColor()
title.textAlignment = NSTextAlignment.Center

canvas.addSubview(title)

let button = UIButton(frame: CGRectMake(50, 100, 100, 50))
button.backgroundColor = UIColor.whiteColor()
button.setTitle("My Button", forState: UIControlState.Normal)
button.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)

button.layer.cornerRadius = 10
button.layer.shadowColor = UIColor.blackColor().CGColor
button.layer.shadowOpacity = 1.1
button.layer.shadowOffset = CGSizeMake(10, 10)
button.layer.shadowRadius = 10

canvas.addSubview(button)

var colors = ["red", "green", "blue"]
colors[2]

var shot = [["title", "Shot 1"],["title", "Shot 2"]]
shot[0]
shot[1]