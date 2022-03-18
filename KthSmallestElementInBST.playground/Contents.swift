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
    func createTreeFromLevelOrder(_ array:[Int?])->TreeNode?{
        guard !array.isEmpty else { return nil }
        var arr = array
        var queue:[TreeNode?] = [TreeNode?]()
        
        let rootNode = TreeNode(arr.removeFirst()!)
        queue.append(rootNode)
        
        while !queue.isEmpty && !arr.isEmpty {
            let currRoot = queue.removeFirst()
            
            if let left = arr.removeFirst(){
                let leftNode = TreeNode(left)
                currRoot?.left = leftNode
                queue.append(leftNode)
            }
            if let right = arr.removeFirst(){
                let rightNode = TreeNode(right)
                currRoot?.right = rightNode
                queue.append(rightNode)
            }
        }
        return rootNode
    }
    
    
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        guard root != nil else { return -1 }
        
        var queue:[TreeNode] = [TreeNode]()
        var preOrderArray:[Int] = [Int]()
        
        queue.append(root!)
        
        while !queue.isEmpty{
            let currNode = queue.removeFirst()
            preOrderArray.append(currNode.val)
            if let left = currNode.left{
                queue.append(left)
            }
            if let right = currNode.right{
                queue.append(right)
            }
        }
        print(preOrderArray.sorted())
        return preOrderArray.sorted()[k-1]
    }
}

let solution = Solution()
let tree = solution.createTreeFromLevelOrder([3,1,4,nil,2])
solution.kthSmallest(tree, 1)
