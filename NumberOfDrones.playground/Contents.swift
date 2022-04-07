import Foundation


func getMinimumDroneCount(toDeliver packages:[Int], inTimeWindow timeWindow:Int) -> Int{
    guard timeWindow >= packages.max()! else { return -1 }
    var droneCount:Int = 0
    let totalFlightTime:Int = packages.reduce(0,+)
    droneCount = packages.count
    
    while (droneCount * timeWindow) >= totalFlightTime {
        droneCount-=1
    }
    droneCount+=1
    // Handle edge case
    if (timeWindow / 2 < packages.min()!) && droneCount < packages.count{
        droneCount+=1
    }
    
    return droneCount
}

print(getMinimumDroneCount(toDeliver: [1,1,1,1], inTimeWindow: 1)) // 4
print(getMinimumDroneCount(toDeliver: [1,1,1,1], inTimeWindow: 2)) // 2
print(getMinimumDroneCount(toDeliver: [1,1,1,1], inTimeWindow: 3)) // 2
print(getMinimumDroneCount(toDeliver: [1,1,1,1], inTimeWindow: 4)) // 1
print(getMinimumDroneCount(toDeliver: [3,6,7,11], inTimeWindow: 11)) // 3
print(getMinimumDroneCount(toDeliver: [10,10,10,10], inTimeWindow: 11)) // 4

/* EndCases */
print(getMinimumDroneCount(toDeliver: [3,3,3,3], inTimeWindow: 6)) // 4
print(getMinimumDroneCount(toDeliver: [2,2,2,2], inTimeWindow: 3)) // 4









  
