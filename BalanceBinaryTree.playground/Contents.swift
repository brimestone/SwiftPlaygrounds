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
    func isBalanced(_ root: TreeNode?) -> Bool {
        guard root != nil else { return true }
        var isBalance:Bool = true
        self.dfs(root, &isBalance)
        return isBalance
    }
    
    func dfs(_ root: TreeNode?,_ isBalance:inout Bool,_ level:Int = 0) -> Int{
        guard root != nil else { return level }
        
        let leftDepth  = dfs(root?.left, &isBalance, level+1)
        let rightDepth = dfs(root?.right, &isBalance, level+1)
        
        isBalance = isBalance && abs(rightDepth - leftDepth) <= 1
        return max(rightDepth, leftDepth)
    }
    
    
    

}

let l3l = TreeNode(15)
let l3r = TreeNode(7)
let l2r = TreeNode(20, l3l, l3r)
let l2l = TreeNode(9)
let root = TreeNode(3, l2l, l2r)

let solution = Solution()
solution.isBalanced(root)


