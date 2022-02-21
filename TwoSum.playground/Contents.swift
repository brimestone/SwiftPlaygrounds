import UIKit

class Solution {
    func twoSum2(_ nums: [Int], _ target: Int) -> [Int] {
        var map:[Int:Int] = [Int:Int]()
        for (i, n) in nums.enumerated(){
            let diff = target - n
            if map.keys.contains(diff) && map[diff] != i{
                return [i, map[diff]!].sorted()
            }
            map[n] = i
        }
        return []
    }
    
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var seenBefore:Set<Int> = Set<Int>()
        for (i, n) in nums.enumerated(){
            let secondPair = target - n
            if seenBefore.contains(secondPair){
                
                return [i,nums.firstIndex(of: secondPair)!]
            }else{
                seenBefore.insert(n)
            }
        }
        return []
    }
    
    
}

let solution = Solution()
solution.twoSum([2,7,11,15], 9) // [0,1]
solution.twoSum([3,2,4], 6) // [1,2]
solution.twoSum([3,3], 6) // [0,1]

