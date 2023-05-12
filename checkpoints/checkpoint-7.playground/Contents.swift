import UIKit

class Animal {
    var legs: Int
    
    init(legs: Int){
        self.legs = legs
    }
}

class Dog: Animal{
    func speak(){
        print("Bark Bark with \(legs) legs")
    }
}

class Cat: Animal{
    var isTame: Bool
    
    init(legs: Int, isTame: Bool){
        self.isTame = isTame
        super.init(legs: legs)
    }
    
    func speak(){
        print("Meww")
    }
}

class Corgi: Dog{
    override func speak(){
        print("Wau I am a Corgi with \(legs) legs")
    }
}

class Poodle: Dog{
    override func speak(){
        print("Wau I am a Poodle with \(legs) legs")
    }
}

class Persian: Cat{
    override func speak(){
        print("Miau I am a persian with \(legs) legs and isTame = \(isTame)")
    }
}

class Lion: Cat{
    override func speak(){
        print("Mizz I am a lion with \(legs) legs and isTame = \(isTame)")
    }
}

let poodle = Poodle(legs: 6)
poodle.speak()
let lion = Lion(legs: 4, isTame: false)
lion.speak()
