import UIKit


struct Heap<Element:Equatable>{
    var elements:[Element] = []
    let sort:(Element, Element) -> Bool
    
    init(sort: @escaping (Element, Element) -> Bool, elements:[Element] = []){
        self.sort = sort
        self.elements = elements
        
        if !elements.isEmpty {
            for i in stride(from: elements.count, through: 0, by: -1){
                siftDown(from: i)
            }
        }
    }
    
    var isEmpty:Bool { return elements.isEmpty }
    var count:Int { return elements.count }
    
    func peak()->Element?{
        elements.first
    }
    func leftChildIndex(ofParentAt index:Int)->Int{
        (2 * index) + 1
    }
    func rightChildIndex(ofParentAt index:Int)->Int{
        (2 * index) + 2
    }
    func parentIndex(ofChildAt index:Int)->Int{
        (index - 1) / 2
    }
    mutating func remove()->Element?{
        guard !isEmpty else { return nil }
        elements.swapAt(0, count - 1)
        defer{
            siftDown(from:0)
        }
        return elements.removeLast()
    }
    
    mutating func siftDown(from index: Int) {
      var parent = index
      while true {
        let left = leftChildIndex(ofParentAt: parent)
        let right = rightChildIndex(ofParentAt: parent)
        var candidate = parent
        if left < count && sort(elements[left], elements[candidate]) {
          candidate = left
        }
        if right < count && sort(elements[right], elements[candidate]) {
          candidate = right
        }
        if candidate == parent {
          return
        }
        elements.swapAt(parent, candidate)
        parent = candidate
      }
    }
    
    mutating func insert(_ element: Element){
        elements.append(element)
        siftUp(from: elements.count - 1)
    }
    mutating func siftUp(from index:Int){
        var child = index
        var parent = parentIndex(ofChildAt: child)
        while child > 0 && sort(elements[child], elements[parent]){
            elements.swapAt(child, parent)
            child = parent
            parent = parentIndex(ofChildAt: child)
        }
    }
    func index(of element: Element, startingAt i: Int) -> Int? {
      if i >= count { return nil }
      if sort(element, elements[i]) { return nil }
      if element == elements[i] { return i  }
      if let j = index(of: element, startingAt: leftChildIndex(ofParentAt: i)) {
        return j
      }
      if let j = index(of: element, startingAt: rightChildIndex(ofParentAt: i)) {
        return j
      }
      return nil
    }
    
}


class MedianFinder {
    var maxHeap = Heap(sort: >, elements: [0])
    var minHeap = Heap(sort: <, elements: [0])
    init() {
        self.maxHeap.elements = []
        self.minHeap.elements = []
    }
    func addNum(_ num:Int){
        if self.maxHeap.isEmpty || self.maxHeap.count == self.minHeap.count{
            self.maxHeap.insert(num)
            return
        }else{
            if (self.maxHeap.count - self.minHeap.count) > 0{
                if self.maxHeap.peak()! > num {
                    self.minHeap.insert(self.maxHeap.remove()!)
                    self.maxHeap.insert(num)
                }else{
                    self.minHeap.insert(num)
                }
            }else{
                if self.maxHeap.peak()! < num {
                    self.maxHeap.insert(num)
                }else{
                    self.minHeap.insert(num)
                }
            }
        }
    }
    func findMedian()->Double{
        if self.minHeap.count < 1 { return Double(self.maxHeap.peak()!) }
        if self.maxHeap.peak()! > self.minHeap.peak()!{
            let tmp = self.minHeap.remove()!
            self.minHeap.insert(self.maxHeap.remove()!)
            self.maxHeap.insert(tmp)
        }
        if self.maxHeap.count > self.minHeap.count{
            return Double(self.maxHeap.peak()!)
        }else{
            return (Double(self.maxHeap.peak()!) + Double(self.minHeap.peak()!)) / 2
        }
    }
}


var obj = MedianFinder()
obj.addNum(-1)
obj.findMedian()
obj.addNum(-2)
obj.findMedian()
obj.addNum(-3)
obj.findMedian()
obj.addNum(-4)
obj.findMedian()
obj.addNum(-5)
obj.findMedian()
//[-1.00000,-1.50000,-2.00000,-2.50000,-3.00000]

obj = MedianFinder()
obj.addNum(1)
obj.findMedian()
obj.addNum(2)
obj.findMedian()
obj.addNum(3)
obj.findMedian()
//[-1.00000,-1.50000,-2.00000,-2.50000,-3.00000]


