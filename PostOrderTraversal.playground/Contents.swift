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
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        guard root != nil else { return [] }
        var postOrderTravese:[Int] = [Int]()
        dfs(root!, &postOrderTravese)
        return postOrderTravese
    }
    
    func dfs(_ root:TreeNode,_ postOrderTravese:inout [Int]){
        if let leftNode = root.left{
            dfs(leftNode, &postOrderTravese)
        }
        if let rightNode = root.right{
            dfs(rightNode, &postOrderTravese)
        }
        postOrderTravese.append(root.val)
    }
}
