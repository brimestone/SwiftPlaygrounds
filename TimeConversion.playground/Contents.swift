import UIKit


func timeConversion(s: String) -> String {
    let characters = Array(s)
    if let hour = Int(String(characters[0..<2])){
        
        var convertedHour = hour
        let minutes = String(characters[3..<5])
        let seconds = String(characters[6..<8])
        let ampm = String(characters[8..<10])
        if ampm == "AM"{
            if convertedHour > 11{
                convertedHour-=12
            }
        }else{
            if convertedHour < 12{
                convertedHour+=12
            }
            
        }
        return [convertedHour < 10 ? "0\(String(convertedHour))": String(convertedHour), minutes, seconds].joined(separator: ":")
    }
    return ""
}

print(timeConversion(s: "12:35:23AM"))
print(timeConversion(s: "12:00:00AM"))
print(timeConversion(s: "06:40:03AM"))
print(timeConversion(s: "12:40:22AM"))
print(timeConversion(s: "07:05:45PM"))

print(timeConversion(s: "11:35:23PM"))

print(timeConversion(s: "12:45:54PM"))





