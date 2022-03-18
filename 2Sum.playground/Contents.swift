import Foundation

class Solution{
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var seenBefore:[Int:Int] = [Int:Int]()
        
        for (i, n) in nums.enumerated(){
            let compliment = target - n
            
            if let _complement = seenBefore[compliment] {
                return [_complement, i]
            }else{
                seenBefore[n] = i
            }
        }
        return []
    }
}

let solution = Solution()
solution.twoSum([2,7,11,15], 9)


//nums = [2,7,11,15], target = 9 // [0,1]
