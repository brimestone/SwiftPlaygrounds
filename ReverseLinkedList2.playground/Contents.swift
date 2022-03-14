import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func verifyLinkList(_ head:ListNode?){
        guard head != nil else { return }
        var currNode = head
        while currNode?.next != nil{
            print(currNode!.val)
            currNode = currNode?.next
        }
        print(currNode!.val)
    }
    func createLinkList(_ array:[Int])->ListNode?{
        guard !array.isEmpty else { return nil }
        var head:ListNode?
        for n in array {
            if let _ = head {
                var currNode = head
                
                while currNode?.next != nil{
                    currNode = currNode?.next
                }
                currNode?.next = ListNode(n)
            }else{
                head = ListNode(n)
            }
        }
        return head
    }
    
    func reverseList2(_ head: ListNode?) -> ListNode? {
        /*
            Slow version because of O(n + m) Space O(n + m)
         */
        guard head != nil else { return nil }
        var array:[Int] = [Int]()
        
        var currNode = head
        while currNode?.next != nil{
            array.append(currNode!.val)
            currNode = currNode!.next
        }
        array.append(currNode!.val)
        return self.createLinkList(array.reversed())
    }
    func reverseList(_ head: ListNode?) -> ListNode? {
        /*
            Best solution O(n) - Space O(n)
         */
        guard head != nil else { return nil }
        
        var currHead = head
        var tail:ListNode?
        
        while currHead?.next != nil {
            if tail == nil{
                tail = ListNode(currHead!.val)
            }else{
                let newNode = ListNode(currHead!.val, tail)
                tail = newNode
            }
            currHead = currHead?.next
        }
        let newNode = ListNode(currHead!.val, tail)
        tail = newNode
        return tail
    }
}


let solution = Solution()

let link1 = solution.createLinkList([1,2,3,4,5])
solution.verifyLinkList(solution.reverseList(link1))


