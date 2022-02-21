import UIKit

class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.count == 0{
            return 0
        }
        var index  = 1
        for i in index..<nums.count{
            if nums[i - 1] != nums[i]{
                nums[index] = nums[i]
                index += 1
            }
        }
        return index
    }
}

let solution = Solution()
var arr:[Int] = [1,1,2]
solution.removeDuplicates(&arr) // [1,2]
