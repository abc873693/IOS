//: Playground - noun: a place where people can play

import UIKit

struct Point{
    var x = 0.0 , y = 0.0
}

struct Size{
    var width = 30.0 , heigh = 30.0
}

struct Square{
    var origin = Point()
    var size:Size{
        get{
            return Size(width:self.size.width,heigh:self.size.heigh)
        }
        set(newsize){
            if newsize.width >= newsize.heigh{
                size.width = newsize.heigh
                size.heigh = newsize.heigh
            }else {
                size.width = newsize.width
                size.heigh = newsize.width
            }
        }
    }
}

var p = Point(x:10.0,y:20.0)
var s = Size(width:50.0 , heigh:100.0)

var square = Square()

if let first = Int("4"), let second = Int("42"),first < second && second < 100 {
    print("\(first) < \(second) < 100")
}