import UIKit

private extension Array where Element == Int {
  func findPositions(n: Int, x: Int) -> [Int] {
    // Write your code here
    return self

    }
}



var array = [1, 2, 2, 3, 4, 5]

array.popLast()
print(array )




//// These are the tests we use to determine if the solution is correct.
//// You can add your own at the bottom.
//
//private var testCaseNumber = 1
//
//private func check(_ expectedValue: [Int], matches output: [Int]) {
//  let rightTick = "\u{2713}"
//  let wrongTick = "\u{2717}"
//
//  let result = expectedValue == output
//  if result {
//    print("\(rightTick) Test #\(testCaseNumber)")
//  } else {
//    print("\(wrongTick) Test #\(testCaseNumber) Expected: \(expectedValue) Your output: \(output)")
//  }
//  testCaseNumber += 1
//}
//
//let arr1 = [1, 2, 2, 3, 4, 5]
//let expected1 = [5, 6, 4, 1, 2]
//let output1 = arr1.findPositions(n: 6, x: 5)
//check(expected1, matches: output1)
//
//let arr2 = [2, 4, 2, 4, 3, 1, 2, 2, 3, 4, 3, 4, 4]
//let expected2 = [2, 5, 10, 13]
//let output2 = arr2.findPositions(n: 13, x: 4)
//check(expected2, matches: output2)
//
//// Add your test cases here
