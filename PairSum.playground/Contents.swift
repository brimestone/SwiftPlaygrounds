import UIKit

func numberOfWays2(arr: [Int], k: Int) -> Int {
    var map:[Int:Int] = [Int:Int]()
    var goodPairs:Int = 0
    
    for (i, n) in arr.enumerated(){
        map[n] = i
    }
    for (i, n) in arr.enumerated(){
        let diff = k - n
        
        if let candidate = map[diff]{
            if candidate != i{
                goodPairs+=1
                print("found \(diff) in \(map.keys) \(diff) + \(n)")
            }
            
        }
    }
    // Write your code here
    return goodPairs
    
}

func numberOfWays(arr: [Int], k: Int) -> Int {
    var goodPairs:Int = 0
    
    for i in 0..<arr.count{
        for j in i+1..<arr.count{
            if arr[i] + arr[j] == k {
                goodPairs+=1
            }
        }
    }
    return goodPairs
}










// These are the tests we use to determine if the solution is correct.
// You can add your own at the bottom.

var test_case_number = 1
func check(expected: Int, output: Int) {
    let result = expected == output
    let rightTick = "\u{2713}"
    let wrongTick = "\u{2717}"
    if result {
        print("\(rightTick) Test #\(test_case_number)")
    } else {
        print("\(wrongTick) Test # \(test_case_number): Expected [\(expected)] Your output: [\(output)]")
    }
    test_case_number += 1
}

// Call numberOfWays() with test cases here
let arr1 = [ 1, 2, 3, 4, 3]
let k1 = 6
check(expected: 2, output: numberOfWays(arr: arr1, k: k1))

let arr2 = [ 1, 5, 3, 3, 3]
let k2 = 6
check(expected: 4, output: numberOfWays(arr: arr2, k: k2))
