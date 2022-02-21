import UIKit

func inFlight(_ currTime: Int,_ flight:[Int])->Int{
    if currTime >= flight[0] && currTime <= flight[1]{
        return 1
    }
    return 0
}

func getMaxInflights(_ flights:[[Int]])->Int{
    var inflightHash:[Int] = Array(repeating: 0, count: flights.count)
    var maxPlane=0
    
    for curTime in stride(from: 0, through: 24, by: 1){
        for idx in 0...flights.count-1{
            inflightHash[idx] = inFlight(curTime, flights[idx])
        }
        let currInFlight = inflightHash.reduce(0, +)
        if currInFlight > maxPlane{
            maxPlane = currInFlight
        }
    }
    return maxPlane
}

let flights:[[Int]] = [
    [2,5],
    [9,12],
    [9,14],
    [11,16],
    [13,22]
]
let flights2:[[Int]] = [
    [2,5],
    [3,7],
    [8,9]
]
let flights3:[[Int]] = [
    [4,8],
    [2,5],
    [17,20],
    [10,21],
    [9,18],
    [4,8],
    [2,5],
    [17,20],
    [10,21],
    [9,18],
    [4,8],
    [2,5],
    [17,20],
    [10,21],
    [9,18],
    [4,8],
    [2,5],
    [17,20],
    [10,21],
    [9,18],
    [4,8],
    [2,5],
    [17,20],
    [10,21],
    [9,18],
    [4,8],
    [2,5],
    [17,20],
    [10,21],
    [9,18],
    [4,8],
    [2,5],
    [17,20],
    [10,21],
    [9,18]
]

let maxFlight = getMaxInflights(flights3)

print("Input \(flights3) \n\nThere are a maximum of \(maxFlight) flights at any given time.")


