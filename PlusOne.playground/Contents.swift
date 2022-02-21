import UIKit

class Solution1{
    func plusOne(_ digits: [Int]) -> [Int] {
        let value = arrayToInt(digits) + 1
        return intToArray(value)
    }
    func arrayToInt(_ digits: [Int])->UInt64{
        var converted:UInt64 = 0
        for n in digits{
            print(n, converted)
            converted = 10 * converted + UInt64(n)
        }
        return converted
    }
    func intToArray(_ value:UInt64)->[Int]{
        var remainder:UInt64 = value
        var returnArr:[Int] = [Int]()
        
        while remainder > 0{
            returnArr.insert(Int(remainder % 10), at: 0)
            remainder /= 10
        }
        return returnArr
    }

}

class Solution2{
    func plusOne(_ digits:[Int])->[Int]{
        var lowToHigh = Array(digits.reversed())
        var carryOne:Bool = false
        var idx:Int = 0
        print(lowToHigh)
        repeat{
            if idx >= lowToHigh.count{
                lowToHigh.append(1)
                carryOne=false
            }else{
                let sum:Int = lowToHigh[idx] + 1
                if sum > 9{
                    lowToHigh[idx] = 0
                    carryOne=true
                    idx+=1
                }else{
                    lowToHigh[idx] += 1
                    carryOne=false
                }
            }
            print(lowToHigh)
        }while(carryOne)
        
        return Array(lowToHigh.reversed())
    }
    
}
let solution1 = Solution1()
//solution1.plusOne([1,2,3])
////solution1.plusOne([7,2,8,5,0,9,1,2,9,5,3,6,6,7,3,2,8,4,3,7,9,5,7,7,4,7,4,9,4,7,0,1,1,1,7,4,0,0,6])
///
///
let solution2 = Solution2()
solution2.plusOne([9,9,9])

let intMaxPlaces = solution1.intToArray(UInt64.max)
print(intMaxPlaces.count)
