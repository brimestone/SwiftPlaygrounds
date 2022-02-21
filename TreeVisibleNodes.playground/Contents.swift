import UIKit

// Please write your code below, and don’t forget to test edge cases!
/**
 Number of Visible Nodes
 There is a binary tree with N nodes. You are viewing the tree from its left side and can see only the leftmost nodes at each level. Return the number of visible nodes.
 Note: You can see only the leftmost nodes, but that doesn't mean they have to be left nodes. The leftmost node at a level could be a right node.
 Signature
 int visibleNodes(Node root) {
 Input
 The root node of a tree, where the number of nodes is between 1 and 1000, and the value of each node is between 0 and 1,000,000,000
 Output
 An int representing the number of visible nodes.
 Example
        8  <------ root
       /  \
      3    10
      / \      \
     1   6     14
       / \      /
      4   7   13
 output = 4
 */




class Node {
    let data: Int
    let left: Node?
    let right: Node?
    
    init(_ data: Int, left: Node? = nil, right: Node? = nil) {
        self.data = data
        self.left = left
        self.right = right
    }
}
private extension Node {
    // Add any helper functions you may need here
    var visibleNodes: Int {
        return depthCount(self)
    }
    func depthCount(_ currNode:Node?)->Int{
        if currNode == nil{
            return 0
        }
        //print("called on \(currNode!.data)")
        let leftCount = depthCount(currNode?.left)
        let rightCount = depthCount(currNode?.right)
        return max(leftCount, rightCount) + 1
    }
}

var testCaseNumber = 1

private func check(_ expectedValue: Int, matches output: Int) {
    let rightTick = "\u{2713}";
    let wrongTick = "\u{2717}";
    
    let result = expectedValue == output
    if result {
        print("\(rightTick) Test #\(testCaseNumber)")
    } else {
        print("\(wrongTick) Test #\(testCaseNumber) Expected: \(expectedValue) Your output: \(output)")
    }
    testCaseNumber += 1
}


let root1 = Node(8,
                 left: Node(3,
                            left: Node(1),
                            right: Node(6,
                                        left: Node(4),
                                        right: Node(7))),
                 right: Node(10,
                             right: Node(14,
                                         left: Node(13))))

check(4, matches: root1.visibleNodes)

let root2 = Node(10,
                 left: Node(8,
                            left: Node(4,
                                       right: Node(5,
                                                   right: Node(6)))),
                 right: Node(15,
                             left: Node(14),
                             right: Node(16)))

//check(5, matches: root2.visibleNodes)

// Add your own test cases here

// First attemp below

//private extension Node {
//    // Add any helper functions you may need here
//    var visibleNodes: Int {
//        var visibleNode:Int = 0
//        var level:Int = 0
//        var levelmap:[Int:Int] = [Int:Int]()
//        dfs(currNode: self, visibleNode: &visibleNode, level: &level, levelmap: &levelmap)
//        print(levelmap.keys.count)
//        return levelmap.keys.count
//    }
//    func dfs(currNode: Node?, visibleNode:inout Int, level:inout Int, levelmap:inout [Int:Int]){
//        print(currNode!.data, visibleNode, levelmap)
//        if currNode?.left != nil{
//            levelmap[level] = 1
//            dfs(currNode: currNode?.left, visibleNode: &visibleNode, level: &level, levelmap: &levelmap)
//        }
//        if currNode?.right != nil{
//            levelmap[level] = 1
//            dfs(currNode: currNode?.right, visibleNode: &visibleNode, level: &level, levelmap: &levelmap)
//        }
//        level+=1
//    }
//
//}
