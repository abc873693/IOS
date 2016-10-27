//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

struct hd{
    var width = 0
    var height = 0
}

let h = hd(width:1920,height:1080)
var fh = h
fh.width = 2048
//h.width = 1040
print(fh.width)
print(h.width)

struct Celsius {
    var temperatureInCelsius: Double
    init( fromFahrenheit fahrenheit: Double ) {
        temperatureInCelsius = ( fahrenheit - 32.0 ) / 1.8
    }  // called by Celsius( fromFahrenheit: 212.0 )
    init( fromKelvin kelvin: Double ) {
        temperatureInCelsius = kelvin - 273.15
    }
    init( fromCelsius celsius: Double ) {
        temperatureInCelsius = celsius
    }
}
var c = Celsius(fromKelvin:11.0)
print(c.temperatureInCelsius)