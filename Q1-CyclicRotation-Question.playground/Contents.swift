import UIKit

/*
 Rotate array to right N times.
 https://app.codility.com/programmers/lessons/2-arrays/cyclic_rotation/
 
 For example, given

     A = [3, 8, 9, 7, 6]
     K = 3
 the function should return [9, 7, 6, 3, 8]. Three rotations were made:

     [3, 8, 9, 7, 6] -> [6, 3, 8, 9, 7]
     [6, 3, 8, 9, 7] -> [7, 6, 3, 8, 9]
     [7, 6, 3, 8, 9] -> [9, 7, 6, 3, 8]

 */

func rorateKTimes(A: [Int], K: Int) -> [Int] {
    // Edge Cases
    if A.isEmpty {
        return A
    }
    
    // O(n • k) -> O(n)
    if K < 1 {
        return A
    }
    var TempA = Array(repeating: 0, count: A.count)
    
    for n in 0..<A.count-1{
        TempA[n+1] = A[n]
    }
    TempA[0] = A[A.count-1]
    
    return rorateKTimes(A: TempA, K: K-1)
}


rorateKTimes(A: [1, 2, 3, 4, 5], K: 1) // 5 1 2 3 4
rorateKTimes(A: [1, 2, 3, 4, 5], K: 2) // 4 5 1 2 3
rorateKTimes(A: [1, 2, 3, 4, 5], K: 3) // 3 4 5 1 2
rorateKTimes(A: [3, 8, 9, 7, 6], K: 3) // [9, 7, 6, 3, 8]


func solutionQueueLeft(A: [Int], K: Int) -> [Int] {
    
}
