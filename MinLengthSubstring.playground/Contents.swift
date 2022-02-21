import UIKit

/**
 You are given two strings s and t. You can select any substring of string s and rearrange the characters of the selected substring. Determine the minimum length of the substring of s such that string t is a substring of the selected substring.
 Signature
 int minLengthSubstring(String s, String t)
 Input
 s and t are non-empty strings that contain less than 1,000,000 characters each
 Output
 Return the minimum length of the substring of s. If it is not possible, return -1
 Example
 s = "dcbefebce"
 t = "fd"
 output = 5
 Explanation:
 Substring "dcbef" can be rearranged to "cfdeb", "cefdb", and so on. String t is a substring of "cfdeb". Thus, the minimum length required is 5.
 */

extension String {
    func minLengthOfRearrangedSubstring(containing substring: String) -> Int {
        let sArr:[String.Element] = Array(self)
        let tArr:[String.Element] = Array(substring)
        var window:[Int] = [Int]()
        var returnValue:Int = Int()
 
        for n in tArr{
            if let index = sArr.firstIndex(of: n){
                window.append(index)
            }else{
                return -1
            }
        }
        let sortedWindow = window.sorted()
        for _ in sortedWindow.first!..<sortedWindow.last!{
            returnValue+=1
        }
        return returnValue+1
    }
}


let myString = "dcbefebce"
myString.minLengthOfRearrangedSubstring(containing: "fd")

let myString2 = "bfbeadbcbcbfeaaeefcddcccbbbfaaafdbebedddf"
myString2.minLengthOfRearrangedSubstring(containing: "cbccfafebccdccebdd")

