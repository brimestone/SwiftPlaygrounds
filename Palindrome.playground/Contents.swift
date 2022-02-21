import UIKit


class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        return (String(x) == String(String(x).reversed())) ? true : false
    }
}

let solution = Solution()
solution.isPalindrome(-121)
// 121 true
// -121 false
// 10
