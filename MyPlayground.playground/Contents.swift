import UIKit

func digitalRoot(of number: Int) -> Int {
    String(number).reduce(0, +) { partialResult, char in
        
        partialResult += Int(char)
    }
    return number
}
