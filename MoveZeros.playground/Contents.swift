import UIKit

class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        
        for i in stride(from: nums.count-1, to: -1, by: -1){
            if nums[i] == 0 && i < nums.count-1{
                let zero = nums[i]
                nums.remove(at: i)
                nums.append(zero)
            }
        }
    }
}
let solution = Solution()

var nums:[Int] = [0,1,0,3,12] // [1,3,12,0,0]
solution.moveZeroes(&nums)
print(nums)

nums = [0,0,1] // [1,0,0]
solution.moveZeroes(&nums)
print(nums)


