import UIKit

class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.count == 0 {
            return ""
        }
        
        var shortestString = strs.min{$0.count < $1.count}!
        for n in strs{
            while shortestString != n.prefix(shortestString.count){
                shortestString.removeLast()
            }
        }
        return shortestString
    }
}


let solution = Solution()
solution.longestCommonPrefix(["flower","flow","flight"]) // "fl"



solution.longestCommonPrefix(["dog","racecar","car"]) // ""


