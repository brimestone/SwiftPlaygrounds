import UIKit


class Solution {
    func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
        let sorted = points.sorted { pointA, pointB in
            // √(x1 - x2)2 + (y1 - y2)2
            let A = sqrt(pow(Double((0 - pointA[0])),2) + pow(Double((0 - pointA[1])),2))
            let B = sqrt(pow(Double((0 - pointB[0])),2) + pow(Double((0 - pointB[1])),2))
            return A < B
        }
        return Array(sorted[..<min(k, sorted.count)])
    }
}


let solution = Solution()
solution.kClosest([[1,3],[-2,2]], 1) // [[-2, 2]]
solution.kClosest([[3,3],[5,-1],[-2,4]], 2) // [[3,3],[-2,4]
