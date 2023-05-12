import UIKit

protocol Building{
    var noOfRoom: Int {get}
    var cost: Int {get set}
    var nameOfAgent: String {get}
    func salesSummary()
    
}

struct House {
    var noOfRoom: Int
    var cost: Int
    var nameOfAgent = "HomeSeller"
    func salesSummary(){
        print("Here is a beautiful house with \(noOfRoom) rooms. The price will be \(cost) and your agent is \(nameOfAgent)")
    }
}

extension House {
    init(noOfRoom: Int){
        self.noOfRoom = noOfRoom
        self.cost = noOfRoom * 100
    }
}

struct Office {
    var noOfRoom: Int
    var cost: Int
    var nameOfAgent = "OfficeSeller"
    func salesSummary(){
        print("Here is a nice office with \(noOfRoom) rooms. The price will be \(cost) and your agent is \(nameOfAgent)")
    }
}

extension Office {
    init(noOfRoom: Int){
        self.noOfRoom = noOfRoom
        self.cost = noOfRoom * 200
    }
}

let house1 = House(noOfRoom: 4)
let office1 = Office(noOfRoom: 8)
house1.salesSummary()
office1.salesSummary()
