import UIKit

class Solution {
    func sortArrayByParity(_ nums: [Int]) -> [Int] {
        var resultNums = nums
        if nums.count == 0 {
            return []
        }
        if nums.count == 1{
            return nums
        }
        var i:Int = 0
        var j:Int = resultNums.count-1
        
        while i < j{
            let i_even = (resultNums[i] % 2) == 0 ? true : false
            let j_even = (resultNums[j] % 2) == 0 ? true : false
            
            if !i_even && j_even{
                let tmp = resultNums[j]
                resultNums[j] = resultNums[i]
                resultNums[i] = tmp
                i+=1
                j-=1
            }else if i_even && !j_even || !i_even && !j_even{
                j-=1
            }else{
                i+=1
            }
        }
        return resultNums
    }
}

let solution = Solution()
solution.sortArrayByParity([3,1,2,4])  // [2,4,3,1]
solution.sortArrayByParity([])
solution.sortArrayByParity([0])
solution.sortArrayByParity([0,0])
solution.sortArrayByParity([1,3])
solution.sortArrayByParity([1,0,3]) // 013



