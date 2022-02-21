import UIKit

// https://www.youtube.com/watch?v=GNNzTWedUrs&ab_channel=iOSAcademy
// O(log n) and O(1) if the seek value is in the middle of the array.


func binarySearch(_ array:[Int], _ value: Int)->Int?{
    guard !array.isEmpty else{
        return nil
    }

    var left:Int = 0
    var right:Int = array.count - 1

    while left <= right {
        let middleIndex = (left + right) / 2
        let middleValue = array[middleIndex]
        
        if middleValue > value {
            right = middleIndex - 1
        }else if middleValue < value {
            left = middleIndex + 1
        }else if middleValue == value{
            return middleIndex
        }
    }
    
    return nil
}

let array = [1,3,4,5,12,13,22,31,72]
let searchFor = 3

print("\(binarySearch(array, searchFor) ?? -1)")
