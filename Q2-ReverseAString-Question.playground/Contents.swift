import UIKit

// https://www.fullstack.cafe/interview-questions/stacks

/*
 Giving a String, write a function that reserves the String
 using a stack.
 */


func solution(_ text: String) -> String {
    var reversedString:String = ""
    for c in text{
        reversedString = "\(c)\(reversedString)"
    }
    return reversedString
}
func solution2(_ text: String) -> String {
    // O(n^2) because insert operation is O(n) nested inside an O(n) loop
    var tmpArr:[String] = [String]()
    
    for element in text{ // O(n)
        tmpArr.insert(String(element), at: 0) // O(n)
    }
    return tmpArr.joined(separator: "")
}

func solution3(_ text:String) -> String{
    var tmpText = text
    var reverseString:[String.Element] = Array(repeating: " ", count: text.count)
    
    for n in 0..<tmpText.count{
        reverseString[n] = tmpText.popLast()!
    }
    return String(reverseString)
}


solution3("abc") // bca
solution3("Would you like to play a game?")
