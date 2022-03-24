import Foundation
                                                                        
class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        var targetIndex = nums.count-1
        
        for n in stride(from: nums.count-2, to: -1, by: -1){
            if (nums[n]+n) >= targetIndex {
                targetIndex = n
            }
        }
        if targetIndex < 1{
            return true
        }else{
            return false
        }
    }
}

let solution = Solution()
solution.canJump([2,3,1,1,4]) // true
solution.canJump([3,2,1,0,4]) // false
solution.canJump([2,0]) // true


