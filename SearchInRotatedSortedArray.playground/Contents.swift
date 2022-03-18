import Foundation


class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        guard !nums.isEmpty else { return -1 }
        
        var start = 0
        var end = nums.count-1
        
        while start <= end {
            let mid = start + (end - start)/2
            let midVal = nums[mid]
            
            if midVal == target { return mid }
            
            if midVal >= nums[start] {
                if midVal > target && target >= nums[start]{
                    end = mid - 1
                }else{
                    start = mid + 1
                }
            }else{
                if midVal < target && target <= nums[end]{
                    start = mid + 1
                }else{
                    end = mid - 1
                }
            }
        }
        return -1
    }
}


let solution = Solution()
solution.search([1,2,3,4,5,6,7], 5)
solution.search([4,5,6,7,0,1,2], 1)
solution.search([3,5,1], 1)
solution.search([4,5,6,7,8,1,2,3], 8)
