import UIKit

class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var notTarget:Int = 0
        var idx:Int = 0
        
        while idx < nums.count{
            if nums[idx] != val{
                notTarget+=1
                idx+=1
            }else{
                nums.remove(at: idx)
            }
        }
        return notTarget
    }
}

let solution = Solution()
var nums:[Int] = [0,1,2,2,3,0,4,2]
solution.removeElement(&nums, 2) // 5

print(nums)

var nums2:[Int] = [3,2,2,3]
solution.removeElement(&nums2, 3) // 2

print(nums2)

