import UIKit


func plusMinus(arr: [Int]) -> Void {
    var possitive:Int = 0, negative:Int = 0, zero:Int = 0
    
    for value in arr{
        if value == 0{
            zero += 1
        }else if value < 0{
            negative += 1
        }else if value > 0{
            possitive += 1
        }
    }
    for n in [possitive, negative, zero]{
        print(String(format: "%.6f", Double(n) / Double(arr.count)))
    }
}

plusMinus(arr: [1,1,0,-1,-1])
// [1,1,0,-1,-1]
/*
     0.400000
     0.400000
     0.200000
 */

// -4 3 -9 0 4 1
/*
     0.500000
     0.333333
     0.166667
 */
