import UIKit



func sortOnesAndZeros(_ array:[Int])->[Int]{
    // Naive way
    // print(Array(array.sorted().reversed())) // O(nlogn) S(n + n)
    
    // Efficient way O(logn) S(1)
    var i:Int = 0
    var j:Int = array.count-1
    var result = array
    
    while i < j {
        if result[i] < result[j]{
            let right = result[j]
            result[j] = result[i]
            result[i] = right
            i+=1
            j-=1
        }else if result[i] > result[j]{
            i+=1
            j-=1
        }else{
            if result[i] == 0{
                j-=1
            }else{
                i+=1
            }
        }
    }
    return result
}

sortOnesAndZeros([1,0,1,0,0,1,1,0,0,1])
