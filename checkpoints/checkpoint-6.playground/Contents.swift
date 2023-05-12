import UIKit

struct Car {
    let model: String
    let noOfSeats: Int
    private(set) var currentGear: Int = 1 { // can read outside struct but only write inside
        didSet{
            print("The current Gear is \(currentGear)")
        }
    }
    
    mutating func shiftUp() {
        if currentGear + 1 <= 10{
            currentGear += 1
        } else {
            print("You are already in the top gear!")
        }
    }
    
    mutating func shiftDown(){
        if currentGear - 1 >= 0{
            currentGear -= 1
        } else {
            print("You are already in the lowest gear!")
        }
    }
    
}

var mycar = Car(model: "HondaCity", noOfSeats: 5)
mycar.shiftUp()
mycar.shiftUp()
mycar.shiftDown()
mycar.shiftUp()
mycar.shiftUp()



