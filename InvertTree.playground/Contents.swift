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
extension TreeNode {
    var asString:String { return treeString(self){("\($0.val)",$0.left,$0.right)}  }
    public func treeString<T>(_ node:T, reversed:Bool=false, isTop:Bool=true, using nodeInfo:(T)->(String,T?,T?)) -> String
    {
        // node val string and sub nodes
        let (stringval, leftNode, rightNode) = nodeInfo(node)
        
        let stringvalWidth  = stringval.count
        
        // recurse to sub nodes to obtain line blocks on left and right
        let leftTextBlock     = leftNode  == nil ? []
        : treeString(leftNode!,reversed:reversed,isTop:false,using:nodeInfo)
            .components(separatedBy:"\n")
        
        let rightTextBlock    = rightNode == nil ? []
        : treeString(rightNode!,reversed:reversed,isTop:false,using:nodeInfo)
            .components(separatedBy:"\n")
        
        // count common and maximum number of sub node lines
        let commonLines       = min(leftTextBlock.count,rightTextBlock.count)
        let subLevelLines     = max(rightTextBlock.count,leftTextBlock.count)
        
        // extend lines on shallower side to get same number of lines on both sides
        let leftSubLines      = leftTextBlock
        + Array(repeating:"", count: subLevelLines-leftTextBlock.count)
        let rightSubLines     = rightTextBlock
        + Array(repeating:"", count: subLevelLines-rightTextBlock.count)
        
        // compute location of val or link bar for all left and right sub nodes
        //   * left node's val ends at line's width
        //   * right node's val starts after initial spaces
        let leftLineWidths    = leftSubLines.map{$0.count}
        let rightLineIndents  = rightSubLines.map{$0.prefix{$0==" "}.count  }
        
        // top line val locations, will be used to determine position of current node & link bars
        let firstLeftWidth    = leftLineWidths.first   ?? 0
        let firstRightIndent  = rightLineIndents.first ?? 0
        
        
        // width of sub node link under node val (i.e. with slashes if any)
        // aims to center link bars under the val if val is wide enough
        //
        // valLine:    v     vv    vvvvvv   vvvvv
        // LinkLine:    / \   /  \    /  \     / \
        //
        let linkSpacing       = min(stringvalWidth, 2 - stringvalWidth % 2)
        let leftLinkBar       = leftNode  == nil ? 0 : 1
        let rightLinkBar      = rightNode == nil ? 0 : 1
        let minLinkWidth      = leftLinkBar + linkSpacing + rightLinkBar
        let valOffset       = (stringvalWidth - linkSpacing) / 2
        
        // find optimal position for right side top node
        //   * must allow room for link bars above and between left and right top nodes
        //   * must not overlap lower level nodes on any given line (allow gap of minSpacing)
        //   * can be offset to the left if lower subNodes of right node
        //     have no overlap with subNodes of left node
        let minSpacing        = 2
        let rightNodePosition = zip(leftLineWidths,rightLineIndents[0..<commonLines])
            .reduce(firstLeftWidth + minLinkWidth)
        { max($0, $1.0 + minSpacing + firstRightIndent - $1.1) }
        
        
        // extend basic link bars (slashes) with underlines to reach left and right
        // top nodes.
        //
        //        vvvvv
        //       __/ \__
        //      L       R
        //
        let linkExtraWidth    = max(0, rightNodePosition - firstLeftWidth - minLinkWidth )
        let rightLinkExtra    = linkExtraWidth / 2
        let leftLinkExtra     = linkExtraWidth - rightLinkExtra
        
        // build val line taking into account left indent and link bar extension (on left side)
        let valIndent       = max(0, firstLeftWidth + leftLinkExtra + leftLinkBar - valOffset)
        let valLine         = String(repeating:" ", count:max(0,valIndent))
        + stringval
        let slash             = reversed ? "\\" : "/"
        let backSlash         = reversed ? "/"  : "\\"
        let uLine             = reversed ? "¯"  : "_"
        // build left side of link line
        let leftLink          = leftNode == nil ? ""
        : String(repeating: " ", count:firstLeftWidth)
        + String(repeating: uLine, count:leftLinkExtra)
        + slash
        
        // build right side of link line (includes blank spaces under top node val)
        let rightLinkOffset   = linkSpacing + valOffset * (1 - leftLinkBar)
        let rightLink         = rightNode == nil ? ""
        : String(repeating:  " ", count:rightLinkOffset)
        + backSlash
        + String(repeating:  uLine, count:rightLinkExtra)
        
        // full link line (will be empty if there are no sub nodes)
        let linkLine          = leftLink + rightLink
        
        // will need to offset left side lines if right side sub nodes extend beyond left margin
        // can happen if left subtree is shorter (in height) than right side subtree
        let leftIndentWidth   = max(0,firstRightIndent - rightNodePosition)
        let leftIndent        = String(repeating:" ", count:leftIndentWidth)
        let indentedLeftLines = leftSubLines.map{ $0.isEmpty ? $0 : (leftIndent + $0) }
        
        // compute distance between left and right sublines based on their val position
        // can be negative if leading spaces need to be removed from right side
        let mergeOffsets      = indentedLeftLines
            .map{$0.count}
            .map{leftIndentWidth + rightNodePosition - firstRightIndent - $0 }
            .enumerated()
            .map{ rightSubLines[$0].isEmpty ? 0  : $1 }
        
        
        // combine left and right lines using computed offsets
        //   * indented left sub lines
        //   * spaces between left and right lines
        //   * right sub line with extra leading blanks removed.
        let mergedSubLines    = zip(mergeOffsets.enumerated(),indentedLeftLines)
            .map{ ( $0.0, $0.1, $1 + String(repeating:" ", count:max(0,$0.1)) ) }
            .map{ $2 + String(rightSubLines[$0].dropFirst(max(0,-$1))) }
        
        // Assemble final result combining
        //  * node val string
        //  * link line (if any)
        //  * merged lines from left and right sub trees (if any)
        let treeLines = [leftIndent + valLine]
        + (linkLine.isEmpty ? [] : [leftIndent + linkLine])
        + mergedSubLines
        
        return (reversed && isTop ? treeLines.reversed(): treeLines)
            .joined(separator:"\n")
    }
}

class Solution {
    func insertToTree(_ node:TreeNode,_ root:TreeNode){
        if root.val > node.val {
            if root.left == nil{
                root.left = node
            }else{
                insertToTree(node, root.left!)
            }
        }else{
            if root.right == nil{
                root.right = node
            }else{
                insertToTree(node, root.right!)
            }
        }
    }
    func createTree(from arr:[Int]) -> TreeNode?{
        guard !arr.isEmpty else { return nil }
        var root:TreeNode?
        for n in arr{
            if root == nil {
                root = TreeNode(n)
            }else{
                let newNode = TreeNode(n)
                insertToTree(newNode, root!)
            }
        }
        return root
    }
    
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard root != nil else { return nil }
        let right = root?.right
        let left  = root?.left
        root?.right = left
        root?.left = right
        invertTree(root?.right)
        invertTree(root?.left)
        return root
    }
    
}


let solution = Solution()
let tree = solution.createTree(from: [2,1,3])
print(tree!.asString)

let tree2 = solution.invertTree(tree)
print(tree2!.asString)


