import UIKit

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        var ListNode = head
        var currNode = head
        var pastNode:ListNode?
        while currNode != nil{
            if (currNode?.val)! == val{
                if pastNode == nil{
                    ListNode = currNode?.next
                }else{
                    pastNode?.next = currNode?.next
                }
            }else{
                pastNode = currNode
            }
            currNode = currNode?.next
        }
        return ListNode
    }
}

let solution = Solution()
var head:ListNode?
var removed:ListNode?

for n in [1,2,6,3,4,5,6]{
    let newNode = ListNode(n)
    if head == nil{
        head = newNode
    }else{
        var currNode = head
        while currNode?.next != nil{
            currNode = currNode?.next
        }
        currNode?.next = newNode
    }
}
removed = solution.removeElements(head, 6)

head = nil

for n in [7,7,7,7,7,7,1]{
    let newNode = ListNode(n)
    if head == nil{
        head = newNode
    }else{
        var currNode = head
        while currNode?.next != nil{
            currNode = currNode?.next
        }
        currNode?.next = newNode
    }
}
removed = solution.removeElements(head, 7)
