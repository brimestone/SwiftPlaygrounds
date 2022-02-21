import UIKit


class Node{
    let value:Int
    var next:Node?
    
    init(value:Int, next:Node?){
        self.value = value
        self.next = next
    }
}


class LinkedList{
    var head: Node?
    
    func addValue(_ value:Int){
        let nodeToAdd = Node(value: value, next: nil)
        if head == nil{
            head = nodeToAdd
            return
        }
        var current = head
        while current?.next != nil{
            current = current?.next
        }
        current?.next = nodeToAdd
    }
    func insertAtIndex(_ value:Int, _ index:Int){
        let nodeToAdd = Node(value: value, next: nil)
        if head == nil{
            head = nodeToAdd
            return
        }
        
        var current = head
        var currentIndex = 0
        var prev:Node?
        
        while current?.next != nil{
            if currentIndex == index{
                nodeToAdd.next = current
                prev?.next = nodeToAdd
                break
            }
            prev=current
            currentIndex+=1
            current = current?.next
        }
    }
    
    
    
    func deleteValue(_ value:Int){
        var current = head
        if head?.value == value{
            head = head?.next
            return
        }

        while current?.next != nil && current?.next?.value != value {
            current = current?.next
        }
        current?.next = current?.next?.next
    }

    func displayListContent(){
        print("Here are the contents of the List: ")
        var arrayView:[Int] = [Int]()
        
        var current = head
        while current != nil{
            if let value = current?.value{
                arrayView.append(value)
            }
            current = current?.next
        }
        print(arrayView)
    }
    
    
    
}

let myLinkedList = LinkedList()

myLinkedList.addValue(1)
myLinkedList.addValue(2)
myLinkedList.addValue(4)
myLinkedList.addValue(10)
myLinkedList.addValue(11)
myLinkedList.displayListContent()

myLinkedList.insertAtIndex(9, 3)
myLinkedList.displayListContent()































//class Node{
//    let value:Int
//    var next:Node?
//
//    init(value: Int, next:Node?){
//        self.value = value
//        self.next = next
//    }
//}
//
//class LinkList{
//    var head:Node?
//
//    func setupDummyNodes(){
//        let three = Node(value: 3, next: nil)
//        let two = Node(value: 2, next: three)
//        let one = Node(value: 1, next: two)
//        self.head = one
//    }
//    func displayList(){
//        print("Contents of List is: ")
//        var current = self.head
//        while current != nil{
//            print("\(current?.value ?? -1)")
//            current = current?.next
//        }
//    }
//}
//
//
//let myLinkedList = LinkList()
//
//myLinkedList.setupDummyNodes()
//
//myLinkedList.displayList()
