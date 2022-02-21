import UIKit


class Node{
    var data:Int
    
    var left:Node?
    var right:Node?
    
    init(_ data:Int, _ left:Node? = nil,_ right:Node? = nil){
        self.data = data
        self.left = left
        self.right = right
    }
    
    func copy()->Node{
        let newNode = Node(data)
        if self.left != nil{
            newNode.left = self.left?.copy()
        }
        if self.right != nil{
            newNode.right = self.right?.copy()
        }
        return newNode
    }
    func depthCount(_ currNode:Node?)->Int{
        // print("called on \(currNode?.data)")
        if currNode == nil{
            return 0
        }
        let leftCount = depthCount(currNode?.left)
        let rightCount = depthCount(currNode?.right)
        return max(leftCount, rightCount) + 1
    }
}



let Root1 = Node(8,
                 Node(3,
                      Node(1),
                      Node(6,
                           Node(4),
                           Node(7)
                          )
                     ),
                 Node(10,
                      nil,
                      Node(14,
                           Node(13),
                           nil)
                     )
)

let Root1a = Root1.copy()


Root1.depthCount(Root1)
Root1a.depthCount(Root1a)
