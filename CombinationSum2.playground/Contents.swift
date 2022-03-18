import Foundation


class Solution {
    var combinations:[[Int]] = [[Int]]()
    var hashMap:[[Int]:Bool] = [[Int]:Bool]()
    
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        guard !candidates.isEmpty else { return [] }
        
        for (i, _) in candidates.enumerated(){
            dfs(candidates, target, i)
        }
        return combinations
    }
    func dfs(_ candidates: [Int],_ target:Int,_ index:Int,_ curr:[Int] = []){
        if target <= 0{
            if target == 0{
                if hashMap[curr] == nil{
                    hashMap[curr] = true
                    self.combinations.append(curr)
                }
            }
            return
        }
        if index <  candidates.count{
            var newCurr = curr
            newCurr.append(candidates[index])
            dfs(candidates, target - candidates[index], index, newCurr)
            newCurr.popLast()
            dfs(candidates, target, index+1, newCurr)
        }
    }
}


let solution = Solution()

solution.combinationSum([2,3,6,7], 7) // [[2,2,3],[7]]
