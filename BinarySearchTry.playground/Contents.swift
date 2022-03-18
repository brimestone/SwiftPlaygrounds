import Foundation

class Solution{
    func search(_ array:[Int],_ target:Int)->Int{
        guard !array.isEmpty else { return -1 }
        
        var left = 0
        var right = array.count - 1
        
        while left <= right{
            let mid = left + ((right - left) / 2)
            let midValue = array[mid]
            if midValue == target { return mid }
            
            if target > array[mid]{
                left = mid+1
            }else{
                right = mid-1
            }
        }
        return -1
    }
}


let solution = Solution()
solution.search([1,2,3,4,5,6,7], 10)
