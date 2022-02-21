import UIKit

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        if list1 == nil && list2 == nil { return nil }
        if list1 == nil { return list2 }
        if list2 == nil { return list1 }
        
        var array:[Int] = [Int]()
        var result:ListNode?
        
        for listx in [list1, list2]{ // O(n)
            var currList = listx
            
            while currList != nil{
                array.append(currList!.val)
                currList = currList?.next
            }
        }
        let sorted = array.sorted() // O(nlogn)
        for n in sorted{ // O(n)
            if result == nil{
                result = ListNode(n)
            }else{
                var currNode = result
                while currNode?.next != nil{
                    currNode = currNode?.next
                }
                currNode?.next = ListNode(n)
            }
        }
        return result
    }
}
let solution = Solution()

let list3 = ListNode(4)
let list2 = ListNode(2, list3)
let list1 = ListNode(5)

let list3a = ListNode(4)
let list2a = ListNode(2, list3a)
let list1a = ListNode(1, list2a)

solution.mergeTwoLists(list1, list1a)
//list1 = [1,2,4], list2 = [1,3,4]
//[1,1,2,3,4,4]
