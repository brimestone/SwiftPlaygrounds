import UIKit

class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        guard !nums.isEmpty else { return -1 }
        guard k <= nums.count else { return -1 }
        return Array(nums.sorted().reversed())[k-1]
    }
}


let solution = Solution()
solution.findKthLargest([3,2,1,5,6,4], 2) // 5
solution.findKthLargest([3,2,3,1,2,4,5,5,6], 4) //4
