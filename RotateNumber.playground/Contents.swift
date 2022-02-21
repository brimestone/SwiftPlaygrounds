import UIKit

/**
 An integer x is a good if after rotating each digit individually by 180 degrees, we get a valid number that is different from x. Each digit must be rotated - we cannot choose to leave it alone.

 A number is valid if each digit remains a digit after rotation. For example:

 0, 1, and 8 rotate to themselves,
 2 and 5 rotate to each other (in this case they are rotated in a different direction, in other words, 2 or 5 gets mirrored),
 6 and 9 rotate to each other, and
 the rest of the numbers do not rotate to any other number and become invalid.
 Given an integer n, return the number of good integers in the range [1, n].

  

 Example 1:

 Input: n = 10
 Output: 4
 Explanation: There are four good numbers in the range [1, 10] : 2, 5, 6, 9.
 Note that 1 and 10 are not good numbers, since they remain unchanged after rotating.
 Example 2:

 Input: n = 1
 Output: 0
 Example 3:

 Input: n = 2
 Output: 1
  

 Constraints:

 1 <= n <= 104
 */

class Solution {
    /*
     T - O(n • m) ?
     S - S(n • m) ?
     */
    
    let rotateable:[Int:Int] = [0:0, 1:1, 8:8, 2:5, 5:2, 6:9, 9:6]
    let notValid = ["3":3, "4":4, "7":7]
    func rotatedDigits(_ n: Int) -> Int {
        
        var canRotate:Int = 0
        
        
        for n in 1...n{ // O(n)
            let nArr = Array(String(n))
            var mArr:String = String()
            var isValid:Bool = true
            
            for m in nArr{ // O(m)
                let mInt = Int("\(m)")!
                mArr.append(String(flipDigit(mInt)))
                if let _ = notValid[String(m)]{ // O(1)
                    isValid = false
                }
            }
            if nArr != Array(mArr) && isValid{
                canRotate+=1
            }
        }
        return canRotate
    }
    
    func flipDigit(_ n: Int)->Int{
        if let flip = rotateable[n]{ // O(1)
            return flip
        }
        return n
    }

}

let solution = Solution()
solution.rotatedDigits(857) // 247
solution.rotatedDigits(10) // 4
solution.rotatedDigits(10000)


