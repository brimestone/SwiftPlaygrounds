import UIKit

class Solution {
    func maxSubArray2(_ nums: [Int]) -> Int {
        // O(n^2)
        if nums.count < 1{
            return 0
        }
        
        var highestSum:Int = nums[0]
        var i = 0
        var j = 0
        
        while i < nums.count{
            j = i
            while j < nums.count{
                let subArray = nums[i...j]
                let sum = subArray.reduce(0, +)
                if highestSum < sum {
                    
                    highestSum = sum
                }
                j+=1
            }
            i+=1
        }
        return highestSum
    }
    
    func maxSubArray(_ nums: [Int]) -> Int {
        if nums.count < 1{
            return 0
        }
        var preSum = 0
        var highestSum:Int = nums[0]
        
        for n in nums{
            if preSum < 0{
                preSum = 0
            }
            preSum+=n
            if highestSum < preSum{
                print(highestSum, preSum)
                highestSum = preSum
            }
            
        }
        return highestSum
    }
}

/**
 [-2, 1, -3, 4, -1, 2, 1, -5, 4 ]
   i
 */


let solution = Solution()
solution.maxSubArray([-2,1,-3,4,-1,2,1,-5,4]) // 6
solution.maxSubArray([1]) // 1
solution.maxSubArray([5,4,-1,7,8]) //23


//let midpoint = absences.count / 2
//
//let firstHalf = absences[..<midpoint]
//let secondHalf = absences[midpoint...]
