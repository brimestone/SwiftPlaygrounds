import Foundation


class Solution {
    func trap2(_ height: [Int]) -> Int {
        guard height.count > 1 else { return 0 }
        
        var left:Int = 0
        var right:Int = height.count-1
        var max_left:Int = 0
        var max_right:Int = 0
        var totalArea:Int = 0
        
        while left < right {
            if height[left] < height[right] {
                if height[left] >= max_left {
                    max_left = height[left]
                }else{
                    totalArea+=max_left - height[left]
                }
                left+=1
            }else{
                if height[right] >= max_right {
                    max_right = height[right]
                }else{
                    totalArea+=max_right - height[right]
                }
                right-=1
            }
        }
        return totalArea
    }
    func trap(_ height: [Int]) -> Int {
        guard height.count > 1 else { return 0 }
        var totalWater:Int = 0
        var maxL:Int = 0
        var maxR:Int = 0
        
        var left = 0
        var right = height.count-1
        
        while left < right {
            var currWater:Int = 0
            
            if height[left] < height[right] {
                if maxL < height[left] {
                    maxL = height[left]
                }else{
                    currWater = maxL - height[left]
                    totalWater += currWater > 0 ? currWater : 0
                }
                left+=1
            }else{
                if maxR < height[right]{
                    maxR = height[right]
                }else{
                    currWater = maxR - height[right]
                    totalWater += currWater > 0 ? currWater : 0
                }
                right-=1
            }
        }
        return totalWater
    }
}
    
let solution = Solution()
    
solution.trap([0,1,0,2,1,0,3,1,0,1,2])
