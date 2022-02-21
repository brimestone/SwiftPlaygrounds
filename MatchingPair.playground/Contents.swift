import UIKit

/*
 Matching Pairs
 Given two strings s and t of length N, find the maximum number of possible matching pairs in strings s and t after swapping exactly two characters within s.
 A swap is switching s[i] and s[j], where s[i] and s[j] denotes the character that is present at the ith and jth index of s, respectively. The matching pairs of the two strings are defined as the number of indices for which s[i] and t[i] are equal.
 Note: This means you must swap two characters at different indices.
 Signature
 int matchingPairs(String s, String t)
 Input
 s and t are strings of length N
 N is between 2 and 1,000,000
 Output
 Return an integer denoting the maximum number of matching pairs
 Example 1
 s = "abcd"
 t = "adcb"
 output = 4
 Explanation:
 Using 0-based indexing, and with i = 1 and j = 3, s[1] and s[3] can be swapped, making it  "adcb".
 Therefore, the number of matching pairs of s and t will be 4.
 Example 2
 s = "mno"
 t = "mno"
 output = 1
 Explanation:
 Two indices have to be swapped, regardless of which two it is, only one letter will remain the same. If i = 0 and j=1, s[0] and s[1] are swapped, making s = "nmo", which shares only "o" with t.

*/
func matchingPairs(s: String, t: String) -> Int {
  // Write your code here
    let sArr:[Character] = Array(s)
    var maxPair:Int = 0
    
    for (i, _) in sArr.enumerated(){
        for j in i+1..<sArr.count{
            var newArr = sArr
            let tmp = newArr[j]
            newArr[j] = newArr[i]
            newArr[i] = tmp
            
            let countMatch = countMatch(s: String(newArr), t: t)
            if countMatch >= maxPair{
                maxPair = countMatch
            }
        }
    }
    return maxPair
}
func countMatch(s: String, t: String) -> Int {
    
    let sArr = Array(s)
    let tArr = Array(t)
    var pair:Int = 0
    
    for i in stride(from: 0, to: s.count, by: 1){
        if sArr[i] == tArr[i]{
            pair+=1
        }
    }
    print(s, t, pair)
    return pair
}


matchingPairs(s: "abcd", t: "adcb") // 4
matchingPairs(s: "mno", t: "mno") // 1


