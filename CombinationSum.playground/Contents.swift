import UIKit

class Solution {
    var combinations:[[Int]] = [[Int]]()
    var hashMap:[[Int]:Bool] = [[Int]:Bool]()
    
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        if candidates.isEmpty{
            return []
        }
        for (idx, _) in candidates.enumerated(){
            dfs(candidates, target, idx, [])
        }
        print(combinations)
        return combinations
    }
    
    func dfs(_ candidates: [Int],_ target:Int,_ index:Int,_ curr:[Int]){
        if target <= 0{
            if target == 0{
                if let _ = hashMap[curr] {
                    hashMap[curr] = true
                }else{
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
class Solution2 {
    // Combination Sum II
    var combinations:[[Int]] = [[Int]]()
    var hashMap:[[Int]:Bool] = [[Int]:Bool]()
    
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        self.combinations = [[Int]]()
        self.hashMap = [[Int]:Bool]()
        var path: [Int] = []
        var result: [[Int]] = []
        dfs(&result, &path, candidates.sorted(), target)
        return result
    }
    private func dfs(_ res: inout [[Int]], _ path: inout [Int], _ cands: [Int], _ t: Int, _ idx: Int = 0) {
        guard t > 0 else {
            if let _ = hashMap[path] {
                hashMap[path] = true
            }else{
                hashMap[path] = true
                res.append(path)
            }
            return
        }
        for k in idx..<cands.count where cands[k] <= t {
            if k > 0 && cands[k] == cands[k-1] && k != idx { continue }
            path.append(cands[k])
            dfs(&res, &path, cands, t - cands[k], k + 1)
            path.removeLast()
        }
    }
}
let solution = Solution()
solution.combinationSum([2,3,5], 8) // [ [2,2,2,2], [3,5] ]

let solution2 = Solution2()
solution2.combinationSum2([1,2,2,2,5], 5)
solution2.combinationSum2([10,1,2,7,6,1,5], 8) // [[1,1,6],[1,2,5],[1,7],[2,6]]
// Edge Case
solution2.combinationSum2([1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1], 30)

