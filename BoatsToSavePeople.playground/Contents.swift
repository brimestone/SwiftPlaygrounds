import Foundation

class Solution {
    /*
     Runtime: 618 ms, faster than 40.00% of Swift online submissions for Boats to Save People.
     Memory Usage: 16.5 MB, less than 6.67% of Swift online submissions for Boats to Save People.
     */
    func numRescueBoats(_ people: [Int], _ limit: Int) -> Int {
        let sortedPeople = people.sorted()
        var left:Int = 0
        var right:Int = sortedPeople.count - 1
        var boats:[[Int]] = [[Int]]()
        
        while left <= right {
            if (sortedPeople[left] + sortedPeople[right]) <= limit {
                boats.append([sortedPeople[left], sortedPeople[right]])
                left+=1
                right-=1
            }else{
                boats.append([sortedPeople[right]])
                right-=1
            }
            print(boats)
        }
        return boats.count
    }
}

let solution = Solution()

solution.numRescueBoats([1,2], 3)  //1
solution.numRescueBoats([3,2,2,1], 3)  //3
solution.numRescueBoats([3,5,3,4], 5)  //4


//[1, 2] 3
//[1, 2, 2, 3] 3
// L     R [ [3],[1,2] ]


//[3, 3, 4, 5] 5
