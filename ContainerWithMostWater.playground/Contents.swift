import Foundation

class Solution {
    func maxArea(_ height: [Int]) -> Int {
            guard height.count > 1 else { return 0 }
            
            var maxArea:Int = 0
            var left:Int = 0
            var right:Int = height.count-1
            
            while left < right{
                let h = min(height[left], height[right])
                let w = right - left
                maxArea = max((w*h), maxArea)
                if height[left] > height[right]{
                    right-=1
                }else{
                    left+=1
                }
            }
            return maxArea
        }

}

let solution = Solution()
solution.maxArea([1,8,6,2,5,4,8,3,7]) // 49
