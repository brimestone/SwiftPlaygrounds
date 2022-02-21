import UIKit

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func isValidBST(_ root: TreeNode?) -> Bool {
        guard root != nil else { return true }
        var flatten:[Int] = [Int]()
        validBST(root!, &flatten)
        print(flatten)
        for n in 1..<flatten.count{
            if flatten[n] <= flatten[n-1]{
                return false
            }
        }
        return true
    }
    func validBST(_ root:TreeNode,_ flatten:inout [Int]){
        if let leftNode = root.left {
            validBST(leftNode, &flatten)
        }
        flatten.append(root.val)
        if let rightNode = root.right {
            validBST(rightNode, &flatten)
        }
    }
}

//[5,1,4,null,null,3,6] false
//[2,1,3] true






































func isValidBST(_ root: TreeNode?) -> Bool {
    guard root != nil else { return false }
    
    var queue:[TreeNode] = [TreeNode]()
    queue.append(root!)
    
    while !queue.isEmpty{
        let currRoot = queue.removeLast()
        let rootVal:Int = currRoot.val
        var leftVal:Int?
        var rightVal:Int?
        
        if let leftChild = currRoot.left {
            queue.append(leftChild)
            leftVal = leftChild.val
        }
        if let rightChild = currRoot.right {
            queue.append(rightChild)
            rightVal = rightChild.val
        }
        
        if let lVal = leftVal {
            if lVal >= rootVal { return false }
        }
        if let rVal = rightVal {
            if rVal <= rootVal { return false }
        }
    }
    return true
}
