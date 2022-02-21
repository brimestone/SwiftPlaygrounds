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


class Solution{
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        guard root != nil else { return [] }
        var preOrderTravese:[Int] = [Int]()
        dfs(root!, &preOrderTravese)
        return preOrderTravese
    }
    
    func dfs(_ root:TreeNode,_ preOrderTravese:inout [Int]){
        preOrderTravese.append(root.val)
        if let leftNode = root.left{
            dfs(leftNode, &preOrderTravese)
        }
        if let rightNode = root.right{
            dfs(rightNode, &preOrderTravese)
        }
    }
    
    
}
