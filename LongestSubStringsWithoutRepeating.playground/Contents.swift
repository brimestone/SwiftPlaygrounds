import Foundation

class Solution {
    func lengthOfLongestSubstring2(_ s: String) -> Int {
        guard !s.isEmpty else { return 0 }
        guard s.count > 1 else { return 1 }
        
        var map:[String:Bool] = [String:Bool]()
        var maxSubstring:Int = 0
        var currMax:Int = 0
        var R:Int=0
        var L:Int=0
        
        while L < s.count{
            if let _ = map[String(s[String.Index(encodedOffset: L)])]{
                currMax = 0
                L = R+1
                R+=1
                map = [String:Bool]()
            }else{
                currMax+=1
                map[String(s[String.Index(encodedOffset: L)])] = true
                L+=1
            }
            maxSubstring = max(currMax, maxSubstring)
        }
        return maxSubstring
    }
    
    
    func lengthOfLongestSubstring(_ s: String) -> Int {
        guard !s.isEmpty else { return 0 }
        guard s.count > 1 else { return 1 }
        var hashMap:[String:Int] = [String:Int]()
        var absoluteMax:Int = 0
        var currentMax:Int = 0
        var leftptr:Int = 0
        var rightptr:Int = 0
        
        while rightptr < s.count{
            let n = String(s[s.index(s.startIndex, offsetBy: rightptr)])
            if let seenBeforeIndex = hashMap[n]{
                if seenBeforeIndex >= leftptr {
                    leftptr = seenBeforeIndex+1
                }
                hashMap[n] = rightptr
            }else{
                hashMap[n] = rightptr
            }
            rightptr+=1
            currentMax = rightptr - leftptr
            absoluteMax=max(absoluteMax, currentMax)
        }
        return absoluteMax
    }
    func lengthOfLongestSubstring3(_ s: String) -> Int {
        guard !s.isEmpty else { return 0 }
        guard s.count > 1 else { return 1 }
        
        var maxLength = 0
        var temp = [Character]()
        let charArray = Array(s)
        temp.append(charArray[0])
        
        for i in 1...charArray.count-1{
            
            if let index = temp.firstIndex(of: charArray[i]){
                temp.removeFirst(index+1)
            }
            temp.append(charArray[i])
            maxLength = max(maxLength, temp.count)
            
        }
        return maxLength
    }
}


let solution = Solution()

solution.lengthOfLongestSubstring("abcbdaac") // 4
solution.lengthOfLongestSubstring("abcabcbb") // 3
solution.lengthOfLongestSubstring("bbbbb") // 1
solution.lengthOfLongestSubstring("au") // 2
solution.lengthOfLongestSubstring("dvdf") // 3
solution.lengthOfLongestSubstring("pwwkew") // 3



// [ d, v, d, f ]
//      L     R
// currmax: 2
// absmax: 2
