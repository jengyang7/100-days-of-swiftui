import UIKit

func getRandomInt(_ intArray: [Int]?) -> Int {
    intArray?.randomElement() ?? Int.random(in: 1...100)
}

print(getRandomInt([3,7,18,24]))
//print(getRandomInt([3,7,18,24]))

