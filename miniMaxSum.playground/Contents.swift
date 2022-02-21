import UIKit

func miniMaxSum(arr: [Int]) -> Void {
    let sortedArr = arr.sorted()
    print(sortedArr[0..<sortedArr.count-1].reduce(0,+), sortedArr[1...].reduce(0,+))
}
miniMaxSum(arr: [1,3,5,7,9])  // 16 24

