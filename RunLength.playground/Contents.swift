import UIKit


func compressUsingRunLength(_ input:String)->String{
    var returnValue = ""
    
    if input.isEmpty { return returnValue }
    
    let inputArr = input.map({ String($0) })
    var pastString:String = ""
    var count:Int = 0
    
    for currChar in inputArr{
        if currChar != pastString{
            if count > 0 {
                returnValue.append(String(count))
                returnValue.append(pastString)
            }
            pastString = currChar
            count=1
        }else{
            count+=1
        }
    }
    returnValue.append(String(count))
    returnValue.append(pastString)
    return returnValue
}
func decompressFromRunLength(_ compressed:String)->String{
    guard compressed.count > 0 else { return "" }
    var resultingString = ""
    var count:Int = 0
    
    for n in compressed{
        if let numeric = Int(String(n)){
            if count == 0{
                count = numeric
            }else{
                count = (count * 10) + numeric
            }
        }else{
            guard count > 0 else { return "-1" }
            for _ in 0..<count{
                resultingString.append(n)
            }
            count=0
        }
    }
    return resultingString
}

let compressed1 = compressUsingRunLength("aaaabbbbcdeeeeffgg") // "4a4b1c1d4e2f2g"
let compressed2 = compressUsingRunLength("") // ""
let compressed3 = compressUsingRunLength("aacb") // "2a1c1b"
let compressed4 = compressUsingRunLength("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") // "33a"

let decompressed1 = decompressFromRunLength(compressed1) // "aaaabbbbcdeeeeffgg"
let decompressed2 = decompressFromRunLength(compressed2) // ""
let decompressed3 = decompressFromRunLength(compressed3) // "aacb"
let decompressed4 = decompressFromRunLength(compressed4) // "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
