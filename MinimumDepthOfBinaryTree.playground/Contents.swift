import UIKit
import Darwin

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

    
    func minDepth(_ root: TreeNode?) -> Int{
        guard root != nil else { return 0 }
        var depthCount = 0
        var queue:[TreeNode] = [TreeNode]()
        queue.append(root!)
        while !queue.isEmpty{
            depthCount+=1
            var levelNodes:[TreeNode] = [TreeNode]()
            for currNode in queue{
                if currNode.left == nil && currNode.right == nil{
                    return depthCount
                }
                if let left = currNode.left{
                    levelNodes.append(left)
                }
                if let right = currNode.right{
                    levelNodes.append(right)
                }
            }
            queue = levelNodes
        }
        return depthCount
    }
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard root != nil else { return [] }
        var returnValue:[[Int]] = [[Int]]()
        var queue:[TreeNode] = [TreeNode]()
        
        queue.append(root!)
        returnValue.append([root!.val])
        
        while !queue.isEmpty{
            var valsAtLevel:[Int] = [Int]()
            var nodesAtLevel:[TreeNode] = [TreeNode]()
            
            
            for currNode in queue{
                if let left = currNode.left{
                    queue.append(left)
                    valsAtLevel.append(left.val)
                    nodesAtLevel.append(left)
                }
                if let right = currNode.right{
                    queue.append(right)
                    valsAtLevel.append(right.val)
                    nodesAtLevel.append(right)
                }
                
            }
            if !valsAtLevel.isEmpty{
                returnValue.append(valsAtLevel)
            }
            queue = nodesAtLevel
        }
        return returnValue
    }
    
    
}

let solution = Solution()
//let treeOne = solution.createTreeFromLevelOrder([3,9,20,nil,nil,15,7])
//let treeTwo = solution.createTreeFromLevelOrder([2,nil,3,nil,4,nil,5,nil,6])
//let treeThree = solution.createTreeFromLevelOrder([1,2,3,4,5])
//
//print("Depth:",solution.minDepth(treeOne))
//print(treeOne!.asString)
//print("-------------")
//print("Depth:",solution.minDepth(treeTwo))
//print(treeTwo!.asString)
////print("-------------")
//print("Depth:",solution.minDepth(treeThree))
//print("-------------")
//print(treeThree!.asString)

let treeFour = solution.createTreeFromLevelOrder([1,2,3,4,nil,nil,5])
print(treeFour!.asString)
solution.levelOrder(treeFour)























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
