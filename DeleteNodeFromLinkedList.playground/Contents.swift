import UIKit

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func deleteNode(_ node: ListNode?) {
        guard node != nil else { return }
        var currNode = node
        var pastNode:ListNode?
        
        while currNode?.next != nil{
            currNode?.val = (currNode?.next?.val)!
            
            pastNode = currNode
            currNode = currNode?.next
        }
        pastNode?.next = nil
        
    }
}


let node9 = ListNode(9)
let node1 = ListNode(1)
let node5 = ListNode(5)
let node4 = ListNode(4)
node1.next = node9
node5.next = node1
node4.next = node5



let solution = Solution()

node4
solution.deleteNode(node5)
node4
