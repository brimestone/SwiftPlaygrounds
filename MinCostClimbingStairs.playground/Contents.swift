import UIKit

class Solution {
    func minCostClimbingStairs2(_ cost: [Int]) -> Int {
        var n:Int = 0
        let count = cost.count
        var minCost:Int = 0
        
        while n < count {
            if (count - n) <= 1 {
                return minCost
            }else{
                let i = cost[n]
                let j = cost[n+1]
                
                if i < j {
                    print("Adding \(i)")
                    minCost+=i
                }else{
                    print("Adding \(j)")
                    minCost+=j
                    n+=1
                }
            }
            print(cost[n])
            n+=1
        }
        return minCost
    }
    
    
    func minCostClimbingStairs3(_ cost: [Int]) -> Int {
        guard !cost.isEmpty else { return 0 }
        
        var cost = cost
        var i = 2
        
        while i < cost.count {
            cost[i] += min(cost[i - 1], cost[i - 2])
            i+=1
        }
        return min(cost[cost.count-2], cost[cost.count-1])
        
    }
    
    func minCostClimbingStairs4(_ cost: [Int]) -> Int {
        var dp:[Int] = Array(repeating: -1, count: cost.count)
        dp[0] = cost[0]
        dp[1] = cost[1]
        
        for i in 2..<cost.count{
            dp[i] = cost[i] + min(dp[i-1], dp[i-2])
            print(dp)
        }
        return min(dp[dp.count-1], dp[dp.count-2])
    }
    
    
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        var prev1 = cost[1]
        var prev2 = cost[0]
        for n in 2..<cost.count{
            let tmp = cost[n] + min(prev1, prev2)
            prev2 = prev1
            prev1 = tmp
        }
        return min(prev1, prev2)
    }
}


let solution = Solution()

let cost = [10,15,20]
let cost2 = [1,100,1,1,1,100,1,1,100,1]
let cost3 = [1,15,2]

solution.minCostClimbingStairs(cost)
solution.minCostClimbingStairs(cost2)
solution.minCostClimbingStairs(cost3)

