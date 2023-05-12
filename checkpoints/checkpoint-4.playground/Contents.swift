import UIKit

enum SquareRootError: Error {
    case outOfBounds, noRoot
}

func squareRoot(for num: Int = 0) throws -> Int{
    
    if num<1 && num>10000 {
        throw SquareRootError.outOfBounds
    }
    
    for i in 1...100{
        if i * i == num {
            return i
        }
    }
    
    throw SquareRootError.noRoot
}

var inputNumber = 10000

do {
    print("The square root of number \(inputNumber) is \(try squareRoot(for: inputNumber)).")
} catch SquareRootError.outOfBounds{
    print("The input number is out of bounds.")
} catch SquareRootError.noRoot{
    print("There is no root for this number.")
} catch{
    print("There was an error.")
}
