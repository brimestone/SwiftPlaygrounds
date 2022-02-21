import UIKit

public class ListNode {
    public var val: Int
    public var next: ListNode?
    
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    //    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}


class Solution {
    func createListFromArray(_ arr:[Int])->ListNode?{
        var head:ListNode?
        for n in arr{
            if head == nil{
                head = ListNode(n)
            }else{
                var currNode = head
                while currNode?.next != nil{
                    currNode = currNode?.next
                }
                currNode?.next = ListNode(n)
            }
        }
        return head
    }
    
    func addTwoNumbers2(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var node1 = l1
        var node2 = l2
        var anchor = 0
        let resultNode = ListNode()
        var current = resultNode
        
        while node1 != nil || node2 != nil || anchor == 1 {
            let sum = (node1?.val ?? 0) + (node2?.val ?? 0) + anchor
            
            current.next = ListNode(sum % 10)
            anchor = sum / 10
            current = current.next!
            
            node1 = node1?.next
            node2 = node2?.next
        }
        
        return resultNode.next
    }
    
    
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var currL1 = l1
        var currL2 = l2
        var remainder = 0
        let resultNode = ListNode()
        var currNode = resultNode
        
        while currL1 != nil || currL2 != nil || remainder == 1 {
            let sum = (currL1?.val ?? 0) + (currL2?.val ?? 0) + remainder
            
            currNode.next = ListNode(sum % 10)
            remainder = sum / 10
            currNode = currNode.next!
            
            currL1 = currL1?.next
            currL2 = currL2?.next
        }
        return resultNode.next
    }
    
}
let solution = Solution()
let l1 = solution.createListFromArray([3,4,2])
let l2 = solution.createListFromArray([4,6,5])
solution.addTwoNumbers(l1, l2)
solution.addTwoNumbers2(l1, l2)

let edge1 = solution.createListFromArray([9,9,9,9,9,9,9])
let edge2 = solution.createListFromArray([9,9,9,9])
solution.addTwoNumbers(edge1, edge2)
solution.addTwoNumbers2(edge1, edge2)
