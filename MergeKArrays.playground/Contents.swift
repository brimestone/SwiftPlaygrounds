import UIKit


func mergeArraySorted(_ arrays:[[Int]])->[Int]{
    var finalArray:[Int] = [Int]()
    
    for array in arrays{
        for element in array{
            finalArray.append(element)
        }
    }
    return finalArray.sorted()
}

let array = [
    [1,2,3,4,5],
    [2,3,4,5,6,7,8],
    [1,2,3,4]
]

print("Merged sorted array \(mergeArraySorted(array))")
