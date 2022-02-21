import UIKit
import CoreFoundation
import Darwin

class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var seenBefore:[Int:Bool] = [Int:Bool]()
        
        for n in nums{
            if let _ = seenBefore[n]{
                return true
            }else{
                seenBefore[n] = true
            }
        }
        
        return false
    }
}

let solution = Solution()
solution.containsDuplicate([1,2,3,1]) // true
solution.containsDuplicate([1,2,3,4]) // false
solution.containsDuplicate([1,1,1,3,3,4,3,2,4,2]) //true


