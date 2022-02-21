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
    func minDepth(_ root: TreeNode?) -> Int {
        guard root != nil else { return 0 }
        return min(minDepth(root?.right), minDepth(root?.left)) + 1
    }
    
}

let l3l = TreeNode(15)
let l3r = TreeNode(7)
let l2r = TreeNode(20, l3l, l3r)
let l2l = TreeNode(9)
let root = TreeNode(3, l2l, l2r)

let solution = Solution()
solution.minDepth(root)
