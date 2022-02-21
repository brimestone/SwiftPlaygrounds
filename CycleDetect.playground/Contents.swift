import UIKit

class Node {
     public var val: Int
     public var next: Node?
    
     public init(_ val: Int) {
         self.val = val
         self.next = nil
     }
}
class SingleLinkList{
    public var head:Node?
    
    func getFirst()->Int?{
        guard head != nil else {
            return nil
        }
        return head?.val
    }
    func getLast()->Int?{
        guard head != nil else {
            return nil
        }
        var currNode = head
        while currNode?.next != nil{
            currNode = currNode?.next
        }
        return currNode?.val
    }

    func insert(_ value:Int){
        if head == nil{
            head = Node(value)
        }else{
            let newNode = Node(value)
            newNode.next = head
            head = newNode
        }
    }
    
    func insertArray(_ arr:[Int]){
        guard !arr.isEmpty else{
            return
        }
        for idx in stride(from: arr.count-1, through: 0, by: -1){
            insert(arr[idx])
        }
    }
    func addLast(_ value:Int){
        if head == nil{
            head = Node(value)
        }else{
            var currNode = head
            while currNode?.next != nil{
                currNode = currNode?.next
            }
            currNode!.next = Node(value)
        }
        
    }
    func removeLast(){
        guard head != nil else {
            return
        }
        var currNode = head
        var prevNode:Node?
        while currNode?.next != nil{
            prevNode = currNode
            currNode = currNode?.next
        }
        prevNode?.next = nil
    }
    func removeFirst(){
        guard head != nil else {
            return
        }
        if head?.next == nil{
            head = nil
        }else{
            head = head!.next
        }
        
    }
    func printList(){
        guard (head != nil) else{
            return
        }
        var Lists:[Int] = [Int]()
        var currNode = head
        while currNode?.next != nil{
            Lists.append(currNode!.val)
            currNode = currNode?.next
        }
        Lists.append(currNode!.val)
        print(Lists)
    }
}

class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
            
    }
    
    func hasCycle(_ head: Node?) -> Bool {
        if let head = head {
            var currNode = head
            var headNode = currNode.next
            
            while headNode?.next?.next != nil{
                if currNode === headNode{ // "===" is object comparision while "==" is value comparision.
                    return true
                }
                currNode = currNode.next!
                headNode = headNode?.next?.next
            }
        }
        return false
    }
    func isValue(_ val:Int, Inside linkList: Node?)->Bool{
        if linkList != nil{
            var currNode = linkList
            while currNode?.next != nil{
                if currNode?.val == val{
                    return true
                }
                currNode = currNode?.next
            }
        }
        return false
    }
    
}
let solution = Solution()

let singleLinkList1 = SingleLinkList()
singleLinkList1.insertArray([3, 2, 0, -4])
singleLinkList1.printList()

let singleLinkList2 = SingleLinkList()
singleLinkList2.insertArray([1,1,1,1,1])
singleLinkList2.printList()

// Create the edge case
let node5 = Node(1)
let node4 = Node(1)
let node3 = Node(1)
let node2 = Node(1)
let hasCycle = Node(1)

hasCycle.next = node2
node2.next = node3
node3.next = node4
node4.next = node5
node5.next = node3 //Force a loop


print(solution.hasCycle(singleLinkList1.head))
print(solution.hasCycle(singleLinkList2.head))
print(solution.hasCycle(hasCycle))

singleLinkList1.addLast(16)
singleLinkList1.printList()
singleLinkList2.addLast(16)
singleLinkList2.printList()

singleLinkList2.removeLast()
singleLinkList2.printList()

singleLinkList1.removeFirst()
singleLinkList1.printList()

solution.isValue(-4, Inside: singleLinkList1.head)

var arr:[Int] = [Int]()
arr = [1,2,3,4,5,6,7]

