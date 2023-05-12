import UIKit

for i in 1...100{
    
    if i.isMultiple(of: 3) && i.isMultiple(of: 5){
        print("FizzBuzz")
        continue
    }else if i.isMultiple(of: 3){
        print("Fizz")
        continue
    } else if i.isMultiple (of: 5) {
        print("FizzBuzz")
        continue
    }
    print(i)
}
