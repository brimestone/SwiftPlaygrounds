import UIKit

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func isPalindrome(_ head: ListNode?) -> Bool {
        if head == nil{
            return false
        }
        var arr:[Int] = [Int]()
        var curr:ListNode = head!
        
        while curr.next != nil{
            arr.append(curr.val)
            curr = curr.next!
        }
        arr.append(curr.val)
        return arr ==  Array(arr.reversed()) ? true : false
    }
}
let node4 = ListNode(1)
let node3 = ListNode(2, node4)
let node2 = ListNode(2, node3)
let node1 = ListNode(1, node2)


let solution = Solution()
solution.isPalindrome(node1)
// [1,2,2,1] true
// [1,2]    false
