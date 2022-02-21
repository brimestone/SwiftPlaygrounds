import UIKit

struct RotationalCipher {
  let backing: String

  func cipher(withRotationFactor: Int) -> String {
      if self.backing.isEmpty{
          return ""
      }
      let letters:[String.Element] = Array("abcdefghijklmnopqrstuvwxyz")
      let numbers:[String.Element] = Array("0123456789")
      var result:String = String()
      
      for n in Array(self.backing){
          let isUpper = n.isUppercase
          let loweredN = Character(n.lowercased())
          
          if let indexN = letters.firstIndex(of: loweredN){
              let newIndex = (indexN + withRotationFactor) % letters.count
              if isUpper{
                  result.append(letters[newIndex].uppercased())
              }else{
                  result.append(letters[newIndex])
              }
          }else if let indexN = numbers.firstIndex(of: loweredN){
              let newIndex = (indexN + withRotationFactor) % numbers.count
              result.append(numbers[newIndex])
          }else{
              result.append(n)
          }
      }
      return result
  }
}

RotationalCipher(backing: "Zebra-493?").cipher(withRotationFactor: 3) //Cheud-726?
RotationalCipher(backing: "All-convoYs-9-be:Alert1.").cipher(withRotationFactor: 4) // Epp-gsrzsCw-3-fi:Epivx5.
