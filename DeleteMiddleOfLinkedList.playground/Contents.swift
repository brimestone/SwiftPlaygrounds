import UIKit

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func deleteMiddle(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return head
        }
        if head?.next == nil{
            return nil
        }
        var arr:[Int] =  [Int]()
        var currNode = head
        
        while currNode?.next != nil {
            arr.append(currNode!.val)
            currNode = currNode?.next
        }
        arr.append(currNode!.val)
        let midNode = Int((arr.count / 2))
        
        var pastNode:ListNode?
        currNode = head
        for _ in 0..<midNode{
            pastNode = currNode
            currNode = currNode?.next
        }
        pastNode?.next = currNode?.next
        return head
    }
}
let g = ListNode(6)
let f = ListNode(2, g)
let e = ListNode(1, f)
let d = ListNode(7, e)
let c = ListNode(4, d)
let b = ListNode(3, c)
let a = ListNode(1, b)

let solution = Solution()
solution.deleteMiddle(a) // [1,3,4,1,2,6]
